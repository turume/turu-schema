-- Verify metrics

BEGIN;

SELECT * FROM turu.metrics WHERE FALSE;

ROLLBACK;
