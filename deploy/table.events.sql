-- Deploy events
-- requires: turu.schema

BEGIN;

  CREATE TABLE turu.events (
    id uuid primary key default uuid_generate_v4(),
    device_id uuid references turu.devices(id) NOT NULL,
    description_id uuid references turu.descriptions(id) NOT NULL,
    metric_id uuid references turu.metrics(id) NOT NULL,
    type turu.event_type NOT NUll,

    -- handle create, update and publish time
    publish_at time with time zone DEFAULT NULL,
    updated_at time with time zone not NULL DEFAULT CURRENT_TIMESTAMP,
    created_at time with time zone not NULL DEFAULT now()
  );

COMMIT;
