-- Deploy turu.schema

BEGIN;

  CREATE SCHEMA IF NOT EXISTS turu;
  CREATE SCHEMA IF NOT EXISTS postgrest;
  CREATE SCHEMA IF NOT EXISTS "1";
  
  SET search_path = postgrest, pg_catalog, turu, "1";

  CREATE TYPE turu.device_type AS ENUM (
    'temp',
    'ph', 
    'hub'
  );

  CREATE TYPE turu.event_type AS ENUM (
    'notification',
    'rules',
    'other'
  );

  CREATE TYPE turu.description_type AS ENUM (
    'device',
    'event',
    'metric',
    'unit'
  );

COMMIT;
