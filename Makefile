.PHONY: default
default: help

.PHONY: help
help: ## help information about make commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: test
test: ## run unit tests
	cargo test

.PHONY: test-cover
test-cover: test ## run unit tests and show test coverage information
	docker run -it --rm --security-opt seccomp=unconfined --volume "${PWD}":/volume --workdir /volume ddimaria/rust-kcov:1.37 --exclude-pattern=/.cargo,/usr/lib,/src/main.rs,src/server.rs

.PHONY: run
run: ## run the API server
	cargo run

.PHONY: run-restart
run-restart: ## restart the API server
	@pkill -P `cat $(PID_FILE)` || true
	@printf '%*s\n' "80" '' | tr ' ' -
	@echo "Source file changed. Restarting server..."
	@go run ${LDFLAGS} cmd/server/main.go & echo $$! > $(PID_FILE)
	@printf '%*s\n' "80" '' | tr ' ' -

run-watch: ## run the API server with live reload support (requires fswatch)
	systemfd --no-pid -s http::3000 -- cargo watch -x run

.PHONY: build
build:  ## build the API server binary
	cargo build --release

.PHONY: build-docker
build-docker: ## build the API server as a docker image
	docker build -t autally .

.PHONY: docker-run
docker-run:
	docker run -it --rm --env-file=.env.docker -p 3000:3000 --name autally autally

.PHONY: clean
clean: ## remove temporary files
	cargo clean

.PHONY: db-start
db-start: ## start the database server
	@mkdir -p testdata/postgres
	docker run --rm --name postgres -v $(shell pwd)/testdata:/testdata \
		-v $(shell pwd)/testdata/postgres:/var/lib/postgresql/data \
		-e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password \
		-e POSTGRES_DB=codegardner -d -p 5432:5432 postgres

.PHONY: db-stop
db-stop: ## stop the database server
	docker stop postgres

.PHONY: db-clean
db-clean: ## clean the database data
	rm -rf $(shell pwd)/testdata/*

.PHONY: testdata
testdata: ## populate the database with test data
	make migrate-reset
	@echo "Populating test data..."
	@docker exec -it postgres psql "$(APP_DSN)" -f /testdata/testdata.sql

.PHONY: migrate
migrate: ## run all new database migrations
	@echo "Running all new database migrations..."
	diesel migration run

.PHONY: migrate-down
migrate-down: ## revert database to the last migration step
	@echo "Reverting database to the last migration step..."
	diesel migration redo

.PHONY: migrate-new
migrate-new: ## create a new database migration
	@read -p "Enter the name of the new migration: " name; \
	diesel migration generate $${name// /_}

.PHONY: migrate-reset
migrate-reset: ## reset database and re-run all migrations
	@echo "Resetting database..."
	make db-stop
	make db-clean
	make db-start
	make migrate
