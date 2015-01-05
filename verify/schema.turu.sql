-- Verify turu.schema

BEGIN;

SELECT pg_catalog.has_schema_privilege('turu', 'usage');

ROLLBACK;
