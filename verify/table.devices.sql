-- Verify devices

BEGIN;

SELECT * FROM turu.devices WHERE FALSE;

ROLLBACK;
