-- Deploy descriptions
-- requires: turu.schema

BEGIN;

  CREATE TABLE turu.descriptions (
    id uuid primary key DEFAULT uuid_generate_v4(),
    type turu.description_type NOT NULL,
    is_editable boolean DEFAULT TRUE,
    language character varying DEFAULT 'en_US',
    title character varying(256),
    body character varying(2048),
    owner name NOT NULL,

    -- handle create and update
    updated_at time with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at time with time zone NOT NULL DEFAULT now()
  );

  -- activate row leve auth for accounts
  CREATE TRIGGER descriptions_owner_track
    BEFORE INSERT OR UPDATE
    ON turu.descriptions
    FOR EACH ROW
    EXECUTE PROCEDURE postgrest.update_owner();

  INSERT INTO turu.descriptions (
    id,
    type,
    is_editable,
    language,
    title,
    body,
    updated_at,
    created_at
  ) VALUES (
    'c2569595-d22e-410d-aa20-b2601ae172fb',
    'device',
    TRUE,
    'en_EN',
    'Temperaton',
    'Yup, I just checked. Its a temperature sensor.',
    '2014-12-18 01:47:59.367507',
    '2014-12-18 01:47:59.367507'
  );

  INSERT INTO turu.descriptions (
    id,
    type,
    is_editable,
    language,
    title,
    body,
    updated_at,
    created_at
  ) VALUES (
    '71e94939-57fb-424d-bf62-df2c36140913',
    'metric',
    TRUE,
    'en_EN',
    'Annotation',
    'This reading is annotated.',
    '2014-12-18 01:47:59.367507',
    '2014-12-18 01:47:59.367507'
  );

  INSERT INTO turu.descriptions (
    id,
    type,
    is_editable,
    language,
    title,
    body,
    updated_at,
    created_at
  ) VALUES (
    'c9faca62-4a08-4323-8d4e-b815bec80f6d',
    'unit',
    TRUE,
    'en_EN',
    'Fahrenheit',
    'English measurement for heat.',
    '2014-12-18 01:47:59.367507',
    '2014-12-18 01:47:59.367507'
  );


COMMIT;
