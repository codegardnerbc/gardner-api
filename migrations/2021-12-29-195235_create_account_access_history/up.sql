CREATE TABLE IF NOT EXISTS "account_access_history" (
  "id" BIGSERIAL PRIMARY KEY,
  "client_id" BIGINT NOT NULL REFERENCES "client"("id") ON DELETE CASCADE,
  "session_id" BIGINT,
  "account_id" BIGINT NOT NULL REFERENCES "account"("id") ON DELETE CASCADE,
  "ip" VARCHAR(100),
  "operating_system" VARCHAR(255),
  "mobile" BOOLEAN,
  "platform" VARCHAR(255),
  "engine_name" VARCHAR(255),
  "engine_version" VARCHAR(255),
  "browser_name" VARCHAR(255),
  "browser_version" VARCHAR(255),
  "localization" VARCHAR(255),
  "country_code" VARCHAR(15),
  "region" VARCHAR(255),
  "city" VARCHAR(255),
  "latitude" FLOAT,
  "longitude" FLOAT,
  "login" TIMESTAMP,
  "total_session" INTEGER
);

CREATE INDEX IF NOT EXISTS "idx_account_access_history_client" ON "account_access_history"("client_id");
CREATE INDEX IF NOT EXISTS "idx_account_access_history_account" ON "account_access_history"("account_id");
