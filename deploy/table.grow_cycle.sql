-- Deploy grow_cycle
-- requires: turu.schema

BEGIN;

  CREATE TABLE turu.grow_cycles (
    id uuid primary key default uuid_generate_v4(),
    description_id uuid references turu.devices(id) NOT NULL,
    unit_id uuid references turu.units(id) NOT NULL,

    -- TODO: build list of possible crops
    -- crop_id uuid references turu.crops(id) NOT NULL,

    yield double precision NOT NULL,
    plants_total integer NOT NULL DEFAULT 1 CHECK(plants_total <> 0),

    -- handle create and update
    start_date time with time zone NOT NULL,
    end_date time with time zone NOT NULL,

    updated_at time with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at time with time zone NOT NULL DEFAULT now()
  );

  -- activate row leve auth for accounts
  CREATE TRIGGER growcycles_owner_track
    BEFORE INSERT OR UPDATE
    ON turu.grow_cycles
    FOR EACH ROW
    EXECUTE PROCEDURE postgrest.update_owner();


COMMIT;
