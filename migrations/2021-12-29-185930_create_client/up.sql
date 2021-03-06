CREATE TABLE IF NOT EXISTS "client" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(1024) NOT NULL,
  "unique_id" VARCHAR(1024) NOT NULL,
  "session_key" VARCHAR(255) NOT NULL,
  "session_key_last_rotation" TIMESTAMP NOT NULL,
  "enable_payload_encryption" BOOLEAN DEFAULT FALSE,
  "payload_encryption_key" TEXT,
  "encryption_key" TEXT,
  "admin_email" VARCHAR(255) NOT NULL,
  "website" VARCHAR(255),
  "registered_on" TIMESTAMP NOT NULL,
  "expires_on" TIMESTAMP,
  "welcome_template" TEXT,
  "min_pwd_len" INTEGER DEFAULT 12,
  "max_pwd_len" INTEGER,
  "numeric_chars" INTEGER DEFAULT 1,
  "lowercase_chars" INTEGER DEFAULT 1,
  "uppercase_chars" INTEGER DEFAULT 1,
  "special_chars" INTEGER DEFAULT 1,
  "special_char_set" VARCHAR(50),
  "require_email_validation" BOOLEAN DEFAULT TRUE,
  "self_service_pwd_reset" BOOLEAN DEFAULT FALSE,
  "pwd_reused" INTEGER,
  "max_pwd_age" INTEGER DEFAULT 90,
  "enforce_mfa" BOOLEAN DEFAULT TRUE,
  "whitelist_cidrs" TEXT[],
  "trusted_cidrs" TEXT[],
  "session_interval" VARCHAR(50) DEFAULT '1h',
  "session_key_rotation" INTEGER DEFAULT 30,
  "data_key_rotation" INTEGER DEFAULT 365,
  "allow_username_reminder" BOOLEAN DEFAULT TRUE,
  "allow_multiple_sessions" BOOLEAN DEFAULT FALSE,
  "max_approval_wait_time" VARCHAR(50) DEFAULT '1h',
  "approval_duration" VARCHAR(50) DEFAULT '8h',
  "brute_force_protection" BOOLEAN DEFAULT TRUE,
  "suspicious_ip_limit" INTEGER DEFAULT 5,
  "suspicious_ip_throttle" VARCHAR(50) DEFAULT '1h'
);
