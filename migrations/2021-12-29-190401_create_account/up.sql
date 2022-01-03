CREATE TABLE IF NOT EXISTS "account" (
  "id" BIGSERIAL PRIMARY KEY,
  "client_id" BIGINT NOT NULL REFERENCES "client"("id") ON DELETE CASCADE,
  "role_id" BIGINT NOT NULL REFERENCES "role"("id") ON DELETE SET NULL,
  "avatar" TEXT,
  "prefix" VARCHAR(50),
  "first_name" VARCHAR(50),
  "middle_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "suffix" VARCHAR(50),
  "pwd_hash" VARCHAR(255),
  "email" VARCHAR(255),
  "email_verified" BOOLEAN DEFAULT FALSE,
  "phone_number" VARCHAR(255),
  "topt_secret" VARCHAR(255),
  "mfa_enabled" BOOLEAN DEFAULT TRUE,
  "self_password_reset" BOOLEAN DEFAULT FALSE,
  "pwd_last_updated" TIMESTAMP,
  "enc_key" TEXT,
  "notify_on_suspicious_login" BOOLEAN DEFAULT TRUE,
  "notify_on_pwd_reset" BOOLEAN DEFAULT TRUE,
  "notify_on_email_change" BOOLEAN DEFAULT TRUE,
  "notify_on_mfa_change" BOOLEAN DEFAULT TRUE,
  "notify_on_phone_number_change" BOOLEAN DEFAULT TRUE,
  "notify_on_comment" BOOLEAN DEFAULT TRUE,
  "notification_frequency" VARCHAR(255) DEFAULT 'on_event', -- hourly, daily, weekly
  "archived" BOOLEAN DEFAULT FALSE
);

CREATE INDEX IF NOT EXISTS "idx_account_client" ON "account"("client_id");
CREATE INDEX IF NOT EXISTS "idx_account_role" ON "account"("role_id");
