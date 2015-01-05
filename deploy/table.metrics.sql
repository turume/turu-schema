-- Deploy metrics
-- requires: turu.schema

BEGIN;

  CREATE TABLE turu.metrics (
    id uuid primary key DEFAULT uuid_generate_v4(),
    device_id uuid references turu.devices(id) NOT NULL,
    description_id uuid references turu.descriptions(id),
    unit_id uuid references turu.units(id) NOT NULL,
    owner name NOT NULL,

    value double precision NOT NULL,
    sw_version character varying(8) DEFAULT '0.0.0',
    hw_version character varying(8) DEFAULT '0.0.0',

    -- handle create and update
    updated_at time with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at time with time zone NOT NULL DEFAULT now()
  );

  -- activate row leve auth for accounts
  CREATE TRIGGER metrics_owner_track
    BEFORE INSERT OR UPDATE
    ON turu.metrics
    FOR EACH ROW
    EXECUTE PROCEDURE postgrest.update_owner();

  INSERT INTO turu.metrics (
    device_id,
    description_id,
    unit_id,
    sw_version,
    hw_version,
    value
  ) VALUES (
    'baae6679-6b2c-42ea-88da-f477fb0eef69', -- device id
    '71e94939-57fb-424d-bf62-df2c36140913', -- description id
    '24bc24e1-e554-45b7-9d59-36ac491d80e2', -- unit id
    '0.0.13',
    '0.0.2',
    110
  );

  INSERT INTO turu.metrics (
    device_id,
    unit_id,
    sw_version,
    hw_version,
    value
  ) VALUES (
    'baae6679-6b2c-42ea-88da-f477fb0eef69', -- device id
    '24bc24e1-e554-45b7-9d59-36ac491d80e2', -- unit id
    '0.0.13',
    '0.0.2',
    110
  );



  INSERT INTO turu.metrics (
    device_id,
    description_id,
    unit_id,
    sw_version,
    hw_version,
    value
  ) VALUES (
    'baae6679-6b2c-42ea-88da-f477fb0eef69', -- device id
    '71e94939-57fb-424d-bf62-df2c36140913', -- description id
    '24bc24e1-e554-45b7-9d59-36ac491d80e2', -- unit id
    '0.0.13',
    '0.0.2',
    70
  );


  INSERT INTO turu.metrics (
    device_id,
    description_id,
    unit_id,
    sw_version,
    hw_version,
    value
  ) VALUES (
    'baae6679-6b2c-42ea-88da-f477fb0eef69', -- device id
    '71e94939-57fb-424d-bf62-df2c36140913', -- description id
    '24bc24e1-e554-45b7-9d59-36ac491d80e2', -- unit id
    '0.0.13',
    '0.0.2',
    50
  );



COMMIT;
