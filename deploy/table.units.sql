-- Deploy units
-- requires: turu.schema

BEGIN;

  CREATE TABLE turu.units (
    id uuid primary key DEFAULT uuid_generate_v4(),
    description_id uuid references turu.descriptions(id) NOT NULL,

    short_name character varying(64) DEFAULT NUll,
    long_name character varying(256) DEFAULT NUll,

    -- handle create and update
    updated_at time with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at time with time zone NOT NULL DEFAULT now()
  );

  INSERT INTO turu.units (
    id,
    description_id,
    short_name,
    long_name,
    updated_at,
    created_at
  ) VALUES (
    '24bc24e1-e554-45b7-9d59-36ac491d80e2',
    'c9faca62-4a08-4323-8d4e-b815bec80f6d',
    'Fahrenheit',
    'F',
    '2014-12-18 01:47:59.367507',
    '2014-12-18 01:47:59.367507'
  );

COMMIT;
