-- Deploy mtm.devices_devices
-- requires: schema.turu

BEGIN;

  CREATE TABLE turu.devices_devices (
    parent_id uuid references turu.devices(id) NOT NULL,
    child_id uuid references turu.devices(id) NOT NULL,
    description_id uuid references turu.devices(id) NOT NULL,
    created_at time with time zone NOT NULL DEFAULT now()
  );

COMMIT;
