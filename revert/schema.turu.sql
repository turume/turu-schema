-- Revert turu.schema

BEGIN;

  DROP TYPE IF EXISTS turu.device_type;
  DROP TYPE IF EXISTS turu.event_type;
  DROP TYPE IF EXISTS turu.description_type;

COMMIT;
