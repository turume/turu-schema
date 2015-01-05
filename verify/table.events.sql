-- Verify events

BEGIN;

SELECT * FROM turu.events WHERE FALSE;

ROLLBACK;
