CREATE TABLE IF NOT EXISTS "policy" (
  "id" BIGSERIAL PRIMARY KEY,
  "client_id" BIGINT NOT NULL REFERENCES "client"("id") ON DELETE CASCADE,
  "role_id" BIGINT NOT NULL REFERENCES "role"("id") ON DELETE CASCADE,
  "name" VARCHAR(255),
  "description" TEXT,
  "type" VARCHAR(255),
  "invert_actions" BOOLEAN DEFAULT FALSE,
  "actions" TEXT[],
  "invert_resources" BOOLEAN DEFAULT FALSE,
  "resources" TEXT[],
  "invert_fields" BOOLEAN DEFAULT FALSE,
  "fields" TEXT[],
  "ip" TEXT[],
  "mfa_required" BOOLEAN DEFAULT TRUE
);

CREATE INDEX IF NOT EXISTS "idx_policy_client" ON "policy"("client_id");
CREATE INDEX IF NOT EXISTS "idx_policy_role" ON "policy"("role_id");
