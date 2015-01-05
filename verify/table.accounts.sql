-- Verify accounts

BEGIN;

SELECT * FROM turu.accounts WHERE FALSE;

ROLLBACK;
