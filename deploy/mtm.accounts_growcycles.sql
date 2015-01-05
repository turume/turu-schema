-- Deploy mtm.accounts_growcycles
-- requires: schema.turu

BEGIN;

  CREATE TABLE turu.accounts_growcycles (
    account_id uuid references turu.accounts(id) NOT NULL,
    growcycle_id uuid references turu.grow_cycles(id) NOT NULL,
    description_id uuid references turu.devices(id) NOT NULL,
    is_active boolean DEFAULT TRUE,
    created_at time with time zone NOT NULL DEFAULT now()
  );

COMMIT;
