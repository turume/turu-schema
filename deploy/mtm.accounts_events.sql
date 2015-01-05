-- Deploy mtm.accounts_events
-- requires: schema.turu

BEGIN;

  CREATE TABLE turu.accounts_events (
    account_id uuid references turu.accounts(id) NOT NULL,
    event_id uuid references turu.events(id) NOT NULL,

    -- handle create and update
    created_at time with time zone NOT NULL DEFAULT now()
  );

COMMIT;
