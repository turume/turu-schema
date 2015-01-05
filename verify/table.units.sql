-- Verify units

BEGIN;

SELECT * FROM turu.units WHERE FALSE;

ROLLBACK;
