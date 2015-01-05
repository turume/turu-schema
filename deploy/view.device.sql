-- Deploy view.device
-- requires: schema.api1

BEGIN;

  CREATE VIEW "1".devices AS

    SELECT
      d.id,
      d.sw_version,
      d.hw_version,
      d.last_value,
      d.type,
      d.rules,
      des.title,
      des.body,
      d.created_at

    FROM turu.devices AS d

    INNER JOIN 
      turu.descriptions des ON (d.description_id=des.id)

    WHERE d.owner = "current_user"();

COMMIT;
