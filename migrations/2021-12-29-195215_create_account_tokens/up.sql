CREATE TABLE IF NOT EXISTS "account_tokens" (
  "account_id" BIGINT REFERENCES "account"("id") ON DELETE CASCADE,
  "type" VARCHAR(100),
  "token" VARCHAR(255),
  "token_exp" TIMESTAMP,
  PRIMARY KEY ("account_id","type")
);

CREATE INDEX IF NOT EXISTS "idx_account_tokens_account" ON "account_tokens"("account_id");
