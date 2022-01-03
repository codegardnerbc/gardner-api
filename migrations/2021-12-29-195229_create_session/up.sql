CREATE TABLE IF NOT EXISTS "session" (
  "id" BIGSERIAL PRIMARY KEY,
  "uid" VARCHAR(255) NOT NULL,
  "client_id" BIGINT NOT NULL REFERENCES "client"("id") ON DELETE CASCADE,
  "account_id" BIGINT NOT NULL REFERENCES "account"("id") ON DELETE CASCADE,
  "mfa_state" VARCHAR(50) NOT NULL,
  "access_token" VARCHAR(255),
  "refresh_token" VARCHAR(255),
  "signing_key" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMP NOT NULL DEFAULT (NOW()),
  "last_activity_at" TIMESTAMP,
  "expires_at" TIMESTAMP NOT NULL,
  "user_agent" VARCHAR(255),
  "ip" VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS "idx_session_client" ON "session"("client_id");
CREATE INDEX IF NOT EXISTS "idx_session_account" ON "session"("account_id");
