-- Revert devices

BEGIN;

  DROP TYPE turu.device_type;
  DROP TABLE turu.devices;

COMMIT;

