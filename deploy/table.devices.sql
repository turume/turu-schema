-- Deploy devices
-- requires: turu.schema
-- requires: turu.metrics

BEGIN;


  CREATE TABLE turu.devices (
    id uuid primary key default uuid_generate_v4(),
    description_id uuid references turu.descriptions(id) NOT NULL,

    -- TODO: type should check vs an array of acceptable strings
    type turu.device_type DEFAULT NUll,
    last_value double precision NOT NULL,
    ident character varying(256) DEFAULT NULL,
    sw_version character varying(8) DEFAULT '0.0.0',
    hw_version character varying(8) DEFAULT '0.0.0',
    rules json DEFAULT '{}',
    owner name NOT NULL,

    -- handle create and update
    updated_at time with time zone not NULL DEFAULT CURRENT_TIMESTAMP,
    created_at time with time zone not NULL DEFAULT now()
  );

  -- activate row leve auth for accounts
  CREATE TRIGGER devices_owner_track
    BEFORE INSERT OR UPDATE
    ON turu.devices
    FOR EACH ROW
    EXECUTE PROCEDURE postgrest.update_owner();

  INSERT INTO turu.devices (
    id,
    description_id,
    type,
    last_value,
    sw_version,
    hw_version,
    rules,
    updated_at,
    created_at
  ) VALUES (
    'baae6679-6b2c-42ea-88da-f477fb0eef69',
    'c2569595-d22e-410d-aa20-b2601ae172fb',
    'temp',
    110,
    '0.0.13',
    '0.0.2',
    '{"upper_bound": 100, "lower_bound": 40}',
    '2014-12-18 01:47:59.367507',
    '2014-12-18 01:47:59.367507'
  );

COMMIT;
