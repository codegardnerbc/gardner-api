CREATE TABLE IF NOT EXISTS "role" (
  "id" BIGSERIAL PRIMARY KEY,
  "client_id" BIGINT NOT NULL REFERENCES "client"("id") ON DELETE CASCADE,
  "name" VARCHAR(255) NOT NULL,
  "description" TEXT,
  "system_only" BOOLEAN DEFAULT FALSE,
  "archived" BOOLEAN DEFAULT FALSE
);

CREATE INDEX IF NOT EXISTS "idx_role_client" ON "role"("client_id");
