-- Revert view.device

BEGIN;

  DROP TABLE "1".devices;

COMMIT;
