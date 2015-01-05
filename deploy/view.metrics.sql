-- Deploy view.metrics
-- requires: schema.api1

BEGIN;

  CREATE VIEW "1".metrics AS

    SELECT
      m.id,
      m.device_id,
      m.sw_version,
      m.hw_version,
      m.value,
      unit.short_name,
      unit.long_name,
      des.title,
      des.body,
      m.created_at

    FROM
      turu.metrics AS m

    INNER JOIN
      turu.descriptions des ON (m.description_id=des.id)

    INNER JOIN
      turu.units unit ON (unit.id = m.unit_id)

    WHERE m.owner = "current_user"();

COMMIT;
