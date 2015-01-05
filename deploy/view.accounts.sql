-- Deploy view.accounts
-- requires: schema.api1
-- requires: schema.turu

BEGIN;

  CREATE VIEW "1".accounts AS

    SELECT
      a.id,
      a.email,
      a.first_name,
      a.last_name,
      a.nickname,
      a.language,
      a.phone_number,
      a.is_admin,
      ad.device_id AS devices

    FROM
      turu.accounts AS a

    INNER JOIN
      turu.accounts_devices ad ON (a.id=ad.account_id)

    WHERE
      a.owner = "current_user"()
      AND a.is_actve=TRUE;

COMMIT;
