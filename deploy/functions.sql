-- Deploy functions
-- requires: schema.turu
-- requires: table.events

BEGIN;

-- checks if role exists
CREATE FUNCTION check_role_exists() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin 
if not exists (select 1 from pg_roles as r where r.rolname = new.rolname) then
   raise foreign_key_violation using message = 'Cannot create user with unknown role: ' || new.rolname;
   return null;
 end if;
 return new;
end
$$;

-- the trigger function to bookkeep owners
CREATE OR REPLACE FUNCTION postgrest.update_owner()
  RETURNS trigger AS
$BODY$
BEGIN
   NEW.owner = current_user; 
   RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- function to handle notification
CREATE OR REPLACE FUNCTION object_notify() RETURNS trigger AS $$
DECLARE
BEGIN
  PERFORM pg_notify('object_updated',CAST(NEW.id AS text));
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- notify on all inserts into events table
-- DROP TRIGGER IF EXISTS turu.event_insert_notify ON my_table;
-- CREATE TRIGGER turu.event_insert_notify AFTER INSERT ON turu.events
-- FOR EACH ROW EXECUTE PROCEDURE notify_my_table_insert();
-- TODO: ampq plugin to update pubsub.

COMMIT;
