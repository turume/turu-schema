-- Deploy mtm.accounts_devices
-- requires: schema.turu

BEGIN;

  CREATE TABLE turu.accounts_devices (
    account_id uuid references turu.accounts(id) NOT NULL,
    device_id uuid references turu.devices(id) NOT NULL,
    description_id uuid references turu.devices(id) NOT NULL,
    is_active boolean DEFAULT TRUE,
    created_at time with time zone NOT NULL DEFAULT now()
  );

COMMIT;
