-- Deploy postgrest_auth

BEGIN;

CREATE TABLE postgrest.auth (
  id character varying NOT NULL,
  rolname name NOT NULL,
  pass character(60) NOT NULL,
  token UUID DEFAULT NULL,
  token_expiry time with time zone DEFAULT NULL,
  CONSTRAINT auth_pkey PRIMARY KEY (id)
);

CREATE CONSTRAINT TRIGGER ensure_auth_role_exists
  AFTER INSERT OR UPDATE
  ON postgrest.auth
  FOR EACH ROW
  EXECUTE PROCEDURE check_role_exists();

--- read only access for anon
-- CREATE ROLE anon NOLOGIN;
-- GRANT USAGE ON SCHEMA "1" TO anon;
-- GRANT SELECT ON ALL TABLES IN SCHEMA "1" TO anon;

-- edit for authenticated
  GRANT USAGE ON SCHEMA "1" TO author;
  GRANT author TO authenticator;

COMMIT;
