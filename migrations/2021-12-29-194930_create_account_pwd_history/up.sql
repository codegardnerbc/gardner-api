CREATE TABLE IF NOT EXISTS "account_pwd_history" (
  "account_id" BIGINT NOT NULL REFERENCES "account"("id") ON DELETE CASCADE,
  "pwd" VARCHAR(1024) NOT NULL,
  "last_used_on" TIMESTAMP DEFAULT (NOW()),
  PRIMARY KEY ("account_id","pwd")
);

CREATE INDEX IF NOT EXISTS "idx_account_pwd_history_account" ON "account_pwd_history"("account_id");
