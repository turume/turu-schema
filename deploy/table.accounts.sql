-- Deploy accounts
-- requires: turu.schema

BEGIN;

  -- TODO: encrypt the password field with pgcrypto
  CREATE TABLE turu.accounts (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),

    owner name NOT NULL,
    email character UNIQUE NOT NULL CHECK (email <> ''),
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    nickname character varying(255),
    phone_number character varying(32) DEFAULT NULL,
    language character varying(8) DEFAULT 'en_US',
    accepts_marketing boolean DEFAULT FALSE,
    email_notifications boolean DEFAULT TRUE,
    phone_notifications boolean DEFAULT FALSE,

    -- admin management
    is_actve boolean default TRUE,
    is_admin boolean default FALSE,
    is_superuser boolean default FALSE,

    -- reset password
    reset_password_token character varying DEFAULT NULL,
    reset_password_sent_at time with time zone DEFAULT NULL,

    -- handle create and update
    updated_at time with time zone not NULL DEFAULT CURRENT_TIMESTAMP,
    created_at time with time zone not NULL DEFAULT now()
  );

  -- activate row leve auth for accounts
  CREATE TRIGGER accounts_owner_track
    BEFORE INSERT OR UPDATE
    ON turu.accounts
    FOR EACH ROW
    EXECUTE PROCEDURE postgrest.update_owner();

COMMIT;
