--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: 1; Type: SCHEMA; Schema: -; Owner: samuelmerry
--

CREATE SCHEMA "1";


ALTER SCHEMA "1" OWNER TO samuelmerry;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = "1", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: turu_metrics; Type: TABLE; Schema: 1; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_metrics (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    device_id uuid,
    units_id uuid,
    sw_version character varying(255),
    hw_version character varying(255),
    value double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE "1".turu_metrics OWNER TO samuelmerry;

--
-- Name: test; Type: VIEW; Schema: 1; Owner: samuelmerry
--

CREATE VIEW test AS
 SELECT turu_metrics.id,
    turu_metrics.device_id,
    turu_metrics.units_id,
    turu_metrics.sw_version,
    turu_metrics.hw_version,
    turu_metrics.value,
    turu_metrics.created_at,
    turu_metrics.updated_at
   FROM turu_metrics;


ALTER TABLE "1".test OWNER TO samuelmerry;

--
-- Name: test_table; Type: TABLE; Schema: 1; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE test_table (
    id integer NOT NULL
);


ALTER TABLE "1".test_table OWNER TO samuelmerry;

--
-- Name: test_table_id_seq; Type: SEQUENCE; Schema: 1; Owner: samuelmerry
--

CREATE SEQUENCE test_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "1".test_table_id_seq OWNER TO samuelmerry;

--
-- Name: test_table_id_seq; Type: SEQUENCE OWNED BY; Schema: 1; Owner: samuelmerry
--

ALTER SEQUENCE test_table_id_seq OWNED BY test_table.id;


SET search_path = public, pg_catalog;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying(255),
    body text,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.active_admin_comments OWNER TO samuelmerry;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: samuelmerry
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO samuelmerry;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: samuelmerry
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE oauth_access_grants (
    id integer NOT NULL,
    resource_owner_id character varying(255) NOT NULL,
    application_id integer NOT NULL,
    token character varying(255) NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying(255)
);


ALTER TABLE public.oauth_access_grants OWNER TO samuelmerry;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: samuelmerry
--

CREATE SEQUENCE oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_grants_id_seq OWNER TO samuelmerry;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: samuelmerry
--

ALTER SEQUENCE oauth_access_grants_id_seq OWNED BY oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE oauth_access_tokens (
    id integer NOT NULL,
    resource_owner_id character varying(255),
    application_id integer,
    token character varying(255) NOT NULL,
    refresh_token character varying(255),
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying(255)
);


ALTER TABLE public.oauth_access_tokens OWNER TO samuelmerry;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: samuelmerry
--

CREATE SEQUENCE oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_tokens_id_seq OWNER TO samuelmerry;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: samuelmerry
--

ALTER SEQUENCE oauth_access_tokens_id_seq OWNED BY oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE oauth_applications (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    uid character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.oauth_applications OWNER TO samuelmerry;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: samuelmerry
--

CREATE SEQUENCE oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_applications_id_seq OWNER TO samuelmerry;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: samuelmerry
--

ALTER SEQUENCE oauth_applications_id_seq OWNED BY oauth_applications.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO samuelmerry;

--
-- Name: test; Type: VIEW; Schema: public; Owner: samuelmerry
--

CREATE VIEW test AS
 SELECT turu_metrics.id,
    turu_metrics.device_id,
    turu_metrics.units_id,
    turu_metrics.sw_version,
    turu_metrics.hw_version,
    turu_metrics.value,
    turu_metrics.created_at,
    turu_metrics.updated_at
   FROM "1".turu_metrics;


ALTER TABLE public.test OWNER TO samuelmerry;

--
-- Name: turu_account_preferences; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_account_preferences (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    account_id uuid,
    phone_number character varying(255),
    language character varying(255),
    accepts_marketing boolean,
    email_notifications boolean,
    phone_notifications boolean
);


ALTER TABLE public.turu_account_preferences OWNER TO samuelmerry;

--
-- Name: turu_accounts; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_accounts (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    password character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    nickname character varying(255),
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    is_commercial boolean,
    is_superuser boolean,
    last_login timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_accounts OWNER TO samuelmerry;

--
-- Name: turu_accounts_devices; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_accounts_devices (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    device_id uuid,
    account_id uuid,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_accounts_devices OWNER TO samuelmerry;

--
-- Name: turu_accounts_events; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_accounts_events (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    event_id uuid,
    account_id uuid,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_accounts_events OWNER TO samuelmerry;

--
-- Name: turu_accounts_grow_cycles; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_accounts_grow_cycles (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    grow_cycle_id uuid,
    account_id uuid,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_accounts_grow_cycles OWNER TO samuelmerry;

--
-- Name: turu_crops; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_crops (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    unit_id uuid,
    meta_data json,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_crops OWNER TO samuelmerry;

--
-- Name: turu_descriptions; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_descriptions (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    parent_id uuid,
    account_id uuid,
    type character varying(255),
    language character varying(255),
    title character varying(255),
    body character varying(255),
    is_editable boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_descriptions OWNER TO samuelmerry;

--
-- Name: turu_devices; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_devices (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    ident character varying(255),
    type character varying(255),
    sw_version character varying(255),
    hw_version character varying(255),
    rules json,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_devices OWNER TO samuelmerry;

--
-- Name: turu_devices_devices; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_devices_devices (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    parent_id uuid,
    child_id uuid,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_devices_devices OWNER TO samuelmerry;

--
-- Name: turu_events; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_events (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    device_id uuid,
    metric_id uuid,
    type character varying(255),
    publish_date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_events OWNER TO samuelmerry;

--
-- Name: turu_grow_cycles; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_grow_cycles (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    crop_id uuid,
    unit_id uuid,
    start timestamp without time zone,
    "end" timestamp without time zone,
    total_plants integer,
    yeild double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_grow_cycles OWNER TO samuelmerry;

--
-- Name: turu_units; Type: TABLE; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE TABLE turu_units (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    short_name character varying(255),
    long_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.turu_units OWNER TO samuelmerry;

SET search_path = "1", pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: 1; Owner: samuelmerry
--

ALTER TABLE ONLY test_table ALTER COLUMN id SET DEFAULT nextval('test_table_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: samuelmerry
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: samuelmerry
--

ALTER TABLE ONLY oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('oauth_access_grants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: samuelmerry
--

ALTER TABLE ONLY oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('oauth_access_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: samuelmerry
--

ALTER TABLE ONLY oauth_applications ALTER COLUMN id SET DEFAULT nextval('oauth_applications_id_seq'::regclass);


SET search_path = "1", pg_catalog;

--
-- Data for Name: test_table; Type: TABLE DATA; Schema: 1; Owner: samuelmerry
--

COPY test_table (id) FROM stdin;
\.


--
-- Name: test_table_id_seq; Type: SEQUENCE SET; Schema: 1; Owner: samuelmerry
--

SELECT pg_catalog.setval('test_table_id_seq', 1, false);


--
-- Data for Name: turu_metrics; Type: TABLE DATA; Schema: 1; Owner: samuelmerry
--

COPY turu_metrics (id, device_id, units_id, sw_version, hw_version, value, created_at, updated_at) FROM stdin;
7e803051-1330-4b79-82b4-f416c73438e1	d2c02dcb-4a8e-4b93-8681-027040bdbef6	\N	0.0.13	0.0.2	110	2014-12-18 04:41:20.347421	2014-12-18 04:41:20.347421
9d98b6f2-8ef3-466f-bb12-55f784c0bdb2	d2c02dcb-4a8e-4b93-8681-027040bdbef6	\N	0.0.13	0.0.2	110	2014-12-18 04:55:10.269504	2014-12-18 04:55:10.269504
025cd7a3-47d4-408c-a8f9-afeec384de31	d2c02dcb-4a8e-4b93-8681-027040bdbef6	\N	0.0.13	0.0.2	110	2014-12-18 05:31:02.018136	2014-12-18 05:31:02.018136
1f3f45ab-d294-4d1b-93e7-9dc8ebffafd3	d2c02dcb-4a8e-4b93-8681-027040bdbef6	\N	0.0.13	0.0.2	110	2014-12-18 05:42:17.478596	2014-12-18 05:42:17.478596
\.


SET search_path = public, pg_catalog;

--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY active_admin_comments (id, namespace, body, resource_id, resource_type, author_id, author_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: samuelmerry
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: oauth_access_grants; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, created_at, revoked_at, scopes) FROM stdin;
\.


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: samuelmerry
--

SELECT pg_catalog.setval('oauth_access_grants_id_seq', 1, false);


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, revoked_at, created_at, scopes) FROM stdin;
1	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	7e09fc94d7d2d3d7afcdf3131f973f9e0af739d38fcbccc98d3deb45c2de832f	\N	7200	\N	2014-12-18 01:48:58.913493	
2	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	b7ed887f3b38febb5450c6ba12f772a9e537b1e3275dcd000def67937eb99e52	\N	7200	\N	2014-12-18 04:34:21.572232	
3	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	df29e6099161795be1362de03ac07d9b6cf53e529572ed8f9d6d4771de9a8b39	\N	7200	\N	2014-12-23 20:14:03.747446	
\.


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: samuelmerry
--

SELECT pg_catalog.setval('oauth_access_tokens_id_seq', 3, true);


--
-- Data for Name: oauth_applications; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY oauth_applications (id, name, uid, secret, redirect_uri, created_at, updated_at) FROM stdin;
\.


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: samuelmerry
--

SELECT pg_catalog.setval('oauth_applications_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY schema_migrations (version) FROM stdin;
20141116052224
20141122015642
20141123232846
20141211051819
\.


--
-- Data for Name: turu_account_preferences; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_account_preferences (id, account_id, phone_number, language, accepts_marketing, email_notifications, phone_notifications) FROM stdin;
4ddaa0b5-f5ec-4e3b-942a-09ae702aecef	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	\N	\N	\N	\N
dfefeed1-a869-4de3-8f5a-69535ba528db	b2f5709a-46d1-4e56-968d-73ab3451c26f	\N	\N	\N	\N	\N
\.


--
-- Data for Name: turu_accounts; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_accounts (id, email, password, first_name, last_name, nickname, encrypted_password, reset_password_token, reset_password_sent_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, is_commercial, is_superuser, last_login, created_at, updated_at) FROM stdin;
1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	test@turu.me	\N	\N	\N	\N	$2a$10$HEl25TrnRtuEIimSsIieIeS3CoPkf.BOdvDjlH1ACs5NEvTZXNJYG	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	2014-12-18 01:47:59.222989	2014-12-18 01:47:59.222989
b2f5709a-46d1-4e56-968d-73ab3451c26f	sam@turu.me	\N	\N	\N	\N	$2a$10$07SBx.PG.6e0JhzYUxsIquWeT6dW9/XJcCRi95GW2HvGr3Vc1XoJO	\N	\N	1	2014-12-18 04:42:12.05557	2014-12-18 04:42:12.05557	127.0.0.1	127.0.0.1	\N	\N	\N	2014-12-18 04:42:12.023302	2014-12-18 04:42:12.058676
\.


--
-- Data for Name: turu_accounts_devices; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_accounts_devices (id, device_id, account_id, created_at, updated_at) FROM stdin;
16ddfe10-b513-4071-8dbe-d78b26ecbd3e	d2c02dcb-4a8e-4b93-8681-027040b99ef6	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	\N
91a8617c-711d-4e11-991f-59282321a782	d2c02dcb-4a8e-4b93-8681-027040bdbef6	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	\N
d7ef21bf-0f35-408d-9bef-445bf8444f33	d2c02dcb-4a8e-4b93-8681-027040bdbe03	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	\N
\.


--
-- Data for Name: turu_accounts_events; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_accounts_events (id, event_id, account_id, created_at, updated_at) FROM stdin;
c1afca29-1e9b-4d9a-b60a-facefc7bf604	6ec48959-24ce-4571-9b1c-8d3682af275e	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	\N
1f35e5b6-f9f5-4257-bcab-912fdbbf41f0	b9aabe6e-ba27-4da1-96ba-84741e1600f3	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	\N
19f9006d-5466-4bb1-a037-a83a40009fd6	06e192f1-c5d7-4ab6-97e4-7c0e48d28bdb	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	\N
23c2054c-aa45-4a23-bc97-6bc6e60f8703	c1278cf3-edc1-4309-959d-216b199cccaf	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	\N
\.


--
-- Data for Name: turu_accounts_grow_cycles; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_accounts_grow_cycles (id, grow_cycle_id, account_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: turu_crops; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_crops (id, unit_id, meta_data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: turu_descriptions; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_descriptions (id, parent_id, account_id, type, language, title, body, is_editable, created_at, updated_at) FROM stdin;

70dfa885-40c4-45c5-ac17-71bf35738454	d2c02dcb-4a8e-4b93-8681-027040bdbef6	1a6bfe4a-c1d7-40fb-834f-a78b4f79d542	\N	EN_EN	Temppy	I can haz temp.	\N	2014-12-18 01:47:59.376799	2014-12-18 01:47:59.376799
25bc52a0-8829-4927-99a3-425bef0622d1	1433a798-d331-4472-bcca-26a149e33ce9	\N	\N	\N	Temp Too High	We noticed that the temperature is too high.	\N	2014-12-18 04:55:10.338629	2014-12-18 04:55:10.338629
d1b54326-4d5e-4ad1-9b15-e680163d40fa	b148a608-4799-4afb-a102-400bf0fb9bc1	\N	\N	\N	Temp Too High	We noticed that the temperature is too high.	\N	2014-12-18 05:31:02.030791	2014-12-18 05:31:02.030791
b97e09e3-312c-41dd-beb1-f6257b1e80ab	47b36145-56ab-48ba-b1ef-61f74ff2cbe4	\N	\N	\N	Temp Too High	We noticed that the temperature is too high.	\N	2014-12-18 05:42:17.563069	2014-12-18 05:42:17.563069
25170ee0-aeda-40bc-95d3-740a3649fef1	e30a59e0-cfec-499c-975b-a080514cd2bd	\N	\N	\N	Yeah it's a test event	alaksjdf asldkjfa lkjsd flak	\N	2014-12-18 06:15:49.294485	2014-12-18 06:15:49.294485
7d136533-8322-4846-b7a0-afd4a123e81d	3d26d5ec-2d36-43cf-8151-853df51df4e6	\N	\N	\N	Yeah it's a test event	alaksjdf asldkjfa lkjsd flak	\N	2014-12-18 06:18:08.046472	2014-12-18 06:18:08.046472
4235cc6f-5c9a-46d5-b872-0314bf5f0608	e0b257d2-2c34-4ce3-a4fc-96c9900638ae	\N	\N	\N	Yeah it's a test event	alaksjdf asldkjfa lkjsd flak	\N	2014-12-18 06:19:37.747504	2014-12-18 06:19:37.747504
397f3890-3303-4559-9a22-9b511692ff9a	16333186-0315-4f20-88f6-b19568b61a07	\N	\N	\N	Yeah it's a test event	alaksjdf asldkjfa lkjsd flak	\N	2014-12-18 06:22:49.602615	2014-12-18 06:22:49.602615
60061988-8106-4912-be5c-efccc666d38f	062194c9-561e-48f4-b0d1-431b664930d1	\N	\N	\N	Yeah it's a test event	alaksjdf asldkjfa lkjsd flak	\N	2014-12-18 06:23:43.51815	2014-12-18 06:23:43.51815
a56d64eb-8bb3-401c-9357-ff3acdb50a83	b6857323-9e59-4da0-ae02-4198d2a19cd6	\N	\N	\N	Yeah it's a test event	alaksjdf asldkjfa lkjsd flak	\N	2014-12-18 06:25:46.296657	2014-12-18 06:25:46.296657
\.


--
-- Data for Name: turu_devices; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_devices (id, ident, type, sw_version, hw_version, rules, created_at, updated_at) FROM stdin;
d2c02dcb-4a8e-4b93-8681-027040b99ef6	ddaaaaaa44332299	Temp	0.1.0	0.0.2	{"upper_limit":100,"lower_limit":40}	2014-12-18 01:47:59.308272	2014-12-18 01:47:59.308272
d2c02dcb-4a8e-4b93-8681-027040bdbef6	ddaaaaaa44332299	Temp	0.1.0	0.0.2	{"upper_limit":100,"lower_limit":40}	2014-12-18 01:47:59.316768	2014-12-18 01:47:59.316768
d2c02dcb-4a8e-4b93-8681-027040bdbe03	ddccbb0000032211	Ph	0.1.0	0.0.2	{"upper_limit":8,"lower_limit":6}	2014-12-18 01:47:59.33395	2014-12-18 01:47:59.33395
\.


--
-- Data for Name: turu_devices_devices; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_devices_devices (id, parent_id, child_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: turu_events; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_events (id, device_id, metric_id, type, publish_date, created_at, updated_at) FROM stdin;
6ec48959-24ce-4571-9b1c-8d3682af275e	d2c02dcb-4a8e-4b93-8681-027040b99ef6	\N	Notification	4712-01-01 00:00:00 BC	2014-12-18 01:47:59.26923	2014-12-18 01:47:59.26923
b9aabe6e-ba27-4da1-96ba-84741e1600f3	d2c02dcb-4a8e-4b93-8681-027040bdbef6	\N	Notification	4712-01-01 00:00:00 BC	2014-12-18 01:47:59.275777	2014-12-18 01:47:59.275777
06e192f1-c5d7-4ab6-97e4-7c0e48d28bdb	d2c02dcb-4a8e-4b93-8681-027040bdbef6	\N	Rule	4712-01-01 00:00:00 BC	2014-12-18 01:47:59.285178	2014-12-18 01:47:59.285178
c1278cf3-edc1-4309-959d-216b199cccaf	d2c02dcb-4a8e-4b93-8681-027040bdbe03	\N	Notification	4712-01-01 00:00:00 BC	2014-12-18 01:47:59.29093	2014-12-18 01:47:59.29093
cc0cc488-32b4-492c-b6e7-19ac965bb758	d2c02dcb-4a8e-4b93-8681-027040bdbef6	7e803051-1330-4b79-82b4-f416c73438e1	Notification	4712-01-01 00:00:00 BC	2014-12-18 04:41:35.790608	2014-12-18 04:41:35.790608
1433a798-d331-4472-bcca-26a149e33ce9	d2c02dcb-4a8e-4b93-8681-027040bdbef6	9d98b6f2-8ef3-466f-bb12-55f784c0bdb2	Notification	4712-01-01 00:00:00 BC	2014-12-18 04:55:10.333855	2014-12-18 04:55:10.333855
b148a608-4799-4afb-a102-400bf0fb9bc1	d2c02dcb-4a8e-4b93-8681-027040bdbef6	025cd7a3-47d4-408c-a8f9-afeec384de31	Notification	4712-01-01 00:00:00 BC	2014-12-18 05:31:02.027104	2014-12-18 05:31:02.027104
47b36145-56ab-48ba-b1ef-61f74ff2cbe4	d2c02dcb-4a8e-4b93-8681-027040bdbef6	1f3f45ab-d294-4d1b-93e7-9dc8ebffafd3	Notification	4712-01-01 00:00:00 BC	2014-12-18 05:42:17.557365	2014-12-18 05:42:17.557365
e30a59e0-cfec-499c-975b-a080514cd2bd	\N	\N	Comment	4712-01-01 00:00:00 BC	2014-12-18 06:15:49.288552	2014-12-18 06:15:49.288552
3d26d5ec-2d36-43cf-8151-853df51df4e6	\N	\N	Comment	4712-01-01 00:00:00 BC	2014-12-18 06:18:08.040179	2014-12-18 06:18:08.040179
e0b257d2-2c34-4ce3-a4fc-96c9900638ae	\N	\N	Comment	4712-01-01 00:00:00 BC	2014-12-18 06:19:37.743549	2014-12-18 06:19:37.743549
16333186-0315-4f20-88f6-b19568b61a07	\N	\N	\N	4712-01-01 00:00:00 BC	2014-12-18 06:22:49.598233	2014-12-18 06:22:49.598233
062194c9-561e-48f4-b0d1-431b664930d1	\N	\N	\N	4712-01-01 00:00:00 BC	2014-12-18 06:23:43.514493	2014-12-18 06:23:43.514493
b6857323-9e59-4da0-ae02-4198d2a19cd6	\N	\N	\N	4712-01-01 00:00:00 BC	2014-12-18 06:25:46.293615	2014-12-18 06:25:46.293615
\.


--
-- Data for Name: turu_grow_cycles; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_grow_cycles (id, crop_id, unit_id, start, "end", total_plants, yeild, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: turu_units; Type: TABLE DATA; Schema: public; Owner: samuelmerry
--

COPY turu_units (id, short_name, long_name, created_at, updated_at) FROM stdin;
\.


SET search_path = "1", pg_catalog;

--
-- Name: turu_metrics_pkey; Type: CONSTRAINT; Schema: 1; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_metrics
    ADD CONSTRAINT turu_metrics_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: turu_account_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_account_preferences
    ADD CONSTRAINT turu_account_preferences_pkey PRIMARY KEY (id);


--
-- Name: turu_accounts_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_accounts_devices
    ADD CONSTRAINT turu_accounts_devices_pkey PRIMARY KEY (id);


--
-- Name: turu_accounts_events_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_accounts_events
    ADD CONSTRAINT turu_accounts_events_pkey PRIMARY KEY (id);


--
-- Name: turu_accounts_grow_cycles_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_accounts_grow_cycles
    ADD CONSTRAINT turu_accounts_grow_cycles_pkey PRIMARY KEY (id);


--
-- Name: turu_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_accounts
    ADD CONSTRAINT turu_accounts_pkey PRIMARY KEY (id);


--
-- Name: turu_crops_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_crops
    ADD CONSTRAINT turu_crops_pkey PRIMARY KEY (id);


--
-- Name: turu_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_descriptions
    ADD CONSTRAINT turu_descriptions_pkey PRIMARY KEY (id);


--
-- Name: turu_devices_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_devices_devices
    ADD CONSTRAINT turu_devices_devices_pkey PRIMARY KEY (id);


--
-- Name: turu_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_devices
    ADD CONSTRAINT turu_devices_pkey PRIMARY KEY (id);


--
-- Name: turu_events_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_events
    ADD CONSTRAINT turu_events_pkey PRIMARY KEY (id);


--
-- Name: turu_grow_cycles_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_grow_cycles
    ADD CONSTRAINT turu_grow_cycles_pkey PRIMARY KEY (id);


--
-- Name: turu_units_pkey; Type: CONSTRAINT; Schema: public; Owner: samuelmerry; Tablespace: 
--

ALTER TABLE ONLY turu_units
    ADD CONSTRAINT turu_units_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON oauth_applications USING btree (uid);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: samuelmerry; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: samuelmerry
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM samuelmerry;
GRANT ALL ON SCHEMA public TO samuelmerry;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

