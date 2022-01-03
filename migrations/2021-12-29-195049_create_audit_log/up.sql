CREATE TABLE IF NOT EXISTS "audit_log" (
  "id" BIGSERIAL PRIMARY KEY,
  "client_id" BIGINT NOT NULL REFERENCES "client"("id") ON DELETE CASCADE,
  "entity_id" BIGINT,
  "entity_type" VARCHAR(100),
  "operation" VARCHAR(100) ,
  "info" TEXT,
  "generated_on" TIMESTAMP DEFAULT (NOW()),
  "generated_by" BIGINT,
  "ip" VARCHAR(100),
  "country_code" VARCHAR(15)
);

CREATE INDEX IF NOT EXISTS "idx_audit_log_client" ON "audit_log"("client_id");
