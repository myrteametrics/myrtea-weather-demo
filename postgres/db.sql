--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: calendar_union_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendar_union_v1 (
    calendar_id integer NOT NULL,
    sub_calendar_id integer NOT NULL,
    priority integer
);


ALTER TABLE public.calendar_union_v1 OWNER TO postgres;

--
-- Name: calendar_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendar_v1 (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    period_data jsonb NOT NULL,
    enabled boolean NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.calendar_v1 OWNER TO postgres;

--
-- Name: calendar_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calendar_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendar_v1_id_seq OWNER TO postgres;

--
-- Name: calendar_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calendar_v1_id_seq OWNED BY public.calendar_v1.id;


--
-- Name: connectors_executions_log_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.connectors_executions_log_v1 (
    id integer NOT NULL,
    connector_id character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    ts timestamp with time zone NOT NULL,
    success boolean
);


ALTER TABLE public.connectors_executions_log_v1 OWNER TO postgres;

--
-- Name: connectors_executions_log_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.connectors_executions_log_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connectors_executions_log_v1_id_seq OWNER TO postgres;

--
-- Name: connectors_executions_log_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.connectors_executions_log_v1_id_seq OWNED BY public.connectors_executions_log_v1.id;


--
-- Name: elasticsearch_indices_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elasticsearch_indices_v1 (
    id integer NOT NULL,
    logical character varying(100) NOT NULL,
    technical character varying(100) NOT NULL,
    creation_date timestamp with time zone NOT NULL
);


ALTER TABLE public.elasticsearch_indices_v1 OWNER TO postgres;

--
-- Name: elasticsearch_indices_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.elasticsearch_indices_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elasticsearch_indices_v1_id_seq OWNER TO postgres;

--
-- Name: elasticsearch_indices_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.elasticsearch_indices_v1_id_seq OWNED BY public.elasticsearch_indices_v1.id;


--
-- Name: fact_definition_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_definition_v1 (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    definition json,
    last_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.fact_definition_v1 OWNER TO postgres;

--
-- Name: fact_definition_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_definition_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_definition_v1_id_seq OWNER TO postgres;

--
-- Name: fact_definition_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_definition_v1_id_seq OWNED BY public.fact_definition_v1.id;


--
-- Name: fact_history_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_history_v1 (
    id integer NOT NULL,
    ts timestamp with time zone NOT NULL,
    situation_id integer NOT NULL,
    situation_instance_id integer NOT NULL,
    result jsonb,
    success boolean
);


ALTER TABLE public.fact_history_v1 OWNER TO postgres;

--
-- Name: issue_detection_feedback_v3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_detection_feedback_v3 (
    id integer NOT NULL,
    issue_id integer NOT NULL,
    user_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    rating integer
);


ALTER TABLE public.issue_detection_feedback_v3 OWNER TO postgres;

--
-- Name: issue_detection_feedback_v3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_detection_feedback_v3_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_detection_feedback_v3_id_seq OWNER TO postgres;

--
-- Name: issue_detection_feedback_v3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_detection_feedback_v3_id_seq OWNED BY public.issue_detection_feedback_v3.id;


--
-- Name: issue_resolution_draft_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_resolution_draft_v1 (
    issue_id integer NOT NULL,
    concurrency_uuid character varying(100) NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    data jsonb NOT NULL
);


ALTER TABLE public.issue_resolution_draft_v1 OWNER TO postgres;

--
-- Name: issue_resolution_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_resolution_v1 (
    feedback_date timestamp with time zone NOT NULL,
    issue_id integer,
    rootcause_id integer,
    action_id integer
);


ALTER TABLE public.issue_resolution_v1 OWNER TO postgres;

--
-- Name: issues_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issues_v1 (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    level character varying(100) NOT NULL,
    situation_id integer,
    situation_instance_id integer,
    situation_date timestamp with time zone NOT NULL,
    expiration_date timestamp with time zone NOT NULL,
    rule_data jsonb NOT NULL,
    state character varying(100) NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    detection_rating_avg real,
    assigned_at timestamp with time zone,
    assigned_to character varying(100),
    closed_at timestamp with time zone,
    closed_by character varying(100)
);


ALTER TABLE public.issues_v1 OWNER TO postgres;

--
-- Name: issues_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issues_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issues_v1_id_seq OWNER TO postgres;

--
-- Name: issues_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issues_v1_id_seq OWNED BY public.issues_v1.id;


--
-- Name: job_schedules_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_schedules_v1 (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    cronexpr character varying(100) NOT NULL,
    job_type character varying(100) NOT NULL,
    job_data json NOT NULL,
    last_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.job_schedules_v1 OWNER TO postgres;

--
-- Name: job_schedules_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_schedules_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_schedules_v1_id_seq OWNER TO postgres;

--
-- Name: job_schedules_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_schedules_v1_id_seq OWNED BY public.job_schedules_v1.id;


--
-- Name: model_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_v1 (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    definition jsonb
);


ALTER TABLE public.model_v1 OWNER TO postgres;

--
-- Name: model_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.model_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.model_v1_id_seq OWNER TO postgres;

--
-- Name: model_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.model_v1_id_seq OWNED BY public.model_v1.id;


--
-- Name: notifications_history_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications_history_v1 (
    id integer NOT NULL,
    groups integer[] NOT NULL,
    data json,
    created_at timestamp with time zone NOT NULL,
    isread boolean DEFAULT false
);


ALTER TABLE public.notifications_history_v1 OWNER TO postgres;

--
-- Name: notifications_history_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_history_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_history_v1_id_seq OWNER TO postgres;

--
-- Name: notifications_history_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_history_v1_id_seq OWNED BY public.notifications_history_v1.id;


--
-- Name: ref_action_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_action_v1 (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    rootcause_id integer
);


ALTER TABLE public.ref_action_v1 OWNER TO postgres;

--
-- Name: ref_action_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_action_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_action_v1_id_seq OWNER TO postgres;

--
-- Name: ref_action_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_action_v1_id_seq OWNED BY public.ref_action_v1.id;


--
-- Name: ref_rootcause_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ref_rootcause_v1 (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    situation_id integer,
    rule_id integer
);


ALTER TABLE public.ref_rootcause_v1 OWNER TO postgres;

--
-- Name: ref_rootcause_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ref_rootcause_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ref_rootcause_v1_id_seq OWNER TO postgres;

--
-- Name: ref_rootcause_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ref_rootcause_v1_id_seq OWNED BY public.ref_rootcause_v1.id;


--
-- Name: rule_versions_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rule_versions_v1 (
    rule_id integer NOT NULL,
    version_number integer NOT NULL,
    data json NOT NULL,
    creation_datetime timestamp with time zone NOT NULL
);


ALTER TABLE public.rule_versions_v1 OWNER TO postgres;

--
-- Name: rules_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rules_v1 (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    enabled boolean NOT NULL,
    calendar_id integer,
    last_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.rules_v1 OWNER TO postgres;

--
-- Name: rules_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rules_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rules_v1_id_seq OWNER TO postgres;

--
-- Name: rules_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rules_v1_id_seq OWNED BY public.rules_v1.id;


--
-- Name: situation_definition_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.situation_definition_v1 (
    id integer NOT NULL,
    groups integer[] NOT NULL,
    name character varying(100) NOT NULL,
    definition json,
    is_template boolean,
    is_object boolean,
    calendar_id integer,
    last_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.situation_definition_v1 OWNER TO postgres;

--
-- Name: situation_definition_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.situation_definition_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.situation_definition_v1_id_seq OWNER TO postgres;

--
-- Name: situation_definition_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.situation_definition_v1_id_seq OWNED BY public.situation_definition_v1.id;


--
-- Name: situation_facts_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.situation_facts_v1 (
    situation_id integer NOT NULL,
    fact_id integer NOT NULL
);


ALTER TABLE public.situation_facts_v1 OWNER TO postgres;

--
-- Name: situation_history_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.situation_history_v1 (
    id integer NOT NULL,
    ts timestamp with time zone NOT NULL,
    situation_instance_id integer NOT NULL,
    facts_ids json,
    parameters json,
    expression_facts jsonb,
    metadatas json,
    evaluated boolean
);


ALTER TABLE public.situation_history_v1 OWNER TO postgres;

--
-- Name: situation_rules_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.situation_rules_v1 (
    situation_id integer NOT NULL,
    rule_id integer NOT NULL,
    execution_order integer
);


ALTER TABLE public.situation_rules_v1 OWNER TO postgres;

--
-- Name: situation_template_instances_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.situation_template_instances_v1 (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    situation_id integer,
    parameters json,
    calendar_id integer,
    last_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.situation_template_instances_v1 OWNER TO postgres;

--
-- Name: situation_template_instances_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.situation_template_instances_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.situation_template_instances_v1_id_seq OWNER TO postgres;

--
-- Name: situation_template_instances_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.situation_template_instances_v1_id_seq OWNED BY public.situation_template_instances_v1.id;


--
-- Name: user_groups_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_groups_v1 (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.user_groups_v1 OWNER TO postgres;

--
-- Name: user_groups_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_groups_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_groups_v1_id_seq OWNER TO postgres;

--
-- Name: user_groups_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_groups_v1_id_seq OWNED BY public.user_groups_v1.id;


--
-- Name: user_memberships_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_memberships_v1 (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    role integer
);


ALTER TABLE public.user_memberships_v1 OWNER TO postgres;

--
-- Name: users_v1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_v1 (
    id integer NOT NULL,
    login character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    role integer NOT NULL,
    created timestamp with time zone NOT NULL,
    last_name character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(100)
);


ALTER TABLE public.users_v1 OWNER TO postgres;

--
-- Name: users_v1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_v1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_v1_id_seq OWNER TO postgres;

--
-- Name: users_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_v1_id_seq OWNED BY public.users_v1.id;


--
-- Name: calendar_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_v1 ALTER COLUMN id SET DEFAULT nextval('public.calendar_v1_id_seq'::regclass);


--
-- Name: connectors_executions_log_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors_executions_log_v1 ALTER COLUMN id SET DEFAULT nextval('public.connectors_executions_log_v1_id_seq'::regclass);


--
-- Name: elasticsearch_indices_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elasticsearch_indices_v1 ALTER COLUMN id SET DEFAULT nextval('public.elasticsearch_indices_v1_id_seq'::regclass);


--
-- Name: fact_definition_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_definition_v1 ALTER COLUMN id SET DEFAULT nextval('public.fact_definition_v1_id_seq'::regclass);


--
-- Name: issue_detection_feedback_v3 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_detection_feedback_v3 ALTER COLUMN id SET DEFAULT nextval('public.issue_detection_feedback_v3_id_seq'::regclass);


--
-- Name: issues_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues_v1 ALTER COLUMN id SET DEFAULT nextval('public.issues_v1_id_seq'::regclass);


--
-- Name: job_schedules_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_schedules_v1 ALTER COLUMN id SET DEFAULT nextval('public.job_schedules_v1_id_seq'::regclass);


--
-- Name: model_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_v1 ALTER COLUMN id SET DEFAULT nextval('public.model_v1_id_seq'::regclass);


--
-- Name: notifications_history_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_history_v1 ALTER COLUMN id SET DEFAULT nextval('public.notifications_history_v1_id_seq'::regclass);


--
-- Name: ref_action_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_action_v1 ALTER COLUMN id SET DEFAULT nextval('public.ref_action_v1_id_seq'::regclass);


--
-- Name: ref_rootcause_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ref_rootcause_v1 ALTER COLUMN id SET DEFAULT nextval('public.ref_rootcause_v1_id_seq'::regclass);


--
-- Name: rules_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules_v1 ALTER COLUMN id SET DEFAULT nextval('public.rules_v1_id_seq'::regclass);


--
-- Name: situation_definition_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.situation_definition_v1 ALTER COLUMN id SET DEFAULT nextval('public.situation_definition_v1_id_seq'::regclass);


--
-- Name: situation_template_instances_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.situation_template_instances_v1 ALTER COLUMN id SET DEFAULT nextval('public.situation_template_instances_v1_id_seq'::regclass);


--
-- Name: user_groups_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_groups_v1 ALTER COLUMN id SET DEFAULT nextval('public.user_groups_v1_id_seq'::regclass);


--
-- Name: users_v1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_v1 ALTER COLUMN id SET DEFAULT nextval('public.users_v1_id_seq'::regclass);


--
-- Data for Name: calendar_union_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calendar_union_v1 (calendar_id, sub_calendar_id, priority) FROM stdin;
\.


--
-- Data for Name: calendar_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calendar_v1 (id, name, description, period_data, enabled, creation_date, last_modified) FROM stdin;
\.


--
-- Data for Name: connectors_executions_log_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connectors_executions_log_v1 (id, connector_id, name, ts, success) FROM stdin;
\.


--
-- Data for Name: elasticsearch_indices_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.elasticsearch_indices_v1 (id, logical, technical, creation_date) FROM stdin;
\.


--
-- Data for Name: fact_definition_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_definition_v1 (id, name, definition, last_modified) FROM stdin;
1	current_perpignan	{"id":1,"name":"current_perpignan","isObject":true,"model":"measure","calculationDepth":1,"intent":{"name":"current_perpignan","operator":"select","term":"measure"},"comment":"","isTemplate":false}	2020-11-19 16:16:37.982+00
2	current_narbonne	{"id":2,"name":"current_narbonne","isObject":true,"model":"measure","calculationDepth":1,"intent":{"name":"current_narbonne","operator":"select","term":"measure"},"comment":"","isTemplate":false}	2020-11-19 16:17:02.033+00
3	current_montpellier	{"id":3,"name":"current_montpellier","isObject":true,"model":"measure","calculationDepth":1,"intent":{"name":"current_montpellier","operator":"select","term":"measure"},"comment":"","isTemplate":false}	2020-11-19 16:17:16.952+00
4	current_speed_avg	{"id":4,"name":"current_speed_avg","isObject":false,"model":"measure","calculationDepth":1,"intent":{"name":"value","operator":"avg","term":"speed"},"condition":{"operator":"between","term":"datetime","value":"calendar_add(now, \\"-1h\\")","value2":"now"},"comment":"","isTemplate":false}	2020-11-19 16:17:29.016+00
\.


--
-- Data for Name: fact_history_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_history_v1 (id, ts, situation_id, situation_instance_id, result, success) FROM stdin;
\.


--
-- Data for Name: issue_detection_feedback_v3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_detection_feedback_v3 (id, issue_id, user_id, date, rating) FROM stdin;
\.


--
-- Data for Name: issue_resolution_draft_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_resolution_draft_v1 (issue_id, concurrency_uuid, last_modified, data) FROM stdin;
\.


--
-- Data for Name: issue_resolution_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_resolution_v1 (feedback_date, issue_id, rootcause_id, action_id) FROM stdin;
\.


--
-- Data for Name: issues_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issues_v1 (id, key, name, level, situation_id, situation_instance_id, situation_date, expiration_date, rule_data, state, last_modified, created_at, detection_rating_avg, assigned_at, assigned_to, closed_at, closed_by) FROM stdin;
\.


--
-- Data for Name: job_schedules_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_schedules_v1 (id, name, cronexpr, job_type, job_data, last_modified) FROM stdin;
1	all_facts	*/1 * * * *	fact	{"factIds":[4],"debug":false}	2020-11-19 16:40:05.636+00
\.


--
-- Data for Name: model_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_v1 (id, name, definition) FROM stdin;
1	measure	{"id": 0, "name": "measure", "fields": [{"name": "speed", "type": "float", "semantic": false, "synonyms": []}, {"name": "dir", "type": "float", "semantic": false, "synonyms": []}, {"name": "dir_str", "type": "string", "semantic": false, "synonyms": []}, {"name": "gust", "type": "float", "semantic": false, "synonyms": []}, {"name": "temperature", "type": "float", "semantic": false, "synonyms": []}, {"name": "wind_chill", "type": "float", "semantic": false, "synonyms": []}, {"name": "pressure", "type": "float", "semantic": false, "synonyms": []}, {"name": "avg_speed", "type": "float", "semantic": false, "synonyms": []}, {"name": "max_gust", "type": "float", "semantic": false, "synonyms": []}, {"name": "avg_dir", "type": "float", "semantic": false, "synonyms": []}, {"name": "avg_dir_str", "type": "string", "semantic": false, "synonyms": []}, {"name": "dir_rate", "type": "float", "semantic": false, "synonyms": []}, {"name": "dir_tendency", "type": "string", "semantic": false, "synonyms": []}, {"name": "speed_rate", "type": "float", "semantic": false, "synonyms": []}, {"name": "speed_tendency", "type": "string", "semantic": false, "synonyms": []}, {"name": "daily_avg_speed", "type": "float", "semantic": false, "synonyms": []}, {"name": "daily_max_wind", "type": "float", "semantic": false, "synonyms": []}, {"name": "daily_max_temp", "type": "float", "semantic": false, "synonyms": []}, {"name": "daily_min_temp", "type": "float", "semantic": false, "synonyms": []}, {"name": "datetime", "type": "datetime", "semantic": false, "synonyms": []}], "synonyms": [], "elasticsearchOptions": {"rollcron": "0 0 * * *", "rollmode": "cron", "enablePurge": true, "advancedSettings": {"number_of_shards": "1", "number_of_replicas": "0"}, "patchAliasMaxIndices": 30, "purgeMaxConcurrentIndices": 30}}
\.


--
-- Data for Name: notifications_history_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications_history_v1 (id, groups, data, created_at, isread) FROM stdin;
\.


--
-- Data for Name: ref_action_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_action_v1 (id, name, description, rootcause_id) FROM stdin;
\.


--
-- Data for Name: ref_rootcause_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ref_rootcause_v1 (id, name, description, situation_id, rule_id) FROM stdin;
\.


--
-- Data for Name: rule_versions_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rule_versions_v1 (rule_id, version_number, data, creation_datetime) FROM stdin;
1	5	{"name":"state_perpignan","description":"state rule","enabled":true,"calendarId":0,"id":1,"cases":[{"name":"Insufficient","condition":"current_perpignan.speed \\u003c optimal_speed * min_rate","actions":[{"name":"\\"set\\"","parameters":{"state_perpignan":"\\"Insufficient\\""}}]},{"name":"Perfect","condition":"current_perpignan.speed \\u003e= optimal_speed * (1 - margin) \\u0026\\u0026 current_perpignan.speed \\u003c= optimal_speed * (1 + margin)","actions":[{"name":"\\"set\\"","parameters":{"state_perpignan":"\\"Perfect\\""}}]},{"name":"OK","condition":"current_perpignan.speed \\u003e= optimal_speed * min_rate \\u0026\\u0026 current_perpignan.speed \\u003c= optimal_speed * max_rate","actions":[{"name":"\\"set\\"","parameters":{"state_perpignan":"\\"OK\\""}}]},{"name":"TooMuch","condition":"current_perpignan.speed \\u003e optimal_speed * max_rate","actions":[{"name":"\\"set\\"","parameters":{"state_perpignan":"\\"TooMuch\\""}}]}],"version":5,"parameters":{"margin":"0.1","max_rate":"1.3","min_rate":"0.6","optimal_speed":"15"}}	2020-11-19 16:18:38.755+00
2	5	{"name":"state_narbonne","description":"state rule","enabled":true,"calendarId":0,"id":2,"cases":[{"name":"Insufficient","condition":"current_narbonne.speed \\u003c optimal_speed * min_rate","actions":[{"name":"\\"set\\"","parameters":{"state_narbonne":"\\"Insufficient\\""}}]},{"name":"Perfect","condition":"current_narbonne.speed \\u003e= optimal_speed * (1 - margin) \\u0026\\u0026 current_narbonne.speed \\u003c= optimal_speed * (1 + margin)","actions":[{"name":"\\"set\\"","parameters":{"state_narbonne":"\\"Perfect\\""}}]},{"name":"OK","condition":"current_narbonne.speed \\u003e= optimal_speed * min_rate \\u0026\\u0026 current_narbonne.speed \\u003c= optimal_speed * max_rate","actions":[{"name":"\\"set\\"","parameters":{"state_narbonne":"\\"OK\\""}}]},{"name":"TooMuch","condition":"current_narbonne.speed \\u003e optimal_speed * max_rate","actions":[{"name":"\\"set\\"","parameters":{"state_narbonne":"\\"TooMuch\\""}}]}],"version":5,"parameters":{"margin":"0.1","max_rate":"1.3","min_rate":"0.6","optimal_speed":"15"}}	2020-11-19 16:19:05.571+00
3	3	{"name":"state_montpellier","description":"state rule","enabled":true,"calendarId":0,"id":3,"cases":[{"name":"Insufficient","condition":"current_montpellier.speed \\u003c optimal_speed * min_rate","actions":[{"name":"\\"set\\"","parameters":{"state_montpellier":"\\"Insufficient\\""}}]},{"name":"Perfect","condition":"current_montpellier.speed \\u003e= optimal_speed * (1 - margin) \\u0026\\u0026 current_montpellier.speed \\u003c= optimal_speed * (1 + margin)","actions":[{"name":"\\"set\\"","parameters":{"state_montpellier":"\\"Perfect\\""}}]},{"name":"OK","condition":"current_montpellier.speed \\u003e= optimal_speed * min_rate \\u0026\\u0026 current_montpellier.speed \\u003c= optimal_speed * max_rate","actions":[{"name":"\\"set\\"","parameters":{"state_montpellier":"\\"OK\\""}}]},{"name":"TooMuch","condition":"current_montpellier.speed \\u003e optimal_speed * max_rate","actions":[{"name":"\\"set\\"","parameters":{"state_montpellier":"\\"TooMuch\\""}}]}],"version":3,"parameters":{"max_rate":"1.3","min_rate":"0.6","optimal_speed":"15"}}	2020-11-19 16:19:26.836+00
4	4	{"name":"state_avg","description":"state rule","enabled":true,"calendarId":0,"id":4,"cases":[{"name":"Insufficient","condition":"current_speed_avg.aggs.value.value \\u003c optimal_speed * min_rate","actions":[{"name":"\\"set\\"","parameters":{"state_avg":"\\"Insufficient\\""}}]},{"name":"Perfect","condition":"current_speed_avg.aggs.value.value \\u003e= optimal_speed * (1 - margin) \\u0026\\u0026 current_speed_avg.aggs.value.value \\u003c= optimal_speed * (1 + margin)","actions":[{"name":"\\"set\\"","parameters":{"state_avg":"\\"Perfect\\""}}]},{"name":"OK","condition":"current_speed_avg.aggs.value.value \\u003e= optimal_speed * min_rate \\u0026\\u0026 current_speed_avg.aggs.value.value \\u003c= optimal_speed * max_rate","actions":[{"name":"\\"set\\"","parameters":{"state_avg":"\\"OK\\""}}]},{"name":"TooMuch","condition":"current_speed_avg.aggs.value.value \\u003e optimal_speed * max_rate","actions":[{"name":"\\"set\\"","parameters":{"state_avg":"\\"TooMuch\\""}}]}],"version":4,"parameters":{"margin":"0.1","max_rate":"1.3","min_rate":"0.6","optimal_speed":"15"}}	2020-11-19 16:19:44.089+00
\.


--
-- Data for Name: rules_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rules_v1 (id, name, enabled, calendar_id, last_modified) FROM stdin;
1	state_perpignan	t	\N	2020-11-19 16:18:38.755+00
2	state_narbonne	t	\N	2020-11-19 16:19:05.571+00
3	state_montpellier	t	\N	2020-11-19 16:19:26.836+00
4	state_avg	t	\N	2020-11-19 16:19:44.089+00
\.


--
-- Data for Name: situation_definition_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.situation_definition_v1 (id, groups, name, definition, is_template, is_object, calendar_id, last_modified) FROM stdin;
1	{1,0}	current	{"id":1,"groups":[1],"name":"current","facts":[1,2,3,4],"expressionFacts":[],"calendarId":0,"parameters":{"margin":"0.1","max_rate":"1.3","min_rate":"0.6","optimal_speed":"15"},"isTemplate":false,"isObject":false}	f	f	\N	2020-11-19 16:36:39.922+00
\.


--
-- Data for Name: situation_facts_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.situation_facts_v1 (situation_id, fact_id) FROM stdin;
1	1
1	2
1	3
1	4
\.


--
-- Data for Name: situation_history_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.situation_history_v1 (id, ts, situation_instance_id, facts_ids, parameters, expression_facts, metadatas, evaluated) FROM stdin;
\.


--
-- Data for Name: situation_rules_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.situation_rules_v1 (situation_id, rule_id, execution_order) FROM stdin;
1	1	0
1	2	1
1	3	2
1	4	3
\.


--
-- Data for Name: situation_template_instances_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.situation_template_instances_v1 (id, name, situation_id, parameters, calendar_id, last_modified) FROM stdin;
\.


--
-- Data for Name: user_groups_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_groups_v1 (id, name) FROM stdin;
1	administrators
\.


--
-- Data for Name: user_memberships_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_memberships_v1 (user_id, group_id, role) FROM stdin;
1	1	1
\.


--
-- Data for Name: users_v1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_v1 (id, login, password, role, created, last_name, first_name, email, phone) FROM stdin;
1	admin	$1$lth3vonm$8lRq5rIhT/oV/A54rwwv60	1	2020-11-19 16:08:17.634763+00	admin	admin	admin@admin.com	0123456789
\.


--
-- Name: calendar_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calendar_v1_id_seq', 1, false);


--
-- Name: connectors_executions_log_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.connectors_executions_log_v1_id_seq', 1, false);


--
-- Name: elasticsearch_indices_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.elasticsearch_indices_v1_id_seq', 1, false);


--
-- Name: fact_definition_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_definition_v1_id_seq', 4, true);


--
-- Name: issue_detection_feedback_v3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_detection_feedback_v3_id_seq', 1, false);


--
-- Name: issues_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issues_v1_id_seq', 1, false);


--
-- Name: job_schedules_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_schedules_v1_id_seq', 33, true);


--
-- Name: model_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.model_v1_id_seq', 1, true);


--
-- Name: notifications_history_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_history_v1_id_seq', 1, false);


--
-- Name: ref_action_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_action_v1_id_seq', 1, false);


--
-- Name: ref_rootcause_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ref_rootcause_v1_id_seq', 1, false);


--
-- Name: rules_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rules_v1_id_seq', 4, true);


--
-- Name: situation_definition_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.situation_definition_v1_id_seq', 1, true);


--
-- Name: situation_template_instances_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.situation_template_instances_v1_id_seq', 1, false);


--
-- Name: user_groups_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_groups_v1_id_seq', 1, true);


--
-- Name: users_v1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_v1_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

