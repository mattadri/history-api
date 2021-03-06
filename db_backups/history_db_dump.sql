--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.17
-- Dumped by pg_dump version 9.6.17

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO anderauser;

--
-- Name: author; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.author (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    first_name character varying,
    middle_name character varying,
    last_name character varying
);


ALTER TABLE public.author OWNER TO anderauser;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO anderauser;

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;


--
-- Name: brainstorm; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.brainstorm (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    title character varying NOT NULL,
    description text
);


ALTER TABLE public.brainstorm OWNER TO anderauser;

--
-- Name: brainstorm_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.brainstorm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brainstorm_id_seq OWNER TO anderauser;

--
-- Name: brainstorm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.brainstorm_id_seq OWNED BY public.brainstorm.id;


--
-- Name: brainstorm_thought; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.brainstorm_thought (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    thought text,
    chapter character varying,
    page integer,
    brainstorm_fk integer,
    reference_fk integer,
    "position" integer
);


ALTER TABLE public.brainstorm_thought OWNER TO anderauser;

--
-- Name: brainstorm_thought_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.brainstorm_thought_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brainstorm_thought_id_seq OWNER TO anderauser;

--
-- Name: brainstorm_thought_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.brainstorm_thought_id_seq OWNED BY public.brainstorm_thought.id;


--
-- Name: brainstorm_topic; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.brainstorm_topic (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    label character varying NOT NULL,
    brainstorm_fk integer,
    "position" integer
);


ALTER TABLE public.brainstorm_topic OWNER TO anderauser;

--
-- Name: brainstorm_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.brainstorm_topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brainstorm_topic_id_seq OWNER TO anderauser;

--
-- Name: brainstorm_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.brainstorm_topic_id_seq OWNED BY public.brainstorm_topic.id;


--
-- Name: brainstorm_topic_thought; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.brainstorm_topic_thought (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    thought text,
    chapter character varying,
    page integer,
    brainstorm_topic_fk integer,
    reference_fk integer,
    "position" integer
);


ALTER TABLE public.brainstorm_topic_thought OWNER TO anderauser;

--
-- Name: brainstorm_topic_thought_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.brainstorm_topic_thought_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brainstorm_topic_thought_id_seq OWNER TO anderauser;

--
-- Name: brainstorm_topic_thought_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.brainstorm_topic_thought_id_seq OWNED BY public.brainstorm_topic_thought.id;


--
-- Name: chart; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.chart (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    title character varying NOT NULL,
    type character varying
);


ALTER TABLE public.chart OWNER TO anderauser;

--
-- Name: chart_dataset; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.chart_dataset (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    label character varying,
    chart_fk integer,
    background_color character varying,
    border_color character varying,
    fill boolean,
    point_background_color character varying,
    point_radius integer
);


ALTER TABLE public.chart_dataset OWNER TO anderauser;

--
-- Name: chart_dataset_data; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.chart_dataset_data (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    x_data integer,
    y_data integer,
    r_data integer,
    chart_dataset_fk integer
);


ALTER TABLE public.chart_dataset_data OWNER TO anderauser;

--
-- Name: chart_dataset_data_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.chart_dataset_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_dataset_data_id_seq OWNER TO anderauser;

--
-- Name: chart_dataset_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.chart_dataset_data_id_seq OWNED BY public.chart_dataset_data.id;


--
-- Name: chart_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.chart_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_dataset_id_seq OWNER TO anderauser;

--
-- Name: chart_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.chart_dataset_id_seq OWNED BY public.chart_dataset.id;


--
-- Name: chart_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.chart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_id_seq OWNER TO anderauser;

--
-- Name: chart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.chart_id_seq OWNED BY public.chart.id;


--
-- Name: chart_label; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.chart_label (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    label character varying,
    chart_fk integer
);


ALTER TABLE public.chart_label OWNER TO anderauser;

--
-- Name: chart_label_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.chart_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_label_id_seq OWNER TO anderauser;

--
-- Name: chart_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.chart_label_id_seq OWNED BY public.chart_label.id;


--
-- Name: chart_legend_label_options; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.chart_legend_label_options (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    box_width integer,
    padding integer,
    use_point_style boolean,
    font_size integer,
    font_style character varying,
    font_color character varying,
    font_family character varying,
    chart_legend_options_fk integer
);


ALTER TABLE public.chart_legend_label_options OWNER TO anderauser;

--
-- Name: chart_legend_label_options_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.chart_legend_label_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_legend_label_options_id_seq OWNER TO anderauser;

--
-- Name: chart_legend_label_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.chart_legend_label_options_id_seq OWNED BY public.chart_legend_label_options.id;


--
-- Name: chart_legend_options; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.chart_legend_options (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    display boolean,
    "position" character varying,
    align character varying,
    full_width boolean,
    reverse boolean,
    chart_options_fk integer
);


ALTER TABLE public.chart_legend_options OWNER TO anderauser;

--
-- Name: chart_legend_options_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.chart_legend_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_legend_options_id_seq OWNER TO anderauser;

--
-- Name: chart_legend_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.chart_legend_options_id_seq OWNED BY public.chart_legend_options.id;


--
-- Name: chart_options; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.chart_options (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    chart_fk integer,
    maintain_aspect_ratio boolean,
    responsive boolean
);


ALTER TABLE public.chart_options OWNER TO anderauser;

--
-- Name: chart_options_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.chart_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_options_id_seq OWNER TO anderauser;

--
-- Name: chart_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.chart_options_id_seq OWNED BY public.chart_options.id;


--
-- Name: chart_title_options; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.chart_title_options (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    display boolean,
    text character varying,
    "position" character varying,
    font_size integer,
    font_family character varying,
    font_color character varying,
    font_style character varying,
    padding integer,
    line_height character varying,
    chart_options_fk integer
);


ALTER TABLE public.chart_title_options OWNER TO anderauser;

--
-- Name: chart_title_options_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.chart_title_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_title_options_id_seq OWNER TO anderauser;

--
-- Name: chart_title_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.chart_title_options_id_seq OWNED BY public.chart_title_options.id;


--
-- Name: chart_tooltip_options; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.chart_tooltip_options (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    enabled boolean,
    background_color character varying,
    title_font_family character varying,
    title_font_size integer,
    title_font_style character varying,
    title_font_color character varying,
    title_align character varying,
    title_spacing integer,
    title_margin_bottom integer,
    body_font_family character varying,
    body_font_size integer,
    body_font_style character varying,
    body_font_color character varying,
    body_align character varying,
    body_spacing integer,
    footer_font_family character varying,
    footer_font_size integer,
    footer_font_style character varying,
    footer_font_color character varying,
    footer_align character varying,
    footer_spacing integer,
    footer_margin_top integer,
    x_padding integer,
    y_padding integer,
    caret_padding integer,
    caret_size integer,
    corner_radius integer,
    display_colors boolean,
    border_color character varying,
    border_width integer,
    chart_options_fk integer
);


ALTER TABLE public.chart_tooltip_options OWNER TO anderauser;

--
-- Name: chart_tooltip_options_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.chart_tooltip_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chart_tooltip_options_id_seq OWNER TO anderauser;

--
-- Name: chart_tooltip_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.chart_tooltip_options_id_seq OWNED BY public.chart_tooltip_options.id;


--
-- Name: era; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.era (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    label character varying NOT NULL
);


ALTER TABLE public.era OWNER TO anderauser;

--
-- Name: era_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.era_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.era_id_seq OWNER TO anderauser;

--
-- Name: era_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.era_id_seq OWNED BY public.era.id;


--
-- Name: essay; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.essay (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    title character varying NOT NULL,
    abstract text,
    essay text
);


ALTER TABLE public.essay OWNER TO anderauser;

--
-- Name: essay_event; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.essay_event (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    essay_fk integer,
    event_fk integer
);


ALTER TABLE public.essay_event OWNER TO anderauser;

--
-- Name: essay_event_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.essay_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.essay_event_id_seq OWNER TO anderauser;

--
-- Name: essay_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.essay_event_id_seq OWNED BY public.essay_event.id;


--
-- Name: essay_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.essay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.essay_id_seq OWNER TO anderauser;

--
-- Name: essay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.essay_id_seq OWNED BY public.essay.id;


--
-- Name: essay_note; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.essay_note (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    note character varying,
    reference_chapter character varying,
    reference_page integer,
    essay_fk integer,
    reference_fk integer
);


ALTER TABLE public.essay_note OWNER TO anderauser;

--
-- Name: essay_note_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.essay_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.essay_note_id_seq OWNER TO anderauser;

--
-- Name: essay_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.essay_note_id_seq OWNED BY public.essay_note.id;


--
-- Name: essay_person; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.essay_person (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    essay_fk integer,
    person_fk integer
);


ALTER TABLE public.essay_person OWNER TO anderauser;

--
-- Name: essay_person_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.essay_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.essay_person_id_seq OWNER TO anderauser;

--
-- Name: essay_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.essay_person_id_seq OWNED BY public.essay_person.id;


--
-- Name: essay_reference; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.essay_reference (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    chapter character varying,
    page integer,
    essay_fk integer,
    reference_fk integer
);


ALTER TABLE public.essay_reference OWNER TO anderauser;

--
-- Name: essay_reference_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.essay_reference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.essay_reference_id_seq OWNER TO anderauser;

--
-- Name: essay_reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.essay_reference_id_seq OWNED BY public.essay_reference.id;


--
-- Name: essay_timeline; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.essay_timeline (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    essay_fk integer,
    timeline_fk integer
);


ALTER TABLE public.essay_timeline OWNER TO anderauser;

--
-- Name: essay_timeline_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.essay_timeline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.essay_timeline_id_seq OWNER TO anderauser;

--
-- Name: essay_timeline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.essay_timeline_id_seq OWNED BY public.essay_timeline.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.event (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    label character varying NOT NULL,
    description character varying,
    event_end_day integer,
    event_end_era_fk integer,
    event_end_month_fk integer,
    event_start_day integer,
    event_start_era_fk integer,
    event_start_month_fk integer,
    reference_fk integer,
    event_start_year bigint,
    event_end_year bigint
);


ALTER TABLE public.event OWNER TO anderauser;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO anderauser;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: event_note; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.event_note (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    note character varying NOT NULL,
    event_fk integer
);


ALTER TABLE public.event_note OWNER TO anderauser;

--
-- Name: event_note_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.event_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_note_id_seq OWNER TO anderauser;

--
-- Name: event_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.event_note_id_seq OWNED BY public.event_note.id;


--
-- Name: event_tag; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.event_tag (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    event_fk integer,
    tag_fk integer
);


ALTER TABLE public.event_tag OWNER TO anderauser;

--
-- Name: event_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.event_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_tag_id_seq OWNER TO anderauser;

--
-- Name: event_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.event_tag_id_seq OWNED BY public.event_tag.id;


--
-- Name: month; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.month (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    label character varying NOT NULL
);


ALTER TABLE public.month OWNER TO anderauser;

--
-- Name: month_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.month_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.month_id_seq OWNER TO anderauser;

--
-- Name: month_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.month_id_seq OWNED BY public.month.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.person (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    first_name character varying,
    middle_name character varying,
    last_name character varying,
    birth_day integer,
    birth_era_fk integer,
    birth_month_fk integer,
    birth_year integer,
    death_day integer,
    death_era_fk integer,
    death_month_fk integer,
    death_year integer,
    reference_fk integer,
    description character varying
);


ALTER TABLE public.person OWNER TO anderauser;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO anderauser;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: person_note; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.person_note (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    note character varying NOT NULL,
    person_fk integer
);


ALTER TABLE public.person_note OWNER TO anderauser;

--
-- Name: person_note_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.person_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_note_id_seq OWNER TO anderauser;

--
-- Name: person_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.person_note_id_seq OWNED BY public.person_note.id;


--
-- Name: person_tag; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.person_tag (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    person_fk integer,
    tag_fk integer
);


ALTER TABLE public.person_tag OWNER TO anderauser;

--
-- Name: person_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.person_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_tag_id_seq OWNER TO anderauser;

--
-- Name: person_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.person_tag_id_seq OWNED BY public.person_tag.id;


--
-- Name: reference; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.reference (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    title character varying,
    published_day integer,
    published_era_fk integer,
    published_month_fk integer,
    published_year integer,
    sub_title character varying
);


ALTER TABLE public.reference OWNER TO anderauser;

--
-- Name: reference_author; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.reference_author (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    author_fk integer,
    reference_fk integer
);


ALTER TABLE public.reference_author OWNER TO anderauser;

--
-- Name: reference_author_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.reference_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reference_author_id_seq OWNER TO anderauser;

--
-- Name: reference_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.reference_author_id_seq OWNED BY public.reference_author.id;


--
-- Name: reference_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.reference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reference_id_seq OWNER TO anderauser;

--
-- Name: reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.reference_id_seq OWNED BY public.reference.id;


--
-- Name: reference_note; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.reference_note (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    note character varying NOT NULL,
    chapter character varying,
    page integer,
    reference_fk integer
);


ALTER TABLE public.reference_note OWNER TO anderauser;

--
-- Name: reference_note_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.reference_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reference_note_id_seq OWNER TO anderauser;

--
-- Name: reference_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.reference_note_id_seq OWNED BY public.reference_note.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    label character varying NOT NULL
);


ALTER TABLE public.tag OWNER TO anderauser;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO anderauser;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: timeline; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.timeline (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    label character varying,
    description text
);


ALTER TABLE public.timeline OWNER TO anderauser;

--
-- Name: timeline_category; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.timeline_category (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    timeline_fk integer,
    label character varying
);


ALTER TABLE public.timeline_category OWNER TO anderauser;

--
-- Name: timeline_category_event; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.timeline_category_event (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    timeline_category_fk integer,
    event_fk integer
);


ALTER TABLE public.timeline_category_event OWNER TO anderauser;

--
-- Name: timeline_category_event_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.timeline_category_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timeline_category_event_id_seq OWNER TO anderauser;

--
-- Name: timeline_category_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.timeline_category_event_id_seq OWNED BY public.timeline_category_event.id;


--
-- Name: timeline_category_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.timeline_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timeline_category_id_seq OWNER TO anderauser;

--
-- Name: timeline_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.timeline_category_id_seq OWNED BY public.timeline_category.id;


--
-- Name: timeline_category_person; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.timeline_category_person (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    timeline_category_fk integer,
    person_fk integer
);


ALTER TABLE public.timeline_category_person OWNER TO anderauser;

--
-- Name: timeline_category_person_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.timeline_category_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timeline_category_person_id_seq OWNER TO anderauser;

--
-- Name: timeline_category_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.timeline_category_person_id_seq OWNED BY public.timeline_category_person.id;


--
-- Name: timeline_event; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.timeline_event (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    timeline_fk integer,
    event_fk integer,
    is_shadow boolean,
    priority integer
);


ALTER TABLE public.timeline_event OWNER TO anderauser;

--
-- Name: timeline_event_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.timeline_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timeline_event_id_seq OWNER TO anderauser;

--
-- Name: timeline_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.timeline_event_id_seq OWNED BY public.timeline_event.id;


--
-- Name: timeline_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.timeline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timeline_id_seq OWNER TO anderauser;

--
-- Name: timeline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.timeline_id_seq OWNED BY public.timeline.id;


--
-- Name: timeline_person; Type: TABLE; Schema: public; Owner: anderauser
--

CREATE TABLE public.timeline_person (
    id integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone,
    timeline_fk integer,
    person_fk integer
);


ALTER TABLE public.timeline_person OWNER TO anderauser;

--
-- Name: timeline_person_id_seq; Type: SEQUENCE; Schema: public; Owner: anderauser
--

CREATE SEQUENCE public.timeline_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timeline_person_id_seq OWNER TO anderauser;

--
-- Name: timeline_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: anderauser
--

ALTER SEQUENCE public.timeline_person_id_seq OWNED BY public.timeline_person.id;


--
-- Name: author id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- Name: brainstorm id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm ALTER COLUMN id SET DEFAULT nextval('public.brainstorm_id_seq'::regclass);


--
-- Name: brainstorm_thought id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_thought ALTER COLUMN id SET DEFAULT nextval('public.brainstorm_thought_id_seq'::regclass);


--
-- Name: brainstorm_topic id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_topic ALTER COLUMN id SET DEFAULT nextval('public.brainstorm_topic_id_seq'::regclass);


--
-- Name: brainstorm_topic_thought id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_topic_thought ALTER COLUMN id SET DEFAULT nextval('public.brainstorm_topic_thought_id_seq'::regclass);


--
-- Name: chart id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart ALTER COLUMN id SET DEFAULT nextval('public.chart_id_seq'::regclass);


--
-- Name: chart_dataset id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_dataset ALTER COLUMN id SET DEFAULT nextval('public.chart_dataset_id_seq'::regclass);


--
-- Name: chart_dataset_data id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_dataset_data ALTER COLUMN id SET DEFAULT nextval('public.chart_dataset_data_id_seq'::regclass);


--
-- Name: chart_label id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_label ALTER COLUMN id SET DEFAULT nextval('public.chart_label_id_seq'::regclass);


--
-- Name: chart_legend_label_options id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_legend_label_options ALTER COLUMN id SET DEFAULT nextval('public.chart_legend_label_options_id_seq'::regclass);


--
-- Name: chart_legend_options id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_legend_options ALTER COLUMN id SET DEFAULT nextval('public.chart_legend_options_id_seq'::regclass);


--
-- Name: chart_options id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_options ALTER COLUMN id SET DEFAULT nextval('public.chart_options_id_seq'::regclass);


--
-- Name: chart_title_options id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_title_options ALTER COLUMN id SET DEFAULT nextval('public.chart_title_options_id_seq'::regclass);


--
-- Name: chart_tooltip_options id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_tooltip_options ALTER COLUMN id SET DEFAULT nextval('public.chart_tooltip_options_id_seq'::regclass);


--
-- Name: era id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.era ALTER COLUMN id SET DEFAULT nextval('public.era_id_seq'::regclass);


--
-- Name: essay id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay ALTER COLUMN id SET DEFAULT nextval('public.essay_id_seq'::regclass);


--
-- Name: essay_event id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_event ALTER COLUMN id SET DEFAULT nextval('public.essay_event_id_seq'::regclass);


--
-- Name: essay_note id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_note ALTER COLUMN id SET DEFAULT nextval('public.essay_note_id_seq'::regclass);


--
-- Name: essay_person id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_person ALTER COLUMN id SET DEFAULT nextval('public.essay_person_id_seq'::regclass);


--
-- Name: essay_reference id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_reference ALTER COLUMN id SET DEFAULT nextval('public.essay_reference_id_seq'::regclass);


--
-- Name: essay_timeline id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_timeline ALTER COLUMN id SET DEFAULT nextval('public.essay_timeline_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: event_note id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event_note ALTER COLUMN id SET DEFAULT nextval('public.event_note_id_seq'::regclass);


--
-- Name: event_tag id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event_tag ALTER COLUMN id SET DEFAULT nextval('public.event_tag_id_seq'::regclass);


--
-- Name: month id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.month ALTER COLUMN id SET DEFAULT nextval('public.month_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: person_note id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person_note ALTER COLUMN id SET DEFAULT nextval('public.person_note_id_seq'::regclass);


--
-- Name: person_tag id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person_tag ALTER COLUMN id SET DEFAULT nextval('public.person_tag_id_seq'::regclass);


--
-- Name: reference id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference ALTER COLUMN id SET DEFAULT nextval('public.reference_id_seq'::regclass);


--
-- Name: reference_author id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference_author ALTER COLUMN id SET DEFAULT nextval('public.reference_author_id_seq'::regclass);


--
-- Name: reference_note id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference_note ALTER COLUMN id SET DEFAULT nextval('public.reference_note_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: timeline id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline ALTER COLUMN id SET DEFAULT nextval('public.timeline_id_seq'::regclass);


--
-- Name: timeline_category id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category ALTER COLUMN id SET DEFAULT nextval('public.timeline_category_id_seq'::regclass);


--
-- Name: timeline_category_event id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category_event ALTER COLUMN id SET DEFAULT nextval('public.timeline_category_event_id_seq'::regclass);


--
-- Name: timeline_category_person id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category_person ALTER COLUMN id SET DEFAULT nextval('public.timeline_category_person_id_seq'::regclass);


--
-- Name: timeline_event id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_event ALTER COLUMN id SET DEFAULT nextval('public.timeline_event_id_seq'::regclass);


--
-- Name: timeline_person id; Type: DEFAULT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_person ALTER COLUMN id SET DEFAULT nextval('public.timeline_person_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.alembic_version (version_num) FROM stdin;
be664441bce4
\.


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.author (id, created, modified, first_name, middle_name, last_name) FROM stdin;
15	2020-02-06 09:33:31.189623	2020-02-06 09:33:31.189623	Rob	\N	Houston
16	2020-02-06 10:38:39.325597	2020-02-06 10:38:39.325597	Joseph	\N	LeDoux
17	2020-02-09 11:36:25.219967	2020-02-09 11:36:25.219967	Yuval	Noah	Harari
18	2020-02-12 13:51:26.604072	2020-02-12 14:05:15.806351	Anne		Applebaum
21	2020-02-12 14:05:23.575451	2020-02-12 14:05:23.575451	Mark	\N	Lila
22	2020-02-12 18:40:38.879717	2020-02-12 18:40:38.879717	Mark	\N	Kurlansky
23	2020-03-06 10:22:36.787046	2020-03-06 10:22:36.787046	Kim	\N	Ghattas
24	2020-03-14 17:07:36.859053	2020-03-14 17:07:36.859053	Niall	\N	Ferguson
25	2020-04-06 13:59:31.516535	2020-04-06 13:59:31.516535	Eric	H.	Cline
26	2020-04-08 16:48:11.871409	2020-04-08 16:48:11.871409	Richard	\N	Francis
27	2020-04-28 20:53:27.914737	2020-04-28 20:53:27.914737	Jared	\N	Diamond
28	2020-04-28 20:53:41.185787	2020-04-28 20:53:41.185787	Sam	\N	Dagher
29	2020-04-28 20:53:56.702084	2020-04-28 20:53:56.702084	John	\N	Toland
30	2020-04-28 20:54:23.190477	2020-04-28 20:54:23.190477	Jeremy	D.	Popkin
31	2020-04-28 21:09:04.695013	2020-04-28 21:09:04.695013	Graeme	\N	Wood
32	2020-04-28 21:15:14.870743	2020-04-28 21:15:14.870743	Francis 	\N	Fitzgerald
34	2020-05-18 21:50:21.657037	2020-05-18 21:50:21.657037	Richard	J.	Evans
35	2020-06-27 19:01:20.194646	2020-06-27 19:01:20.194646	Karl	\N	Marx
\.


--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.author_id_seq', 35, true);


--
-- Data for Name: brainstorm; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.brainstorm (id, created, modified, title, description) FROM stdin;
1	2020-07-03 21:45:57.369755	2020-07-03 21:45:57.369755	Thomas Hobbes Biography	\N
\.


--
-- Name: brainstorm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.brainstorm_id_seq', 1, true);


--
-- Data for Name: brainstorm_thought; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.brainstorm_thought (id, created, modified, thought, chapter, page, brainstorm_fk, reference_fk, "position") FROM stdin;
1	2020-07-03 22:31:36.754434	2020-07-03 22:31:36.754434	<p>When Hobbes was working out his materialism in the 1640s, England was in the middle of a set of bloody civil wars. These wars were fought between the parliamentarians and the royalist. Hobbes, who even taught the young Charles II mathematics, would have been a royalist. His treatise The Leviathan laid out the need for an absolute monarch, preferably without any type of congregation around it.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	1	\N	0
2	2020-07-03 22:36:14.05771	2020-07-03 22:36:14.05771	<p>American philosopher John Dewey wrote that in Hobbes&#39; day politics was by common consent &quot;a branch of theology,&quot; and that &quot;Hobbes&#39; great work was in freeing, once and for all, morals and politics from subservience to divinity.&quot;</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	1	\N	1
\.


--
-- Name: brainstorm_thought_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.brainstorm_thought_id_seq', 2, true);


--
-- Data for Name: brainstorm_topic; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.brainstorm_topic (id, created, modified, label, brainstorm_fk, "position") FROM stdin;
\.


--
-- Name: brainstorm_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.brainstorm_topic_id_seq', 1, false);


--
-- Data for Name: brainstorm_topic_thought; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.brainstorm_topic_thought (id, created, modified, thought, chapter, page, brainstorm_topic_fk, reference_fk, "position") FROM stdin;
\.


--
-- Name: brainstorm_topic_thought_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.brainstorm_topic_thought_id_seq', 1, false);


--
-- Data for Name: chart; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.chart (id, created, modified, title, type) FROM stdin;
2	2020-06-29 15:30:27.245479	2020-06-29 15:31:03.956439	New Chart	pie
1	2020-06-27 20:07:55.543571	2020-06-29 15:35:42.265274	New Chart	pie
3	2020-07-03 16:01:12.770389	2020-07-03 16:06:16.264149	New Chart	bar
\.


--
-- Data for Name: chart_dataset; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.chart_dataset (id, created, modified, label, chart_fk, background_color, border_color, fill, point_background_color, point_radius) FROM stdin;
1	2020-06-27 20:07:55.90595	2020-06-29 13:47:14.846825	White Homicides	1	#6d1818	#000000	f	#51ff86	3
3	2020-06-29 15:30:27.331916	2020-06-29 15:33:29.404788	Black Homicides	2	#d56767	#6666ff	f	#51ff86	3
4	2020-07-03 16:01:12.825513	2020-07-03 16:07:38.636473	% Of Covid 19 Deaths By Cases	3	#3b2871	#6666ff	f	#51ff86	3
\.


--
-- Data for Name: chart_dataset_data; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.chart_dataset_data (id, created, modified, x_data, y_data, r_data, chart_dataset_fk) FROM stdin;
1	2020-06-27 20:07:56.007977	2020-06-29 13:44:42.635693	81	1	1	1
2	2020-06-27 20:07:56.024101	2020-06-29 13:45:19.098702	16	1	1	1
3	2020-06-29 13:43:50.013138	2020-06-29 13:46:29.353362	1	1	1	1
4	2020-06-29 13:44:02.178419	2020-06-29 13:46:32.334476	2	1	1	1
9	2020-06-29 15:30:27.425809	2020-06-29 15:34:01.365895	89	1	1	3
10	2020-06-29 15:30:27.441048	2020-06-29 15:34:35.305108	8	1	1	3
11	2020-06-29 15:32:11.395767	2020-06-29 15:35:22.62905	1	1	1	3
12	2020-06-29 15:32:12.412872	2020-06-29 15:35:24.927103	2	1	1	3
13	2020-07-03 16:01:12.922435	2020-07-03 16:01:12.922435	1	1	1	4
14	2020-07-03 16:01:12.934732	2020-07-03 16:03:09.67167	4	1	1	4
15	2020-07-03 16:01:35.823318	2020-07-03 16:03:14.220524	4	1	1	4
16	2020-07-03 16:01:39.808752	2020-07-03 16:03:19.081415	18	1	1	4
17	2020-07-03 16:01:46.127896	2020-07-03 16:03:24.254922	15	1	1	4
18	2020-07-03 16:01:47.107815	2020-07-03 16:03:26.2814	4	1	1	4
19	2020-07-03 16:01:48.814159	2020-07-03 16:03:30.907899	4	1	1	4
20	2020-07-03 16:02:01.311339	2020-07-03 16:03:34.210027	11	1	1	4
\.


--
-- Name: chart_dataset_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.chart_dataset_data_id_seq', 20, true);


--
-- Name: chart_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.chart_dataset_id_seq', 4, true);


--
-- Name: chart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.chart_id_seq', 3, true);


--
-- Data for Name: chart_label; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.chart_label (id, created, modified, label, chart_fk) FROM stdin;
1	2020-06-27 20:07:55.871025	2020-06-29 13:43:27.873103	White Victims By White Offenders	1
2	2020-06-27 20:07:55.893697	2020-06-29 13:43:42.18949	White Victims By Black Offenders	1
3	2020-06-29 13:43:49.977746	2020-06-29 15:29:31.187825	White Victims By Other Offenders	1
4	2020-06-29 13:44:02.149648	2020-06-29 15:29:34.720225	White Victims By Unknown Offenders	1
5	2020-06-29 15:30:27.308086	2020-06-29 15:32:03.298794	Black Victims By Black Offenders	2
6	2020-06-29 15:30:27.319996	2020-06-29 15:32:11.241128	Black Victims By White Offenders	2
7	2020-06-29 15:32:11.362927	2020-06-29 15:32:45.034837	Black Victims By Other Offenders	2
8	2020-06-29 15:32:12.388077	2020-06-29 15:32:53.934889	Black Victims By Unknown Offenders	2
9	2020-07-03 16:01:12.80271	2020-07-03 16:01:25.790245	Tennessee	3
10	2020-07-03 16:01:12.814035	2020-07-03 16:01:33.315754	U.S.	3
11	2020-07-03 16:01:35.784007	2020-07-03 16:02:43.731692	World	3
12	2020-07-03 16:01:39.786039	2020-07-03 16:02:49.271391	France	3
13	2020-07-03 16:01:46.103078	2020-07-03 16:02:50.087199	UK	3
14	2020-07-03 16:01:47.078728	2020-07-03 16:02:51.679709	Germany	3
15	2020-07-03 16:01:48.79191	2020-07-03 16:02:53.514753	Denmark	3
16	2020-07-03 16:02:01.276703	2020-07-03 16:02:54.850837	Spain	3
\.


--
-- Name: chart_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.chart_label_id_seq', 16, true);


--
-- Data for Name: chart_legend_label_options; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.chart_legend_label_options (id, created, modified, box_width, padding, use_point_style, font_size, font_style, font_color, font_family, chart_legend_options_fk) FROM stdin;
1	2020-06-27 20:07:56.367534	2020-06-27 20:07:56.367534	40	10	f	12	normal	#000000	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	1
2	2020-06-29 15:30:27.670746	2020-06-29 15:30:27.670746	40	10	f	12	normal	#000000	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	2
3	2020-07-03 16:01:13.220135	2020-07-03 16:05:57.154538	40	10	f	12	normal	#000000	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	3
\.


--
-- Name: chart_legend_label_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.chart_legend_label_options_id_seq', 3, true);


--
-- Data for Name: chart_legend_options; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.chart_legend_options (id, created, modified, display, "position", align, full_width, reverse, chart_options_fk) FROM stdin;
1	2020-06-27 20:07:56.077449	2020-06-27 20:07:56.077449	t	top	center	t	f	1
2	2020-06-29 15:30:27.466171	2020-06-29 15:30:27.466171	t	top	center	t	f	2
3	2020-07-03 16:01:12.959929	2020-07-03 16:05:50.344158	t	top	center	t	f	3
\.


--
-- Name: chart_legend_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.chart_legend_options_id_seq', 3, true);


--
-- Data for Name: chart_options; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.chart_options (id, created, modified, chart_fk, maintain_aspect_ratio, responsive) FROM stdin;
1	2020-06-27 20:07:55.941772	2020-06-27 20:07:55.941772	1	t	t
2	2020-06-29 15:30:27.346038	2020-06-29 15:30:27.346038	2	t	t
3	2020-07-03 16:01:12.840221	2020-07-03 16:01:12.840221	3	t	t
\.


--
-- Name: chart_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.chart_options_id_seq', 3, true);


--
-- Data for Name: chart_title_options; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.chart_title_options (id, created, modified, display, text, "position", font_size, font_family, font_color, font_style, padding, line_height, chart_options_fk) FROM stdin;
1	2020-06-27 20:07:56.061042	2020-06-29 15:26:24.577046	t	White Homicides By Race	top	26	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	#000000	bold	20	2.1	1
2	2020-06-29 15:30:27.453292	2020-06-29 15:30:53.544129	t	Black Homicides By Race	top	26	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	#000000	bold	20	2.1	2
3	2020-07-03 16:01:12.946897	2020-07-03 16:06:39.971197	t	Covid 19 (July 3, 2020)	top	26	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	#000000	bold	20	2.1	3
\.


--
-- Name: chart_title_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.chart_title_options_id_seq', 3, true);


--
-- Data for Name: chart_tooltip_options; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.chart_tooltip_options (id, created, modified, enabled, background_color, title_font_family, title_font_size, title_font_style, title_font_color, title_align, title_spacing, title_margin_bottom, body_font_family, body_font_size, body_font_style, body_font_color, body_align, body_spacing, footer_font_family, footer_font_size, footer_font_style, footer_font_color, footer_align, footer_spacing, footer_margin_top, x_padding, y_padding, caret_padding, caret_size, corner_radius, display_colors, border_color, border_width, chart_options_fk) FROM stdin;
1	2020-06-27 20:07:56.096449	2020-06-27 20:07:56.096449	t	#d9dedb	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	12	bold	#fff	left	2	6	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	12	normal	#fff	left	2	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	12	bold	#fff	left	2	6	6	6	2	5	6	t	#d9dedb	0	1
2	2020-06-29 15:30:27.481818	2020-06-29 15:30:27.481818	t	#d9dedb	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	12	bold	#fff	left	2	6	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	12	normal	#fff	left	2	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	12	bold	#fff	left	2	6	6	6	2	5	6	t	#d9dedb	0	2
3	2020-07-03 16:01:12.975171	2020-07-03 16:08:55.906815	t	#535554	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	12	bold	#fff	left	2	6	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	12	normal	#fff	left	2	'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'	12	bold	#fff	left	2	6	6	6	2	5	6	t	#d9dedb	4	3
\.


--
-- Name: chart_tooltip_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.chart_tooltip_options_id_seq', 3, true);


--
-- Data for Name: era; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.era (id, created, modified, label) FROM stdin;
1	2019-12-19 19:17:50.971856	2019-12-19 19:17:50.971856	BC
2	2019-12-19 19:18:53.058579	2019-12-19 19:18:53.058579	AD
\.


--
-- Name: era_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.era_id_seq', 2, true);


--
-- Data for Name: essay; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.essay (id, created, modified, title, abstract, essay) FROM stdin;
4	2020-04-27 11:37:44.493739	2020-05-04 16:09:32.440598	Consequences of the Truth	<p>What are the consequences of a given truth? Particularly when a truth clashes with an ideological dogma. Historically how do people and groups respond? This clash is probably most obvious between science and religion from proof the earth is not the center to neurological proofs that we are who we are because of the chemical balances in our brains. Beyond this we see it today in economic and political dogmas around our own role in the world with climate change. Another example being the dogma that the human species is now the center of the universe. Humanism being the dogma that drives humanitarianism, but without any proof at all that it&#39;s true or even exists outside our own collective beliefs.</p><p><br></p><p>Historically, where can we show a truth has having succeeded over a dogma and how did that happen. Was there fallout? When was it accepted and how long did that take?</p>	
5	2020-06-24 20:23:44.863521	2020-07-01 23:19:01.305618	The Coming of the 3rd Reich - Recap		<p><span style="font-size: 24px;">The First Reich</span></p><p><br></p><p>The Holy Roman Empire, also known as the &quot;First Reich&quot;, was a gathering of &quot;autonomous states, &#39;free-cities&#39;, or tiny principalities and knighthoods which consisted of little more than a castle and a modestly sized state&quot; ((r 6 ※)), ruled by the Holy Emperor. This empire was founded in 800 by Charlemange and was dissolved by Napoleon in 1806. After Napoleon&#39;s defeat in the battle of Waterloo, a the German Confederation was created in place of the Reich. This kept the sprouting liberals and revolutionaries at bay until the 1848 revolution broke out in Paris and rippled across Europe, bringing the liberals to power.&nbsp;</p><p><br></p><p>Although the liberals elected parliament and wrote a liberal type of constitution they were unable to take control of the army. Shortly the monarchs took advantage of this situation and forcefully broke down the parliament, reestablished the confederation and crushed civil values and freedom under German authoritarianism.</p><p><br></p><p>Nevertheless, by the end of 1860 many liberal ideals where in place, such as &quot;trial by jury in open court, equality before the law, freedom of business enterprise, abolition of the most objectionable forms of state censorship of literature and press, the right of assembly and association, and much more&quot; ((r 7 ※)). Following this preset, particularly in 1862 in Prussia, liberals leveraged some of the rights that elected deputies held &quot;to block the raising of taxes until the army was brought under the control of the legislation&quot; <span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">((r 7 ※)).&nbsp;</span>This situation threatened the Prussian army autonomy by liberal interference. To deal with this <span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Otto Von Bismarck is</span> appointed Chancellor, leading him embark in a series of revolutionary battles were he recovered much of the territory lost to Napoleon and asserted once again Germany&#39;s power. Although he used diplomacy as a tool to conquer, it was mostly brutal force that was used to patch Germany back again into the North German Confederacy <span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">(1871 -1918)</span>, also called &quot;Second Reich&quot; by the Nazis. And with this that lawful institutions were eliminated while violence for political gain was legitimized.&nbsp;</p><p><br></p><p><span style="font-size: 24px;">The Second Reich</span></p><p><br></p><p>This &quot;Second Reich&quot; resembled to the previous reich in that it was a &quot;loose confederation of independent states&quot; ((r 8 ※)), and had the &quot;Kaiser or Emperor&quot; as the top figure with &quot;ranging powers including the declaration of war and peace&quot;. But it differed in that the government institutions where stronger and the parliament (Reichstag) was nationally elected. These were great accomplishments from a liberal stand point, but still deviant thinking was not allowed and mostly persecuted. These contradictions were well illustrated as Evans (qtd in Marx) described the Bismarckian Empire as a &quot;bureaucratically constructed military despotism, dressed up with parliamentary forms, mixed in with an element of feudalism yet at the same time already influenced by the bourgeoisie&quot; ((r 9 ※)).</p><p><br></p><p><span style="font-size: 18px;">Militaristic Influence in Society</span></p><p><br></p><p>Militarism became a central body in society at the time. The many victories of the military make it being in the military as a sign of status, where officers enjoyed privileges and expected respect in the street. Compulsory service ingrained military conducts and values among the common folk. For the bourgeoise it was also a way to gain social status. While technological advancement drove the activity into professionalism, it was the colonial experience that exacerbated its arrogance. Point in case, &quot;in 1904-7, in an act of deliberate genocide, the German army massacred thousands of Herero men, women, and children and drove many more of them into the desert, where they starved. From a population of some 80,000 before the war, the Hereros declined to a mere 15,000 by 1911 as a result of these actions&quot; ((r 10 ※)). This behavior repeated in Alsace-Lorraine, a recent annexed territory, produced a heated debate in the Reichstag in 1913 which led to a vote of no confidence in the government was passed, showing how polarized opinion about the army was becoming.</p><p><br></p><p><span style="font-size: 18px;">Early Assaults on Civil Freedoms</span></p><p><br></p><p>As the Catholic Church and the Reich battled for power, multiple laws and police measures were put into place in the 1870&#39;s (called by the liberals &quot;the struggle for culture&quot;) to limit the Church&#39;s reach, which led to massive disobedience the Reich was not whiling tolerate. Many religious orders where suppressed and the dissenters where sent to jail. Paradoxically these actions where supported by the liberals who saw the catholics as treat to the modern civilization, justifying extreme measures like these ((r 11 ※))<span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">.</span> This ultimately lead the catholic community to distrust of both liberals and modernism, and to found the Centre Party in a way to defend from future prosecution by legislation.</p><p><br></p><p>Another blow to civil freedom was manifested when after the two assassination attempts to the Kaiser the Anti-Socialist (1878) law was passed. Although the socialists had nothing to do with it, it was used as an excuse to outlaw the party and ban anything related to it including, meetings, magazines, and newspapers. Capital punishment was reinstated and mass incarceration and widespread punishment was imposed on socialists ((r 12 ※)). It was until 1890, when this law lapsed that the socialist were able to organize and found the German Socialist Democratic party which &quot;by the eve of the First World War had over a million members, the largest political organization anywhere in the world&quot; ((r 12 ※)).</p><p><br></p><p>Once again the liberals supported the stringency of the Anti-Socialist law, which also made the socialist distrust from them and therefore of Capitalism. These extreme measures radicalized the party, which admitted no dissent and no middle grounds. But unlike the the future communist party, it was not pursuing a revolution, but a progressive change made via the legislation.&nbsp;</p><p><br></p><p><span style="font-size: 18px;">Political Polarization</span></p><p>By 1914 there were six political parties in Germany: the Social Democrats, the National Liberals, the Progressives, the Junkers (a conservative party), the Free Conservatives and the Central Party ((r 13 ※)), which gained more or less representation in parliament. This set an environment of politicization in many aspects of life that in other societies in Europe where much freer: even a person looking to join a choir would be looking to join one that belonged to his party association.</p><p><br></p><p>The universal male suffrage and the system put into place to guarantee its safe guard conduced to a space of practicing democracy that convinced people that politics belong to them (pg.17).</p><p><br></p><p>The discussion of politics turned into the place of Germany in the world (at the beginning of the XX century) <span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">(pg.17)</span></p><p><br></p><p><br></p><p><span style="font-size: 18px;">Legitimization of Pseudo Science</span></p><p><br></p><p>Paradoxically while science brought advancement in many ways, it also opened the space for pseudo science such as, <em>Social Darwinism,&nbsp;</em>which &quot;emphasized not peaceful evolution but the struggle of survival&quot; --to reach father and wider audiences. In 1900 the Anthropologist Ludwing Woltmann argued that &quot;the Aryan or German race represented the height of human evolution and was thus superior to all races. He claimed the &quot;Germanic race has been selected to dominate the earth&quot;. (Gospels of Hate, pg 34)&quot;. <em>Racial Hygiene</em> was another idea that took root during this time, and &quot;was born of a new drive for society to be governed by scientific principles irrespective of all considerations. (Gospels of Hate, pg 38).&quot; Given the more &quot;official&quot; grounds these ideas sat on, seeded the path for institutional antisemitism.</p><p><br></p><p>&nbsp;&nbsp;</p><p><span style="font-size: 24px;">Leading to the First World War</span></p><p><br></p><p>The status of Germany leading to First World War was a of a highly militarized society, where a few assaults on civil rights (towards the Catholic Church and the Social Democrats) where becoming more common<span style="color: rgb(0, 0, 0);">. It was also</span><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;">&nbsp;turbulent time of change, driven by industrialization and the rapid advance in technology and science. There was an influx of foreign ideas and capital. In the arts the Avant-Garde galvanized the use of new mediums and the availability of materials and resources with the new complexities modernity presented to create a new type of art that challenged the status quo. The workers commenced to gain not only political but also economical power, shaking the socio-economical power. A great tension between the &quot;old&quot; way of living and thinking was confronted by the &quot;modern&quot; way which was fast and foreign.</span></p><p><br></p><p><br></p><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;">What was going through peoples heads?:</span></p><p style="text-align: left;">Confusion and disorientation because of the rapid and constant change that modernization imposed. </p><p><br></p><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">The Bismarckian empire was failing in a number of ways:</span></p><ol><li><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">it <strong>included substantial ethnic and cultural minorities</strong> (Danes, French-speakers in Alsace-Lorraine, Sorbs a Slavic group and millions of Poles inhabiting the former kingdom of Poland annexed by Prussia. Economic measures where already being put into place to deprive Poles of economic rights. Even the Social Democrats saw Russian and the Slavic East as barbarians).</span></li><li><strong>Bismarcks successors felt like a second-class nation</strong>. Lacking of overseas empires like Britain and France, Germany late came to colonize what was left over in Africa. There where ambitious dreams of world domination articulated by the Kaiser Wilhelm II himself, who was not aware of how Bismarck precariously had patched together the Empire.</li></ol><p><br></p><p>In one hand, a lesser degree of these features of the empire where similar to what was happening in other countries:</p><ol><li><strong>Italy:</strong> Garibaldi, a leader of the popular forces that helped united the country in 1859, paved the way for Mussolini. The political scene was even more fragmented</li><li><strong>Spain</strong>: the army was not less free of political control than in Italy, and Germany</li><li><strong>Austria-Hungary:</strong> the civil service was just as strong and parliamentary institutions even more limited in power</li><li><strong>France:&nbsp;</strong>faced a church-state battle similar to the &quot;struggle for culture&quot;</li><li><strong>Russia:</strong> the regime repressed the socialists even more</li></ol><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;</span></p><p>On the other, liberalism was very week in all of the major states of Eastern and Central Europe by 1914. The belief that war was justified to achieve political aims was also a shared mentality in Europe. This was the age of &quot;nationalization of the masses&quot; everywhere in Europe but in other countries as well. &quot;<strong>Yet in no nation in Europe other than Germany were all these conditions present at the same time and to the same extent&quot;&nbsp;</strong><span style="orphans: 2; text-align: left; text-indent: 0px; widows: 2; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;">(pg. 19).&nbsp;</span></p><p><br></p><p><span style="orphans: 2; text-align: left; text-indent: 0px; widows: 2; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;"><strong>Germany by 1914:</strong></span></p><ul><li><span style="orphans: 2; text-align: left; text-indent: 0px; widows: 2; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;">Was the continent&#39;s wealthiest, most powerful and most advanced economy.</span></li><li>Had the largest population (after Russia), 67 million, which meant a large work power</li><li>Was the world leader in most industries (chemicals, pharmaceuticals and electricity</li><li>In agriculture the use of chemical fertilizers and farm machinery has transform the efficiency of the land (ex: Germany was producing a third of the world&#39;s output of potatoes)</li><li>Living standards has improved exponentially&nbsp;</li></ul><p><br></p><p><br></p><p><br></p><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;">And there was also:</span></p><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;">- The d</span>evelopment of the concept of &quot;Pan-Germanism&quot;. What was its relation with the Aryan race and <span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&quot;Lebensraum&quot; (</span><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">which meant that germans didn&#39;t have enough living space)</span><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">? Clearly the Germans were ready to go on a war just after the assassination of Franz Ferdinand took place.</span></p><p><br></p><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">What was the sentiment at the time?</span></p><p><br></p><p><br></p><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 24px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">The First World War</span></p><p>What was &nbsp; society to go through the war?</p><p>What happened to the empire during those years?</p><p><br></p><p><br></p><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 24px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">The Defeat</span></p><p>The empire collapses.</p><p>There&#39;s a brief German Revolution lead by Communist party (originated at this very time).</p><p>The defeat strikes a big hole in the heart of Germany.&nbsp;</p><p>The myth of being given a &quot;stab in the back&quot; takes hold and crystallizes in anti-semitism, as the thought was that it was only treason what made loosing the war possible.</p><p>The highly cost of the war puts Germany in huge debt right from the start.</p><p><br></p><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 24px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">The Weimar Republic</span></p><p>The allies imposed a democratic republic onto Germany, which was led by the Social Democrats. But the the institutions of the Old Empire where kept intact, as well as their civil servants, which where incredulous and unsupportive of the new government.</p><p><br></p><p>The Social Democrats really wanted to create a socialist state that would offer welfare and healthcare to its citizens. The healthcare system is their legacy. As was as the welfare is concerned, although their intentions where good, there was far too many people in need of help after the war, than what the state could cope with.</p><p><br></p><p>The reparation payments Germany had to paid, set by the Treaty of Versailles, was a cause of disgruntle among Germans, but also imposed grave economic difficulties.</p><p><br></p><p>The Treaty of Versailles also imposed military limitations, the army could only be so big, which lead the army to train soldiers in Russia.</p><p><br></p><p>The huge debt lead to the hyper inflation:</p><p>- Very quickly everything besides food lost its value</p><p>- People couldn&#39;t keep up with the constant devaluation</p><p>- Unemployment sky rocketed</p><p>- Some industrialists and big business took on loans that later where completely devaluated. This led to the myth that Jews where speculating in the market to take advantage of the situation.</p><p><br></p><p><br></p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>
6	2020-06-29 20:47:53.262232	2020-07-03 21:11:25.83376	The Stillborn God - Recap	<p>A detailed synopsis of the book &quot;The Stillborn God&quot; by Mark Lila.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	<h1>Introduction</h1><p>If we say that human civilization dates back to 3000 BC then we would be talking a full span of 4,500 years. 4,100 of those years the politics of any given civilization was basing it&#39;s existence and decisions on how and where it intersected with the divine. ((t 6 For less than the remaining 400 years)) we in roughly one-third of the world have been passive participants in the dogma of absolute knowledge that the divine is one thing, and politics is another. In the U.S. it&#39;s constitutionalized as the separation of church and state.</p><p><br></p><p>Depending upon where you live in the world today, you may or may not view any given political authority as divinely inspired, or even divinely ordained to hold and exercise that authority. If you fall in the later you are part of an experiment defining authority as something wholly human and not divine.&nbsp;</p><p><br></p><p>&quot;Politics is a dispute over authority. Who may legitimately exercise power over others, to what ends, and under what conditions.&quot; ((r 14 *)) &nbsp;If politics is a dispute over authority, then political theology is the dispute over authority where the justification provided is done so via the lens of religion and the supernatural. This state of divinity lends itself well to the state of politics under this definition. Religion lends itself to the mystical, the mystical to dogma, the dogma to unquestioned certainty which is quite convenient for justifying ones claim to authority, or politics.</p><p><br></p><h1>God In History</h1><p>The historical state of god can be placed at any given point within 3 distinct categories.</p><p><br></p><h3>The God of Pantheism</h3><p style="margin-left: 20px;">This god is not only present at all times, but is viewed less as an entity and more as a presence that permeates all material existence with it&#39;s divinity.</p><p><br></p><h3>The Distant God</h3><p style="margin-left: 20px;">This is the god who creates the world in seven days. Then for the remainder of time is walking away. This is a god a group of people or person may have some notion of, but only in a historical sense. It&#39;s inaccessible by any measure. As a perceived reality of this god is that the person or group is on their own when it comes to problem solving.</p><p><br></p><h3>The Transcendent God</h3><p style="margin-left: 20px;">This is the god of Christianity, Islam and Judaism. This god is somewhere between pantheism and the inaccessible god. The transcendent god created the material world and walked away, but not so far that it&#39;s guiding hand can&#39;t help shape the world it created. This god is one that balances some level of divine authority with individual freewill. This is the god whose blurry state of existence lends itself most conveniently to politics. It&#39;s there for justification when needed, but conveniently disappears when the authority may finally rest within our own individual natures.</p><p style="margin-left: 20px;"><br></p><p>These historical categories of god(s) were relatively consistent up until the Great Separation. An unarguably novel and perhaps modern view of god arose in the mid-17th century as philosophers like Hobbes, Locke and Hume began to ask if there wasn&#39;t another category of the historical god - the god of human imagination. Now that there is some historical precedent to the idea, philosophers and historians today may add this fourth category to the modern west of the last 350 years or so.</p><p><br></p><h1>The Origins of Religion</h1><h3>Four Points of View</h3><h4>Aristotle</h4><p style="margin-left: 20px;">((p 10 Aristotle)) made the influential suggestion that religion was born of wonder, which was then given expression through myth. Of importance is that even in early Greek philosophy we have a generally modern view of religion.</p><p><br></p><h4>The Epicureans</h4><p style="margin-left: 20px;">They speculated that religion arose from ignorance and fear of suffering, expressing hopes that the gods might protect us.</p><p><br></p><h4>The Euhemerists</h4><p style="margin-left: 20px;">Their argument is that many nations turn their heroes into gods and reasoned that many traditional gods probably began as human heroes.</p><p><br></p><h4>The Stoics</h4><p style="margin-left: 20px;">They emphasized the fact that, whatever role ignorance and fear may play in belief, basic religious notions across cultures are remarkably similar. This led them to lay out the genial theory that a magnanimous force (<em>spermatikos logos</em>) plants divine seeds in all human souls that blossom into roughly similar moral and religious ideas in all nations.</p><p><br></p><p>While for the general population religion was an inherent part of life, the four historical views above give some indication that there were thinkers and even full movements like Stoicism that was questioning the dogma of mostly Christian religion very early on. Our modern views of religion are only novel in that large swaths of the general population adhere to them. If Aristotle had made his argument to the masses in 350 BC he would likely have been laughed at. But were he to make his argument today to the modern masses a common response would be something along the lines of wondering why that guy is stating the obvious.</p><p><br></p><p>The state of religion in the mind of humans has been a slow moving train of philosophical analysis that have morphed and evolved over time. That sloth-like progression increased in speed rapidly as of 1651 when ((e 5 Thomas Hobbes published The Leviathan)).</p><p><br></p><h1>The Great Separation</h1><p>The Stoicism of the Renaissance must be viewed in historical context to understand the reactionary philosophy that emerged against it in the 17th and 18th centuries. While the Stoics preached religious tolerance to the extreme claiming that religions spawned from the same good seeds spread the world over, what the English philosopher ((p 4 Thomas Hobbes)) saw out his window was bloody wars between Protestants and Catholics. While the Stoics were somewhat romantic in their view of religion others were waist deep in the depravity, corruption and violence being forced upon them by these same good seeds the Stoics liked to talk about. Like many romantic ideas, the world expressed by the Stoics was one that sounded great on paper, but was nowhere to be found in Hobbes&#39; England.</p><p><br></p><p>In 1651 Hobbes published <em>The Leviathan</em>. Hobbes, building upon the very incomplete foundations laid by Aristotle, the Epicureans, and the Euhemerists turned the divine nexus on its head. Up until Hobbes politics was always viewed within the context of the divine nexus, or the point of intersection between God, nature and the human role within it. What Hobbes did was center the point of intersection not on God, but on man. He asked what is the role of God in man&#39;s imagination. This re-centering of man as the epicenter led to the radical and logical conclusion that there is no place for God in the modern world. If God himself was a creation of man, surely we could handle politics on our own as well. In fact, once recognized what is it that man is not capable of. The justification of human authority lies within itself, no longer requiring justification of a higher power. Hobbes would not be taken fully seriously by any thinkers to follow, but would be extremely influential in that he provided and intellectual path for the dismantling of political theology.</p><p><br></p><p>This rearrangement of the divine nexus opened the eyes of a new generation of philosophers. Now questions could be asked not about the role of man in God&#39;s nature, but instead about the role of God in man&#39;s culture. It&#39;s thanks to Hobbes that today it&#39;s commonplace to think of disciplines like the Anthropology of Religion, or Religion Studies or Religious Psychology. Before Hobbes, to study religion meant only to study theology. A god-centric study of sorts that allowed study from only a single direction, through the eyes of god. But now Hobbes had turned the tables and a whole new set of academics was developed now that people were able to see the world through their own eyes and not that of the divine.</p><p><br></p><p>Proteges of Hobbes were ((p 6 John Locke)) and ((p 5 David Hume)). Both expanded upon Hobbes with Locke publishing just a few decades after <em>The Leviathan</em> was published in the late 17<sup>th</sup> century and Hume publishing in the early to mid 18<sup>th</sup> century. Both philosophers however used Hobbes as their basic foundation. But neither accepted Hobbes simple, atheistic and singular approach of the elimination of religion all together. While both accepted that one source of religion could be the fear of suffering as the Epicureans believed, they argued it was more complex. A tolerance of religion emanates from their works, as well as their belief that as the world modernizes, religion would simply become unnecessary and be forgotten. It was under this concession of a denial of religion while maintaining a healthy tolerance of it that Locke first wrote philosophically about was would later be known as the separation of church and state.</p><p><br></p><h1>The Rise of the Modern God</h1><p>Thinkers following Hobbes, Locke and Hume would continue with their rejection of political theology and the divine nexus as imagined by the theologians before them, but would also begin making a number of arguments for why God did matter. While they continued to ask, like Hobbes, what was the role of god and religion in the imaginations of humans, they unlike Hobbes found a role worth having.</p><p><br></p><p>((p 7 Jean Jacques Rousseau)) was a novel thinker for his time. While the other French philosophers were thinking through their newly found lens of atheism, Rousseau began thinking differently. Religion for Rousseau was the underpinning of positive human sentiment. It played the role of shaping human thought, opinion and feeling towards morally acceptable behavior. It was also a social construct that he defended. As he illustrates in his novel <em>Emile,&nbsp;</em>a child tutored in isolation would have no reason to ask of God or religion. But when that child of isolation is released into a social world it becomes clear the role of religion in shaping society and the corresponding influences society has on the individual. Rousseau and those to follow him always fell back to the Hobbesian declaration that the darkness of religion is the dogma, revelation, redemption and messianism which according to Hobbes always leads to extremism. The truly novel idea put forward by Rousseau that would greatly influence thinkers to follow was that just maybe religion could exist as both a construct of human imagination and as an influence in social and political thought.</p><p><br></p><p>Rousseau was not anti-modern. This should be stressed. Instead Lila refers to him as a disappointed modern. While the Christian church was having to reckon with the secularization of the European world around them they found this secularization nowhere as debilitating as in the philosophy of Rousseau. Thomas Hobbes could be dealt with. The life of an atheist is one the theologians of the day could easily argue against in terms of quality of life. Who wishes to have such a pessimistic view of themselves. But Rousseau was very different. Rousseau managed to simultaneously both defend and tear down the walls of religion with a single strike. As stated earlier, Rousseau argued we were good by default. The goodness of religion was a reflection of the goodness of us. We may not think twice about this statement whether we agree or disagree. But in the 18th century when this logic was laid out it tore down and burned the doctrinal fabric that was the dogma or original sin. Rousseau would live in exile and be hunted for having proposed such blasphemy. So no, Rousseau was no theologian in his day. Only in our ultra-secularized lives do we today see him as an apologist.</p><p><br></p><p>((p 8 Emmanuel Kant)) would take the romanticism of Rousseau and apply to it a calculated logic. Kant rationalized morality. That rationalization included a place for god and religion, but that same rationalization further isolated Christianity from its dogmatic past relegating it to the role little more than moral guidance.</p><p><br></p><p>For Rousseau there was a natural goodness to the individual human. To Kant there was a natural evil. Kant assumed an innate moral dilemma he called the &#39;evil principle&#39;. With this assumption he reasoned the necessity of the church in countering this principle. He saw this in strictly moral terms though. Like Rousseau he was no apologist. Kant&#39;s philosophy of the &#39;transcendental illusion&#39; tore at the foundations of religious dogma. Lila describes this philosophy as &quot;reason that cannot exceed the fixed bounds of religious experience&quot;. We may <em>know</em> a bush is burning, and we may <em>think</em> that God set it on fire. What we cannot know is that there is a connection between the burning bush and God itself. This is the logical mistake theologians make all to often. This is the transcendental illusion. Rousseau tore down the Christian pillar of original sin. But Kant did something way more harmful to religion in general. He destroyed the very foundation on which the dogmas of all religions rest. And as Hobbes remarked, of what value is a religion with out its dogma? ((r 15 *))</p><p><br></p><p>Importantly Kant&#39;s logic required the reunification of church and state. For Kant modernity had not yet found its conclusion. Hobbes was right within the context of his time that religion is best left isolated of politics. But in a fully modern world it would be necessary to marry to two together once again. All this was due to the ethical dilemma of the evil principle. Religion would guide ethics and morality, but would be subordinate to the state whose job was that of the Hobbesian Leviathan. A state with a monopoly on violence. A state which could enforce the ethics of religion.</p><p><br></p><p>Another German philosopher ((p 9 Georg Hegel)) would take the last philosophical step to returning religion and god to a role that permeated the life of many Europeans and even more Germans. This god according to Hegel was not just a Protestant god, but a German god. This was a god whose role resided at the epicenter of culture itself. And more particularly at the core of German culture. In many ways, while Hegel was not political with his thought, he brought about an idea of being German and being of this god was one and the same thing. For better or worse Hegel played into the growing German nationalism of the early to mid 19th century.</p><p><br></p><p>Hegel, like Kant also saw ethics as a core role of religion. Hegel was only ten when Marie Antoinette and Louis XVI would be executed at the beginning of the French Revolution. As the revolution progressed he would have grown into a young adult watching the turmoil surrounding France. This event for him would become the proof he needed for his ethical argument. Protestantism was a fully modern religion. It both liberated the individual and continued to provide a guiding hand. The French Revolution was a a modern revolution void of Protestantism. Napoleonic revolutions and despotism is what you get when you have the modern man with no guiding principles. on this logic Hegel would build his arguments for Protestantism in particular.</p><p><br></p><p>The century comprised of the mid-18th to the early-19th centuries was important because it smoothed out the rough edges of the philosophy of Thomas Hobbes. The thinkers during this time believed that religion had both a light and dark side. But that the light side could be harnessed without the dark side. Their theologies showed what the good of religion was and how it could be harnessed. It was however romantic in its view of the world. These philosophers may have sought and recognized the good religion had to offer, but they never asked if the good could actually exist without the bad. Or more specifically, would the good have any reason to exist without the bad? They provided prescriptive blueprints for how to harness the good, but those blueprints came with no directions on how to avoid the bad.&nbsp;</p><p><br></p><h1>Liberal Theology</h1><p>The role of religion as defined by the philosophers Rousseau, Kant and Hegel was progressively moved into a state of theology. While religion was a topic of philosophical importance, German theologians took what they had learned and refocused on God and not the social roles.&nbsp;</p><p><br></p><p>It so happens that the last two great philosophers of religion were both German. England and the U.S. were both deeply entrenched in the separation of Church and State by the mid to late 19th century. But Germany was still feeling the massive weights of Kant and Hegel. In Germany it was much more difficult to break away from religion. As such German theologians found themselves in the unique position to tackle the unthinkable task of modernizing theology.</p><p><br></p><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">For the philosophers, religion was a utilitarian tool - a means to a moral end. For the liberal theologians religion once again became a source of divine realization. It was novel in its approach. One of the more eloquent of the liberal theologians Friedrich Schleiermacher described the new theology as simply &quot;one can find God by finding himself.&quot; Both historical views had now been merged. Once again religion played the role of finding God, but true to the modernization via the Enlightenment, one found God via anthropology.</span></p><p><br></p><p><span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Like Hegel, the liberal theologians saw Protestantism at the center. Only Protestantism and the individualism it preached was in a position to be modernized. There was something else at play in Germany during this time though. In the late 15th century Jews were exiled from Spain and Portugal. Over the next few centuries they would assimilate most thoroughly into German culture. Liberal theology and its emphasis on Protestantism concerned the Jews. Hegel&#39;s philosophy left no wiggle room for anything outside of it. So they were left with a decision - convert to Protestantism, or find an alternative to Hegel. They found their alternative in Kant. Kant&#39;s rigorous appeal to reason let stand any religion as an ethical guide. On this foundation German Jews began their own liberal theology with the addition that Judaism could live alongside Protestantism. Their new theology, much like that of the Protestant version lent itself well to German nationalism. Both came to see God not as some ephemeral being, but a God of Germany.</span></p><p><br></p><p>The worlds of both Protestant liberal theology and Jewish liberal theology came crumbling down in 1914 at the dawn of the Great War. Nationalism along with the modern role of religion as moral guide became increasingly difficult to rationally explain away. Jewish theologians and their Protestant counterparts did find ways, albeit somewhat lame attempts to reconcile the two. Many philosophers and theologians, came later to regret their having been taken in by German nationalism and their defenses of it. With the end of WWI came the demise of any understanding of what the modern world was or could be. And with the crumbling of any understanding of modernity came the death of liberal theology.</p><p><br></p><p>Liberal theology was full of optimism and perhaps had a skewed view of the modern human being. The underlying problem for Hobbes, Locke, and Hume were what they referred to as the Passions. For the liberal theologians these passions had been tamed paving the way for modern man to merge the modern form of rational religion with that of modern politics. WWI quickly illustrated that the Passions were far from dead.</p><p><br></p><h1>The Stillborn God</h1><p>A new brand of theology rose from the scarred battlefields of The Great War. The theologians were the students of the liberal theologians, but they were not liberal theologians.&nbsp;</p><p><br></p><p>When they asked how something as atrocious as WWI could have happened they pointed their finger at their teachers. If you take the divinity out of religion what would you expect to happen? In their mind WWI would be the logical conclusion of such a fallacy.</p><p><br></p><p>When they asked of what value is a religion void of revelation and redemption, they would not review the works of Hobbes who asked the same question. No, by this point Hobbes was a relic of the past. Hobbes would have said that a religion void of revelation and redemption is of no value. The new theologians would agree. Hobbes would have then said that a religion with revelation and redemption would be inseparable from politics. The two together had proven time and again the level of violence that could escalate from such a situation. The new theologians did not see it the same way. How do you add value to a valueless religion they asked. Add back the revelation and redemption.</p><p><br></p><p>The theologians of the Weimar republic saw a post-WWI Germany in need of both redemption and a messiah. Many of these theologians and philosophers who would play roles in the rise of the 3rd reich would come to regret their role. Many wouldn&#39;t.</p><p><br></p><p>Just as Hobbes had predicted, the complete collapse of German modernity in 1918 led to a return to dogmatic religion. The dogmas of religion were soon appropriated into the dogmas of politics. During the Weimar period political theology had found its footing once again. Soon it would come to be at the heart of justifying political dogmas such as eugenics and German supremacy. The historical thread wove its way through time, but in the end a God stripped of divinity, redemption and revelation is indeed not a God worth having. The modern God was a stillborn God.</p><p><br></p><h1>Conclusion</h1><p>When power is justified via the divine nexus you have a political theology. In much of today&#39;s western societies it appears that politics are content with being unburdened by religion and much of the baggage it brings. The same can be said for religion. Globally this cannot be stated however. The middle-east is probably the most obvious of contemporary examples of political theology at play. The Iranian Revolution over the course of just a few years re-centered the divine nexus of Iranian politics on God and the power vested in man by Him.</p><p><br></p><p>The European wars of religion were fresh in the minds of the authors of the U.S. constitution. The words and warnings of Hobbes, Locke and Hume were also fresh. The theologians of the Weimar republic had forgotten the writers of the Great Separation and were pulled back into political theology. &nbsp;<span style="color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Iran was a secularized nation pre-1979 only to have religion and politics merged to form the Theocracy that it is today. &nbsp;</span>Politics is the struggle for power, and while God is defined as a source of power it will be a natural draw to those struggling for it.</p><p><br></p><p>For those of us in the West the Great Separation has become almost dogmatic. This is no less dangerous than the pre-Hobbesian political dogma that the King was a direct subject of God. When the Great Separation becomes dogmatic we forget its experimental nature. We forget that of the last 5000 years of human culture only 7% of that time has been part of this experiment. We forget that only a small portion of the world buys into this experiment. And yet by most measures against current states of the world and pre-Hobbesian states of the world, it appears to work better at a minimum. &nbsp;If religion holds power, and if we become complacent and forget what the Great Separation implies, we can rest assured that politics will be drawn to that power. As Lila states, &quot;we just can&#39;t let God be.&quot;</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>
\.


--
-- Data for Name: essay_event; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.essay_event (id, created, modified, essay_fk, event_fk) FROM stdin;
5	2020-06-29 20:49:53.603919	2020-06-29 20:49:53.603919	6	367
\.


--
-- Name: essay_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.essay_event_id_seq', 5, true);


--
-- Name: essay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.essay_id_seq', 6, true);


--
-- Data for Name: essay_note; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.essay_note (id, created, modified, note, reference_chapter, reference_page, essay_fk, reference_fk) FROM stdin;
8	2020-05-08 19:40:55.941399	2020-05-08 19:40:55.941399	"Fragility is a disturbing prospect. We see this in our children, who love fairy tales where occult forces threatening their little worlds are exposed and mastered. We are still like children when it comes to thinking about modern political life, whose experimental nature we prefer not to contemplate. Instead, we tell ourselves stories about how our big world came to be and why it is destined to persist. These are legends about the course of history, full of grand terms to describe the process supposedly at work -- modernization, secularization, democratization, the 'disenchantment of the world', 'history as the story of liberty', and countless others.These are the fairy tales of our time Whether they are recounted in epic mode by those satisfied with the present, or in tragic mode by those nostalgic for Eden, they serve the same function in our intellectual culture that tales of witches and wizards do in our children's imaginations: they make the world legible, they reassure us of its irrevocability, and they relieve us of responsibility for maintaining it."	Introduction	6	4	70
9	2020-05-08 20:48:08.787577	2020-05-08 20:48:08.787577	Recently scientists reviewing a large sample of DNA found via gene sequencing that europeans are 1% to 6% neanderthal. That is sapiens are actually cross bred to some extent with other species. The same was found with Asians, except the cross breed was with homo erectus. This objective truth opens a whole can of worms for anyone looking to make the argument that we're all of the same species. Scientists generally appear to have no reason to push this truth as it would appear the truth would only complicate an already complicated narrative. In the worst case scenario such a truth may lead to an argument for eugenics. That is would humanism still apply if the argument were made scientifically that the 'other' is actually of a different species. Probably not given that it is still just 1 to 6 percent. But the argument that we're all the same becomes difficult in light of this evidence and the claims it implies.	\N	\N	4	\N
10	2020-05-08 20:55:19.678341	2020-05-08 20:55:19.678341	Historically, we can look back on elements that truth today has explained away. So much so that we might even consider it inconceivable that it ever occurred in the first place. We view stories of people sacrificing an animal in order to ensure the remainder of the herd would be fertile as mythological stories, tending to forget that these things actually happened and the people performing such acts actually believed it to be truth. We know that the rains would have come whether sacrifice was made or not.	\N	\N	4	\N
11	2020-05-19 23:16:42.59214	2020-05-19 23:16:42.59214	<p>A very high level example of a set of truths impacting traditional thought is the move from political theology to political theory or political science. This change occurred beginning with the publishing of Thomas Hobbes&#39; <em>Leviathan&nbsp;</em>in 1651. Here he changed the subject entirely moving the focus from religion and politics as some union or intersection between God and Nature and the role of humans within that nature, to simply viewing both religion and politics as of human origin. This strictly anthropological view of religion changed the course of religious and political history going forward. Future philosophers like Locke, Spinoza, Hume and others would build upon the works of Hobbes eventually culminating in the U.S. constitution and later the French Revolution.</p><p><br></p><p>While there is no particular truth necessarily to be found within the works of these writers moving away the theological aspects of politics to a more human centric view of politics, the true remains that you could quantifiably show that the human centric view of politics is better than that of the theological view of politics, at least when viewed through the lens of human well being.&nbsp;</p><p><br></p><p>How did people cope with this change? From what I can tell at this point it appears to have maybe been a slow boiling frog type of change. That is there was no particular revolution. Although, something like the French Revolution may be seen as an example of having changed too quickly and as a result having created large amounts of violence. The U.S. on the other hand appeared to have strove for this from the beginning and as such had low amounts of violence as is concerning this particular change in ideaology.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	4	70
12	2020-06-30 10:17:17.212328	2020-06-30 10:50:39.892441	<h1>Essay Categories</h1><h3>Introduction</h3><ul><li>What is politics?</li><li>What is political theology?</li><li>What is the divine nexus?</li><li>What is the historical context of both political theology and the modern West&#39;s separation from it?</li><li>Note the experimental nature of the separation.</li></ul><p><br></p><h3>The Historical God</h3><ul><li>Cover the 3 categories of the historical god(s).&nbsp;</li><li>Lead that into the possibility of a 4th category post Great Separation. That is the god of human imagination. The reworkings of the role man in god&#39;s nature vs. the role of god in man&#39;s nature.</li></ul><p><br></p><h3>Origins of Religion</h3><ul><li>Cover early historical explanations of religion.</li><li>Explain the significance in that our modern way of thinking about religion is not necessarily new. It&#39;s simply widely adopted.</li><li>How did these early philosophies bring European thinkers to the role reversal of the divine nexus?</li></ul><p><br></p><h3>The Great Separation</h3><ul><li>Background on Thomas Hobbes and his treatise on religion and power <em>The Leviathan</em>.</li><li>What was the historical context that led Hobbes to view politics and theology in a wholly new way.</li><li>Include in this section backgrounds on John Locke and David Hume.&nbsp;</li><li>Discuss how Locke and Hume smoothed out the sharp and unapologetic edges of Thomas Locke, finding a place for religion in a social context with the understanding that modernization would eventually lead to a point where the necessity of religion would disappear along with the construct itself.</li></ul><p><br></p><h3>The New Roles of Religion</h3><ul><li>Begin with Rousseau and his view of religion as a necessary social construct. Viewing religion as the purest and most benevolent form of human sentiment.</li><li>Then move to Kant who followed up on the romanticism of Rousseau with a cold moral logic. Kant laid out a logical and rational argument for religion as the moral center of human society.</li><li>Lastly move on to Hegel. Here religion takes on a final role of this period where it becomes the logical core human culture. At this point religion is centered on things from the arts to human behavior.</li><li>Summarize the importance of this century where religion begins to get more and more of it&#39;s foot back into the door of human life. It&#39;s important to note that all of these thinkers preserved the Hobbesian view that religious dogma, messianism, redemption, revelation, and messianism came to nothing but evil. Where Hobbes argued that religion was pointless without those things there would be no point in stripping it of its evil and leaving only the good. Rousseau and his proteges disagreed arguing that there was too much value in religion to just trash the whole thing.</li></ul><p><br></p><h3>Liberal Theology</h3><ul><li>At this point theological views have finally moved out of the realm of philosophy and back into theology. During this period in the late 19th century up to WWI in 1914 theologians take on the near impossible task of reconciling theology with the modernity and secular politics of the time.</li><li>This was a largely German undertaking and despite it&#39;s secular and modern talk was infused with extreme nationalism.&nbsp;</li><li>Thinking during this time came out of both Protestant and Jewish theologians.</li><li>Theology of this time came to accept secularization and modernity as the next step in historical theology. This modernization of theology lent itself well to finding a place in German politics again.</li></ul><p><br></p><h3>The Stillborn God</h3><ul><li>The Great War breaks loose upon Europe and particularly Germany in 1914. Over the course of 4 years German culture, institutions, and the social fabric collapsed and dissolved into the history books.</li><li>Part of this collapse was the collapse of Liberal Theology. Post-WWI the radical theologians nostalgic for a pre-Hobbesian past began finding connections between the Liberal Theologies of the recent past and WWI. A theology devoid of God, redemption and revelation? Of what value is this they asked? These questions were the same questions predicted centuries earlier by Hobbes. But by this point Hobbes is forgotten. Like Hobbes the theologians of the Weimar republic answered that a religion without God, revelation and redemption was no religion at all. Unlike Hobbes who opted to kill off the whole thing, these theologians did the opposite. They infused the Protestant god as one that is both redemptive and revelatory.</li><li>Proving the basic thesis of Hobbes over the course of a couple decades this dogmatic religion would be bound to be infused with the German politics of the time.</li><li>The dogma of eugenics and German supremacy found through the rise of the 3rd reich were predictably appropriated from the dogmas pushed by this new generation of Protestant and Jewish theologians.</li><li>This full-circle conclusion so feared by Hobbes proved his thesis in it&#39;s simplest terms. That dogmatic religion is inseparable from dogmatic politics. That a religion without dogmatic principles is a religion not worth having. This is the religion of Liberal Theology. Their god was a stillborn god.</li></ul><p><br></p><h3>Conclusion</h3><ul><li>Quickly and simply summarize the multi-century story of the experiment that is the Great Separation of theology and politics.</li><li>What lessons can be drawn by understanding this history?<ul><li>Don&#39;t be complacent.&nbsp;</li><li>Dogma is dogma, be it political or theological. Dogma feeds off itself creating a cycle that according to Hobbes always ends in violence.</li><li>Be sober and be honest when viewing this cycle and our own role within it. While Rousseau may have inadvertently opened a path for the reemergence of dogmatic religion he was on to something. Religion is at the core of all historical human cultures. We ask questions about our own role in the universe and we&#39;re often not content with nihilism. As Lila states, we &quot;just can&#39;t let God be.&quot;</li></ul></li></ul><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	6	\N
\.


--
-- Name: essay_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.essay_note_id_seq', 12, true);


--
-- Data for Name: essay_person; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.essay_person (id, created, modified, essay_fk, person_fk) FROM stdin;
4	2020-06-29 20:49:10.848654	2020-06-29 20:49:10.848654	6	81
5	2020-06-29 20:49:19.302127	2020-06-29 20:49:19.302127	6	84
6	2020-06-29 20:49:25.713833	2020-06-29 20:49:25.713833	6	83
7	2020-06-29 20:49:31.955622	2020-06-29 20:49:31.955622	6	88
8	2020-06-29 20:49:39.686174	2020-06-29 20:49:39.686174	6	89
9	2020-06-29 20:49:45.398318	2020-06-29 20:49:45.398318	6	92
10	2020-06-29 22:53:18.443902	2020-06-29 22:53:18.443902	6	76
\.


--
-- Name: essay_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.essay_person_id_seq', 10, true);


--
-- Data for Name: essay_reference; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.essay_reference (id, created, modified, chapter, page, essay_fk, reference_fk) FROM stdin;
6	2020-06-27 13:14:16.615878	2020-06-27 13:14:16.615878	German Peculiarities	3	5	74
7	2020-06-27 18:03:47.426012	2020-06-27 18:03:47.426012	German Peculiarities	5	5	74
8	2020-06-27 18:28:58.153196	2020-06-27 18:28:58.153196	German Peculiarities	7	5	74
9	2020-06-27 19:03:31.008944	2020-06-27 19:03:31.008944	\N	25	5	75
10	2020-06-27 19:48:20.560405	2020-06-27 19:48:20.560405	German Peculiarities	12	5	74
11	2020-06-27 20:19:50.491314	2020-06-27 20:19:50.491314	German Peculiarities	13	5	74
12	2020-06-27 21:45:46.674427	2020-06-27 21:45:46.674427	German Peculiarities	14	5	74
13	2020-06-27 22:10:54.708645	2020-06-27 22:10:54.708645	German Pecularities	16	5	74
14	2020-06-29 21:39:19.258316	2020-06-29 21:39:19.258316	Chapter 1: The Crisis	22	6	70
15	2020-07-01 23:02:36.629795	2020-07-01 23:02:36.629795	3: The Ethical God	137	6	70
\.


--
-- Name: essay_reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.essay_reference_id_seq', 15, true);


--
-- Data for Name: essay_timeline; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.essay_timeline (id, created, modified, essay_fk, timeline_fk) FROM stdin;
6	2020-06-29 20:48:59.517611	2020-06-29 20:48:59.517611	6	16
\.


--
-- Name: essay_timeline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.essay_timeline_id_seq', 6, true);


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.event (id, created, modified, label, description, event_end_day, event_end_era_fk, event_end_month_fk, event_start_day, event_start_era_fk, event_start_month_fk, reference_fk, event_start_year, event_end_year) FROM stdin;
48	2020-02-21 07:50:13.064572	2020-02-21 07:50:13.064572	The Conquest of the Balkans	After taking Constantinople in 1453, Mehmed II claimed the remaining Byzantine possessions, finally seizing Morea in 1460. He conquered Serbia in 1454 and annexed Bosnia in 1463. Moldavia and the Republic of Ragusa both yielded peacefully to the Ottomans and became tributary states. Only a failed siege of Belgrade in 1456 halted Ottoman advances further west.	\N	2	\N	\N	2	\N	48	1453	1495
11	2020-02-07 13:04:15.098616	2020-02-11 16:53:35.615118	Portuguese Colonization of Brazil	The period where the Portuguese were colonizing what is modern day Brazil.	\N	2	\N	\N	2	\N	48	1500	1531
8	2020-02-06 11:46:52.080514	2020-02-06 11:46:52.080514	Earth Formed	The planet earth comes into being.	\N	1	\N	\N	1	\N	49	4600000000	4600000000
9	2020-02-06 11:48:05.340054	2020-02-06 11:48:05.340054	First Multicellular Life	The first multi-celled organisms appear. These were all underwater plants.	\N	1	\N	\N	1	\N	49	900000000	900000000
10	2020-02-07 10:24:41.82373	2020-02-07 10:24:41.82373	Early Life Experiments	The first indications of organic life emerge.	\N	1	\N	\N	1	\N	49	4000000000	4000000000
12	2020-02-07 13:06:32.289083	2020-02-07 13:06:32.289083	Spanish Conquest of the Maya	Francisco de Montejo began the process of reducing the Maya in 1527. He had made significant progress by 1527. But it wasn't until 1697 when the last Maya city fell to the Spanish.	\N	2	\N	\N	2	\N	48	1527	1697
13	2020-02-07 13:07:56.961683	2020-02-07 13:07:56.961683	LUCA Exists	LUCA is the "Last Universal Common Ancestor". This is the ancestor of all present day life.	\N	1	\N	\N	1	\N	49	3800000000	3800000000
14	2020-02-07 16:46:09.83951	2020-02-07 16:46:09.83951	Prokaryotes	Bacteria followed by archaea	\N	1	\N	\N	1	\N	49	3500000000	3500000000
15	2020-02-07 16:46:59.413323	2020-02-07 16:46:59.413323	Eukaryotes	Unicellular protists	\N	1	\N	\N	1	\N	49	2000000000	2000000000
16	2020-02-07 16:47:55.277967	2020-02-07 16:47:55.277967	Common Protist Ancestor	This is the last common ancestor of all plants, fungi, and animals	\N	1	\N	\N	1	\N	49	1200000000	1200000000
17	2020-02-07 16:49:08.125982	2020-02-07 16:49:08.125982	Specific Protist Ancestor	The specific genetic ancestor of all plants, fungi, and animals.	\N	1	\N	\N	1	\N	49	1000000000	1000000000
18	2020-02-07 16:49:57.151036	2020-02-07 16:49:57.151036	First Animals Appear	These first animals were sponges.	\N	1	\N	\N	1	\N	49	800000000	800000000
19	2020-02-07 16:51:11.81481	2020-02-07 16:51:11.81481	Radial Animals Appear	The earliest known appearance of the hydra, jellyfish, and comb jellies.	\N	1	\N	\N	1	\N	49	700000000	700000000
21	2020-02-07 16:52:57.5998	2020-02-07 16:52:57.5998	First Invertebrate Protostomes	These were worms, anthropods, and mollusks	\N	1	\N	\N	1	\N	49	600000000	600000000
22	2020-02-07 16:53:43.339421	2020-02-07 16:53:43.339421	Invertebrate Deuterostomes Appear	These were Pikaia and Starfish.	\N	1	\N	\N	1	\N	49	580000000	580000000
23	2020-02-07 16:54:21.992043	2020-02-07 16:54:21.992043	Cambrian Explosion Begins	\N	\N	1	\N	\N	1	\N	49	543000000	543000000
24	2020-02-07 16:55:03.352164	2020-02-07 16:55:03.352164	Invertebrate Chordates Appear	These were lancelets and urochordates.	\N	1	\N	\N	1	\N	49	540000000	540000000
25	2020-02-07 16:55:59.768185	2020-02-07 16:55:59.768185	Vertebrates Appear	Haikouella	\N	1	\N	\N	1	\N	49	530000000	530000000
26	2020-02-07 16:56:28.85596	2020-02-07 16:56:28.85596	Jawless Fish	Lamprey form.	\N	1	\N	\N	1	\N	49	505000000	505000000
27	2020-02-07 16:57:17.944763	2020-02-07 16:57:17.944763	Cambrian Explosion Ends	\N	\N	1	\N	\N	1	\N	49	490000000	490000000
28	2020-02-07 16:57:59.376908	2020-02-07 16:57:59.376908	Jawed Fish Appear	This is most of the common fish we're familiar with today.	\N	1	\N	\N	1	\N	49	480000000	480000000
29	2020-02-07 16:58:43.670521	2020-02-07 16:58:43.670521	Plants Colonize Land	Water based plants evolve to be land-based.	\N	1	\N	\N	1	\N	49	465000000	465000000
31	2020-02-07 17:00:02.593381	2020-02-07 17:00:02.593381	Synapsids Appear	These were mammal-like reptiles.	\N	1	\N	\N	1	\N	49	310000000	310000000
32	2020-02-07 17:00:42.655243	2020-02-07 17:00:42.655243	Sauropsids Appear	First appearance of true reptiles.	\N	1	\N	\N	1	\N	49	305000000	305000000
33	2020-02-07 17:01:08.097743	2020-02-07 17:01:08.097743	Dinosaurs Appear	\N	\N	1	\N	\N	1	\N	49	230000000	230000000
34	2020-02-07 17:01:31.802622	2020-02-07 17:01:31.802622	Mammals Appear	\N	\N	1	\N	\N	1	\N	49	210000000	210000000
35	2020-02-07 17:01:52.1458	2020-02-07 17:01:52.1458	Birds Appear	\N	\N	1	\N	\N	1	\N	49	150000000	150000000
36	2020-02-07 17:02:16.401566	2020-02-07 17:02:16.401566	Flowering Plants Appear	\N	\N	1	\N	\N	1	\N	49	130000000	130000000
37	2020-02-07 17:02:45.978543	2020-02-07 17:02:45.978543	First Primates Appear	\N	\N	1	\N	\N	1	\N	49	70000000	70000000
38	2020-02-07 17:03:17.850392	2020-02-07 17:03:17.850392	Apes Appear	\N	\N	1	\N	\N	1	\N	49	25000000	25000000
39	2020-02-07 17:03:44.44269	2020-02-07 17:03:44.44269	First Humans Appear	\N	\N	1	\N	\N	1	\N	49	6000000	6000000
49	2020-02-21 07:51:26.907224	2020-02-21 07:51:26.907224	Ottomans Capture Constantinople	The city of Constantinople is captured by Mehmed II.	\N	2	\N	\N	2	\N	48	1453	1453
20	2020-02-07 16:51:58.375086	2020-02-13 20:40:13.758382	Bilateral Animals Appear	These were flatworm-like organisms.	\N	1	\N	\N	1	\N	49	630000000	630000000
7	2020-02-06 11:31:43.905794	2020-02-18 13:07:03.955391	The Big Bang	Believed initial cosmic event. Sets off everything to follow.	\N	1	\N	\N	1	\N	49	13800000000	13800000000
42	2020-02-12 09:11:23.001862	2020-02-12 17:13:52.716468	Zapotec Culture	The Zapotecs emerged in the valleys in and around Oaxaca. They constructed an impressive cultural hub in Monte Alban, which featured grand terraces, plazas, and a ceremonial platform shaped like the base of a pyramid located centrally on a hilltop.	\N	2	\N	\N	1	\N	48	500	900
50	2020-02-21 08:03:07.76029	2020-02-21 08:03:07.76029	Ottomans Capture Morea	The city of Morea is captured by Mehmed II.	\N	2	\N	\N	2	\N	48	1460	1460
30	2020-02-07 16:59:29.953627	2020-02-18 20:07:50.254437	Amphibians Appear	These are biologically tetrapods with lungs.	\N	1	\N	\N	1	\N	49	350000000	350000000
45	2020-02-19 08:15:18.35314	2020-02-19 08:15:18.35314	The Ninety-Five Theses	Martin Luther pinned his Ninety-five Theses to the door of Wittenberg Castle Church in October 1517. The document listed 95 complaints against the Church and adopted new theological positions on topics such as salvation and the interpretation of communion The tract caused a huge stir throughout Europe, and led to his excommunication by the Catholic Church in 1521.	\N	2	\N	\N	2	10	48	1517	1521
46	2020-02-19 08:18:33.976513	2020-02-19 08:18:33.976513	The Catholic-Protestant Conflict	In 1530, the Holy Roman Emperor Charles V ordered all Protestant churches to abandon their reforms, sparking a series of wars in the 1540s and 1550s. Eventually, peace was brokered in 1555 at Augsburg, Germany, with the Catholic Church agreeing to accept Protestantism but only in those German states that had already adopted the religion.	\N	2	\N	\N	2	\N	48	1530	1555
47	2020-02-19 09:31:17.002176	2020-02-19 09:31:17.002176	Religious Conflict In France	Religious wars initially broke out in 1534 after King Francis I tried to repress Protestantism on French soil. On St. Bartholomew's Day in 1572, thousands of Protestants, known as JHuguenots, were massacred in Paris. In 1598, Henri IV, a former Huguenot, issued the Edict of Nantes, which tolerated Protestantism in France. Protestants also faced persecution in London and Rome.	\N	2	\N	\N	2	\N	48	1534	1598
51	2020-02-21 08:04:41.078427	2020-02-21 08:04:41.078427	Ottomans Capture Serbia	Serbia is captured by Mehmed II.	\N	2	\N	\N	2	\N	48	1454	1454
52	2020-02-21 08:05:25.982675	2020-02-21 08:05:25.982675	Ottomans Annex Bosnia	Bosnia is annexed by Mehmed II.	\N	2	\N	\N	2	\N	48	1463	1463
112	2020-03-11 16:54:04.841191	2020-03-11 16:54:04.841191	Presidency Of Franklin Pierce	\N	4	2	3	4	2	3	57	1853	1857
53	2020-02-21 08:09:59.613805	2020-02-21 08:09:59.613805	Selim Claims the Caliphate	Sultan Selim I began his conquest of Mamluk-ruled Syria and Egypt in 1516. His army swept away the resistance at Aleppo and Damascus and proclaimed victory by hanging the Mamluk caliph at the Gates of Cairo. By gaining guardianship of the Islamic holy cities of Medina and Mecca, the Ottomans effectively became the fourth major Caliphate after the Rashidums, Umayyads, and the Abbasids.	\N	2	\N	\N	2	\N	48	1512	1520
54	2020-02-21 08:12:25.265511	2020-02-21 08:12:25.265511	The Ottomans Declare Victory Over Cairo	The Ottomans declare this victory by hanging the previous Caliph Mamluk at the gates of Cairo.	\N	2	\N	\N	2	\N	48	1517	1517
55	2020-02-21 08:18:47.536146	2020-02-21 08:18:47.536146	Ottomans Claim Aleppo	The city of Allepo falls to the Ottomans.	\N	2	\N	\N	2	\N	48	1516	1516
56	2020-02-21 08:19:31.548853	2020-02-21 08:19:31.548853	Ottomans Claim Damascus	The city of Damascus falls to the Ottomans.	\N	2	\N	\N	2	\N	48	1516	1516
57	2020-02-21 08:22:31.704994	2020-02-21 08:22:31.704994	Hungary Becomes Ottoman Vassal State	The Hugarians are defeated at Mohacs by Suleyman the Magnificent.	\N	2	\N	\N	2	\N	48	1526	1526
58	2020-02-21 08:24:49.36925	2020-02-21 08:24:49.36925	Ottomans Strike Austrian Habsburg	The Austrian ruler Ferdinand I attempted to recapture the Hungarian state, but the Ottomans struck back by besieging Vienna . Suleyman failed to take the Habsburg city, but he remained overlord of Hungary.	\N	2	\N	\N	2	\N	48	1529	1529
59	2020-02-21 08:26:10.526041	2020-02-21 08:26:10.526041	The Rule of Suleyman the Magnificent	\N	\N	2	\N	\N	2	\N	48	1520	1566
60	2020-02-21 08:29:07.412839	2020-02-21 08:29:07.412839	Ottomans Naval Warfare	In 1522, the Ottoman navy expelled the Knights of St John (a crusader army) from Rhodes and, in 1529, captured Algiers.  Following the Ottoman's assault on Cyprus in 1570, European powers formed the Holy League. A year later, the League's fleet, led by Don Juan of Austria, crushed the Ottomans at Lepanto, ending Ottoman naval dominance in the eastern Mediterranean.	\N	2	\N	\N	2	\N	48	1522	1571
61	2020-02-21 08:29:55.884478	2020-02-21 08:29:55.884478	Ottoman Navy Defeats the Knights of St. John	\N	\N	2	\N	\N	2	\N	48	1522	1522
62	2020-02-21 08:30:30.122356	2020-02-21 08:30:30.122356	Ottomans Capture Algiers	\N	\N	2	\N	\N	2	\N	48	1529	1529
63	2020-02-21 08:31:36.564897	2020-02-21 08:31:36.564897	Holy League Is Formed	The European powers formed the "Holy League" in response to the Ottomans attack on Cyprus.	\N	2	\N	\N	2	\N	48	1570	1570
64	2020-02-21 08:33:03.80554	2020-02-21 08:33:03.80554	Holy League Defeats Ottoman Naval Fleet	At Lepanto, the Holy League navy defeats the Ottomans ending their period of naval dominance.	\N	2	\N	\N	2	\N	48	1571	1571
65	2020-02-21 08:36:18.662506	2020-02-21 08:36:18.662506	Governing The Empire	The capture of Tunis in 1574 sealed the Ottoman domination of the eastern and central Maghreb. The Ottomans also invaded the western frontier of the Safavid Empire, taking several cities, including Derbent and Baku in the north. After the reign of Suleyman I, power struggles between the viziers and the harem (the sultan's personal household) challenged the sultan's authority and weakened the empire.	\N	2	\N	\N	2	\N	48	1566	1639
66	2020-02-21 08:37:12.287355	2020-02-21 08:37:12.287355	Ottomans Capture Tunis	The country of Tunis falls to the Ottomans.	\N	2	\N	\N	2	\N	48	1574	1574
67	2020-02-21 08:38:01.502793	2020-02-21 08:38:01.502793	Ottomans Capture Derbent	The city of Derbent falls to the Ottomans.	\N	2	\N	\N	2	\N	48	1578	1578
68	2020-02-21 08:38:40.118494	2020-02-21 08:38:40.118494	Ottomans Capture Baku	The city of Baku falls to the Ottomans.	\N	2	\N	\N	2	\N	48	1583	1583
69	2020-02-21 08:41:50.296358	2020-02-21 08:41:50.296358	The Siege of Vienna	Commanded by Grand Vizier Kara Mustafa Pasha, the Ottomans attacked Habsburg Austria in 1681, capturing northern Hungary in 1682 and besieging Vienna in July 1683. The Christian states formed a coalition and despatched an army led by the Polish king Jan Sobieski, who liberated Vienna 2 months later. Kara Mustafa was executed for his role in the defeat.	\N	2	\N	\N	2	\N	48	1681	1683
70	2020-02-21 08:42:37.725951	2020-02-21 08:42:37.725951	Ottomans Attach Habsburg Austria	The Ottomans begin their attack on Austria Hungary.	\N	2	\N	\N	2	\N	48	1681	1681
71	2020-02-21 08:43:21.917426	2020-02-21 08:43:21.917426	Northern Hungary Captured	Parts of northern Hungary are captured.	\N	2	\N	\N	2	\N	48	1682	1682
75	2020-02-21 08:49:40.88306	2020-02-21 08:49:40.88306	The Morean War	The Venetian Republic launched a campaign to conquer Morea in 1684. After taking the peninsula in 1687, the army marched to Athens, where it fired mortars at the Ottoman garrison stationed inside the Acropolis, causing great destruction to the Parthenon. A Venetian win led to the Ottomans signing the Treaty of Karlowitz, ceding Morea and parts of Dalmatia to Venice.	\N	2	\N	\N	2	\N	48	1684	1699
76	2020-02-21 08:53:18.264506	2020-02-21 08:53:18.264506	The Venetian Republic Captures Morea	The Venetian Republic takes back Morea on the Greek peninsula which was originally captured by the Ottomans in 1460.	\N	2	\N	\N	2	\N	48	1684	1684
77	2020-02-21 08:54:30.073241	2020-02-21 08:54:30.073241	Venetian Republic Captures Greek Peninsula	After taking Morea in 1684 the Venetian Republic continued to conquer Ottoman territory until the whole peninsula was under Venetian rule.	\N	2	\N	\N	2	\N	48	1687	1687
78	2020-02-21 08:58:18.017566	2020-02-21 08:58:18.017566	Treaty of Karlowitz Signed	After sieging the Ottomans at Athens, the Ottomans sign a peace treaty known as "The Treaty of Karlowitz" with the Venetian Republic. This ceded much of the Greek peninsula up to Venice to the Venetian Republic.	\N	2	\N	\N	2	\N	48	1699	1699
79	2020-02-21 20:13:59.851316	2020-02-21 20:13:59.851316	Jesus Is Crucified	Jesus of Nazareth is crucified by the Romans.	\N	2	\N	\N	2	\N	48	33	33
80	2020-02-21 20:15:09.561935	2020-02-21 20:15:09.561935	Fall of the Berlin Wall	The Berlin Wall that divided Germany during communist rule falls.	\N	2	\N	\N	2	\N	52	1989	1989
81	2020-03-05 14:28:17.371571	2020-03-05 14:28:17.371571	Reign Of Shah Mohammad Reza Pahlavi	The Shah of Iran attained the throne when his father Reza Shah Pahlavi abdicated. The Shah was removed during the Iranian Revoluation.	\N	2	\N	\N	2	\N	56	1941	1979
82	2020-03-05 14:32:13.892673	2020-03-05 14:32:13.892673	Partition of Israel	On this day the UN General Assembly approved the partition plan for the new Israeli state.	29	2	11	29	2	11	56	1947	1947
83	2020-03-05 14:35:05.569142	2020-03-05 14:35:05.569142	British Troops Leave Israel	On this day the last of the British troops left the new state of Israel. Jewish leaders officially declare the new state.	14	2	5	14	2	5	56	1948	1948
84	2020-03-05 14:37:04.168664	2020-03-05 14:37:04.168664	Arab Countries Invade Israel	A day after British troops departed the newly created state of Israel the Arab countries who rejected the new state declared war and sent out thousands of troops and tanks to cross the border of the Israeli state.	15	2	5	15	2	5	56	1948	1948
73	2020-02-21 08:45:44.4479	2020-03-05 19:47:19.836891	Christian States Coalition Formed	The Christian states formed a coalition and despatched an army led by the Polish king Jan Sobieski.	\N	2	8	\N	2	8	48	1683	1683
74	2020-02-21 08:46:36.230984	2020-03-05 19:47:52.597905	Vienna is Liberated	The army of the Christian states coalition successfully liberates Vienna from the Ottoman siege.	\N	2	9	\N	2	9	48	1683	1683
166	2020-03-11 17:47:08.330033	2020-03-11 17:47:08.330033	Reign Of King William II Rufus	\N	\N	2	\N	\N	2	\N	57	1087	1100
167	2020-03-11 17:47:31.062448	2020-03-11 17:47:31.062448	Reign Of King Henry I	\N	\N	2	\N	\N	2	\N	57	1100	1135
85	2020-03-05 14:45:48.194695	2020-03-05 14:45:48.194695	The Six Day War	A War between Isreal and neighboring states Egypt, Jordan and Syria. Israel wins this war and gains more land from the Arabs including Gaza, the West Bank, East Jerusalem (including the walled old city), Egypt's Sinai, and Syria's Golan Heights.	10	2	6	5	2	6	56	1967	1967
86	2020-03-05 18:20:47.029845	2020-03-05 18:20:47.029845	Yasser Arafat Becomes Chairman of the Palestinian Liberation Organization	The Palestinian Liberation Organization is known by its acronym PLO.	\N	2	\N	\N	2	\N	56	1969	1969
87	2020-03-05 18:23:51.123397	2020-03-05 18:23:51.123397	Jordan Suppresses the PLO	The Palestinian Liberation Organization (PLO) led by Yasser Arafat was moving into Jordan and setting up armed factions. These factions were using primarily the refugee camps in Jordan for recruitment.	\N	2	\N	\N	2	\N	56	1969	1969
88	2020-03-05 18:41:47.810289	2020-03-05 18:41:47.810289	Arson Attack on the Rex Cinema in Abadan, Iran	People had already been rioting in the streets of Iran. But this level of violence was a turning point. 420 people were killed in the attack. When the building was set on fire, all of the doors were locked trapping all inside who burned alive.	19	2	8	19	2	8	56	1978	1978
89	2020-03-05 18:47:33.18749	2020-03-05 18:47:33.18749	Black Friday Protests in Iran	At this time the number of protesters in Tehran swelled to almost half a million. What has become known as Black Friday was another turning point in the Iranian Revolution. Thousands converged on Jaleh Square, chanting Marg bar shah (Death to the Shah). The crowd of mostly men was a mix of Khomeini supporters, students, and leftists. Among them, behind the first lines of women and young people, there were guerrilla fighters, many trained in Lebanon by the Palestinians. By 9:21 am the first shots rang out. The result was a gun battle, a stampede, and -- according to the official toll -- eighty-six civilian deaths.	8	2	9	8	2	9	56	1978	1978
72	2020-02-21 08:44:31.038068	2020-03-05 19:46:54.723562	Siege of Vienna Begins	The siege of Vienna begins.	\N	2	7	\N	2	7	48	1683	1683
90	2020-03-05 19:52:39.563063	2020-03-05 19:52:39.563063	Founding Of The Fedayeen	This was a clandestine group of marginal radicals founded by Navvab Safavi. The Fedayeen is often described as one of the first Muslim fundamentalist groups in modern times.	\N	2	\N	\N	2	\N	56	1946	1946
100	2020-03-11 16:46:19.909673	2020-03-11 16:46:19.909673	Presidency Of John Adams	\N	4	2	3	4	2	3	57	1797	1801
91	2020-03-05 20:02:21.416804	2020-03-06 10:27:02.772198	Ayatollah Khomeini Returns To Iran	After 15 years in exile in Neauphle-le-Chateau, France Khomeini returned to Iran during the peak of the revolution.	\N	2	2	\N	2	2	56	1979	1979
92	2020-03-06 16:03:44.10901	2020-03-06 16:03:44.10901	Iranian Army Declares Neutrality in Revolution	After resisting the uprising, the Iranian military began to experience mutiny in the barracks. At that point they declared neutrality leaving the leader Bakhtiar with no military strength with which to fight the revolutionaries.	11	2	2	11	2	2	56	1979	1979
93	2020-03-06 16:10:31.961155	2020-03-06 16:10:31.961155	Iran Becomes An Islamic Republic	Iranian revolutionaries created a vote for a referendum. The voting was not private and open for all to see. The people of Iran were posed with one single simple question: "Should the monarchy be replaced by an Islamic republic?" As there were no voting booths and privacy and "Yes" votes were colored in bright green there was much fear by the voters to choosing no as the radicals would be able to easily identify those parties. Nor did the referendum contain any definition or idea of what an Islamic Republic would be. 98% of voters chose "Yes".	\N	2	3	\N	2	3	56	1979	1979
94	2020-03-06 16:15:10.619035	2020-03-06 16:15:10.619035	Islamic Republic of Iran Declaration Published	Mehdi Bazergan was a moderate Islamist. He and his allies published the declaration text which proposed an executive presidency whose power was vested in the people instead of a monarch. A committee of religious leaders would have veto power over laws. Men and women would be equal under the law.  Of note was that in this document there was no reference to the wilayat al-faqih.	14	2	6	14	2	6	56	1979	1979
95	2020-03-06 16:25:15.901772	2020-03-06 16:25:15.901772	Sixty-Six Americans Taken Hostage In Iran	Some 400 students climbed the walls of the American embassy compound in central Tehran. They were led by a group calling itself "Students Following the Imam's Line".	4	2	11	4	2	11	56	1979	1979
96	2020-03-06 16:33:10.318634	2020-03-06 16:33:10.318634	Mehdi Bazergan Is Leader Of Iran	Post-Revolution Bazergan was named leader of Iran. There was much tension between the somewhat liberal Islamist Bazergan and the much more conservative Ayatollah Khomeini. Eventually Khomeini and his allies would push out Bazergan after the Iranian Hostage crisis became too much for him. On December 3rd a new constitution was proposed to replace the one passed the previous April. This ended the rule of Bazergan and began the rule of Ayatollah Khomeini.	3	2	12	\N	2	3	56	1979	1979
97	2020-03-06 16:38:20.473154	2020-03-06 16:38:20.473154	Ayatollah Khomeini Becomes Supreme Leader	After Prime Minister Mehdi Bazergan resigned the wilayat al-faqih had been defined to fit Khomeini. In this new constitution Khomeini had broad powers. It enabled him to name top military leaders and judges, dismiss the president, and disqualify political candidates (with or without cause). He could declare war or peace.\n\nA national referendum was called to vote on the new constitution. While turnout was slightly lower than in April, the result was an overwhelming "Yes". Khomeini was now the Supreme Leader.	3	2	12	3	2	12	56	1979	1979
98	2020-03-06 16:41:20.464053	2020-03-06 16:41:20.464053	Iran Hostage Crisis	66 Americans were taken hostage at the American embassy in Iran in early November 1979. It would be 444 days before all hostages were released and the crisis was resolved.	\N	2	1	4	2	11	56	1979	1981
101	2020-03-11 16:46:53.673703	2020-03-11 16:46:53.673703	Presidency Of Thomas Jefferson	\N	4	2	3	4	2	3	57	1801	1809
102	2020-03-11 16:47:22.861689	2020-03-11 16:47:22.861689	Presidency Of James Madison	\N	4	2	3	4	2	3	57	1809	1817
99	2020-03-11 16:44:13.737993	2020-03-11 16:44:45.960186	Presidency Of George Washington	\N	\N	2	3	\N	2	4	57	1789	1797
103	2020-03-11 16:47:55.753981	2020-03-11 16:47:55.753981	Presidency Of James Monroe	\N	4	2	3	4	2	3	57	1817	1825
104	2020-03-11 16:48:26.939542	2020-03-11 16:48:26.939542	Presidency Of John Quincy Adams	\N	4	2	3	4	2	3	57	1825	1829
105	2020-03-11 16:48:58.225725	2020-03-11 16:48:58.225725	Presidency Of Andrew Jackson	\N	4	2	3	4	2	3	57	1829	1837
106	2020-03-11 16:49:28.264352	2020-03-11 16:49:28.264352	Presidency Of Martin Van Buren	\N	4	2	3	4	2	3	57	1837	1841
108	2020-03-11 16:52:04.349038	2020-03-11 16:52:04.349038	Presidency Of John Tyler	\N	4	2	3	4	2	4	57	1841	1845
109	2020-03-11 16:52:31.392705	2020-03-11 16:52:31.392705	Presidency Of James K. Polk	\N	4	2	3	4	2	3	57	1845	1849
110	2020-03-11 16:53:04.413387	2020-03-11 16:53:04.413387	Presidency Of Zachary Taylor	\N	9	2	7	4	2	3	57	1849	1850
111	2020-03-11 16:53:36.585217	2020-03-11 16:53:36.585217	Presidency Of Millard Fillmore	\N	4	2	3	9	2	7	57	1850	1853
113	2020-03-11 16:54:29.996758	2020-03-11 16:54:29.996758	Presidency Of James Buchanan	\N	4	2	3	4	2	3	57	1857	1861
114	2020-03-11 16:55:03.195747	2020-03-11 16:55:03.195747	Presidency Of Abraham Lincoln	\N	15	2	4	4	2	3	57	1861	1865
107	2020-03-11 16:51:32.835633	2020-03-11 16:56:46.853125	Presidency Of William Henry Harrison	\N	4	2	4	4	2	3	57	1841	1841
115	2020-03-11 16:57:22.101356	2020-03-11 16:57:22.101356	Presidency Of Andrew Johnson	\N	4	2	3	15	2	4	57	1865	1869
116	2020-03-11 16:57:54.125597	2020-03-11 16:57:54.125597	Presidency Of Ulysses S. Grant	\N	4	2	3	4	2	3	57	1869	1877
117	2020-03-11 16:58:21.366121	2020-03-11 16:58:21.366121	Presidency Of Rutherford B. Hayes	\N	4	2	3	4	2	3	57	1877	1881
118	2020-03-11 16:58:48.289974	2020-03-11 16:58:48.289974	Presidency Of James A. Garfield	\N	19	2	9	4	2	3	57	1881	1881
119	2020-03-11 16:59:17.932354	2020-03-11 16:59:17.932354	Presidency Of Chester A. Arthur	\N	4	2	3	19	2	9	57	1881	1885
120	2020-03-11 16:59:44.500093	2020-03-11 16:59:44.500093	Presidency Of Grover Cleveland	\N	4	2	3	4	2	3	57	1885	1889
121	2020-03-11 17:00:09.363913	2020-03-11 17:00:09.363913	Presidency Of Benjamin Harrison	\N	4	2	3	4	2	3	57	1889	1893
122	2020-03-11 17:00:37.654445	2020-03-11 17:00:37.654445	Presidency Of Grover Cleveland	\N	4	2	3	4	2	3	57	1893	1897
123	2020-03-11 17:01:06.116685	2020-03-11 17:01:06.116685	Presidency Of William McKinley	\N	14	2	9	4	2	3	57	1897	1901
124	2020-03-11 17:02:15.606255	2020-03-11 17:02:15.606255	Presidency Of Theodore Roosevelt	\N	4	2	3	14	2	9	57	1901	1909
125	2020-03-11 17:02:40.310248	2020-03-11 17:02:40.310248	Presidency Of William Howard Taft	\N	4	2	3	4	2	3	57	1909	1913
126	2020-03-11 17:03:01.012252	2020-03-11 17:03:01.012252	Presidency Of Woodrow Wilson	\N	4	2	3	4	2	3	57	1913	1921
127	2020-03-11 17:03:29.285797	2020-03-11 17:03:29.285797	Presidency Of Warren G. Harding	\N	2	2	8	4	2	3	57	1921	1923
128	2020-03-11 17:03:53.069278	2020-03-11 17:03:53.069278	Presidency Of Calvin Coolidge	\N	4	2	3	2	2	8	57	1923	1929
129	2020-03-11 17:04:18.477001	2020-03-11 17:04:18.477001	Presidency Of Herbert Hoover	\N	4	2	3	4	2	3	57	1929	1933
130	2020-03-11 17:04:48.628302	2020-03-11 17:04:48.628302	Presidency Of Franklin D. Roosevelt	\N	12	2	4	4	2	3	57	1933	1945
131	2020-03-11 17:05:21.645144	2020-03-11 17:05:21.645144	Presidency Of Harry S. Truman	\N	20	2	1	12	2	4	57	1945	1953
132	2020-03-11 17:05:50.61464	2020-03-11 17:05:50.61464	Presidency Of Dwight D. Eisenhower	\N	20	2	1	20	2	1	57	1953	1961
133	2020-03-11 17:06:18.813193	2020-03-11 17:06:18.813193	Presidency Of John F. Kennedy	\N	22	2	11	20	2	1	57	1961	1963
134	2020-03-11 17:06:46.917261	2020-03-11 17:06:46.917261	Presidency Of Lyndon B. Johnson	\N	20	2	1	22	2	11	57	1963	1969
135	2020-03-11 17:07:12.297543	2020-03-11 17:07:12.297543	Presidency Of Richard Nixon	\N	9	2	8	20	2	1	57	1969	1974
136	2020-03-11 17:07:37.37395	2020-03-11 17:07:37.37395	Presidency Of Gerald Ford	\N	20	2	1	9	2	8	57	1974	1977
137	2020-03-11 17:08:02.687605	2020-03-11 17:08:02.687605	Presidency Of Jimmy Carter	\N	20	2	1	20	2	1	57	1977	1981
138	2020-03-11 17:08:47.328698	2020-03-11 17:08:47.328698	Presidency Of Ronald Reagan	\N	20	2	1	20	2	1	57	1981	1989
139	2020-03-11 17:09:13.77387	2020-03-11 17:09:13.77387	Presidency Of George H. W. Bush	\N	20	2	1	20	2	1	57	1989	1993
140	2020-03-11 17:09:41.222547	2020-03-11 17:09:41.222547	Presidency Of Bill Clinton	\N	20	2	1	20	2	1	57	1993	2001
141	2020-03-11 17:10:10.493492	2020-03-11 17:10:10.493492	Presidency Of George W. Bush	\N	20	2	1	20	2	1	57	2001	2009
142	2020-03-11 17:10:38.856385	2020-03-11 17:10:38.856385	Presidency Of Barack Obama	\N	20	2	1	20	2	1	57	2009	2017
143	2020-03-11 17:11:14.41739	2020-03-11 17:11:14.41739	Presidency Of Donald Trump	\N	20	2	1	20	2	1	57	2017	2021
144	2020-03-11 17:33:53.253028	2020-03-11 17:33:53.253028	Reign Of King Offa	\N	\N	2	\N	\N	2	\N	57	757	796
145	2020-03-11 17:34:20.400372	2020-03-11 17:34:20.400372	Reign Of King Egbert	\N	\N	2	\N	\N	2	\N	57	802	839
146	2020-03-11 17:34:50.02823	2020-03-11 17:34:50.02823	Reign Of King Aethelwulf	\N	\N	2	\N	\N	2	\N	57	839	856
147	2020-03-11 17:35:20.04805	2020-03-11 17:35:20.04805	Reign Of Aethelbald	\N	\N	2	\N	\N	2	\N	57	856	860
148	2020-03-11 17:35:45.159146	2020-03-11 17:35:45.159146	Reign Of King Aethelbert	\N	\N	2	\N	\N	2	\N	57	860	866
149	2020-03-11 17:36:06.925186	2020-03-11 17:36:06.925186	Reign Of King Aethelred	\N	\N	2	\N	\N	2	\N	57	866	871
150	2020-03-11 17:36:32.750353	2020-03-11 17:36:32.750353	Reign Of King Alfred the Great	\N	\N	2	\N	\N	2	\N	57	871	899
151	2020-03-11 17:37:03.768994	2020-03-11 17:37:03.768994	Reign Of King Edward The Elder	\N	\N	2	\N	\N	2	\N	57	899	924
152	2020-03-11 17:38:51.968901	2020-03-11 17:38:51.968901	Reign Of King Athelstan	\N	\N	2	\N	\N	2	\N	57	924	939
153	2020-03-11 17:39:17.558111	2020-03-11 17:39:17.558111	Reign Of King Edmund	\N	\N	2	\N	\N	2	\N	57	939	946
154	2020-03-11 17:39:36.733556	2020-03-11 17:39:36.733556	Reign Of King Edred	\N	\N	2	\N	\N	2	\N	57	946	955
155	2020-03-11 17:40:03.957389	2020-03-11 17:40:03.957389	Reign Of King Edwy (Eadwig)	\N	\N	2	\N	\N	2	\N	57	955	959
156	2020-03-11 17:40:25.757942	2020-03-11 17:40:25.757942	Reign Of King Edgar	\N	\N	2	\N	\N	2	\N	57	959	975
157	2020-03-11 17:40:49.253206	2020-03-11 17:40:49.253206	Reign Of King Edward The Martyr	\N	\N	2	\N	\N	2	\N	57	975	978
158	2020-03-11 17:42:26.538963	2020-03-11 17:42:26.538963	Reign Of1016  King Aethelred II The Unready	\N	\N	2	\N	\N	2	\N	57	978	1016
159	2020-03-11 17:42:51.183459	2020-03-11 17:42:51.183459	Reign Of King Edmund II Ironside	\N	\N	2	\N	\N	2	\N	57	1016	1016
160	2020-03-11 17:43:13.553562	2020-03-11 17:43:13.553562	Reign Of King Cnut (Canute)	\N	\N	2	\N	\N	2	\N	57	1016	1035
161	2020-03-11 17:43:42.736129	2020-03-11 17:43:42.736129	Reign Of King Harold I Harefoot	\N	\N	2	\N	\N	2	\N	57	1035	1040
162	2020-03-11 17:44:11.983398	2020-03-11 17:44:11.983398	Reign Of King Harthacnut	\N	\N	2	\N	\N	2	\N	57	1040	1042
163	2020-03-11 17:44:31.095748	2020-03-11 17:44:31.095748	Reign Of King Edward The Confessor	\N	\N	2	\N	\N	2	\N	57	1042	1066
164	2020-03-11 17:44:53.801815	2020-03-11 17:44:53.801815	Reign Of King Harold II	\N	\N	2	\N	\N	2	\N	57	1066	1066
165	2020-03-11 17:45:18.538236	2020-03-11 17:45:18.538236	Reign Of King William I The Conqueror	\N	\N	2	\N	\N	2	\N	57	1066	1087
168	2020-03-11 17:47:51.080934	2020-03-11 17:47:51.080934	Reign Of King Stephen	\N	\N	2	\N	\N	2	\N	57	1135	1154
169	2020-03-11 17:48:11.121835	2020-03-11 17:48:11.121835	Reign Of King Henry II 	\N	\N	2	\N	\N	2	\N	57	1154	1189
170	2020-03-11 17:48:42.273517	2020-03-11 17:48:42.273517	Reign Of King Richard I The Lion Heart	\N	\N	2	\N	\N	2	\N	57	1189	1199
171	2020-03-11 17:49:02.978635	2020-03-11 17:49:02.978635	Reign Of King John	\N	\N	2	\N	\N	2	\N	57	1199	1216
172	2020-03-11 17:49:22.76818	2020-03-11 17:49:22.76818	Reign Of King Henry III	\N	\N	2	\N	\N	2	\N	57	1216	1272
173	2020-03-11 17:49:45.153579	2020-03-11 17:49:45.153579	Reign Of King Edward I Longshanks	\N	\N	2	\N	\N	2	\N	57	1272	1307
174	2020-03-11 17:50:04.762174	2020-03-11 17:50:04.762174	Reign Of King Edward II	\N	\N	2	\N	\N	2	\N	57	1307	1327
175	2020-03-11 17:50:26.578471	2020-03-11 17:50:26.578471	Reign Of King Edward III	\N	\N	2	\N	\N	2	\N	57	1327	1377
176	2020-03-11 17:50:46.409535	2020-03-11 17:50:46.409535	Reign Of King Richard II	\N	\N	2	\N	\N	2	\N	57	1377	1399
177	2020-03-11 17:51:09.753497	2020-03-11 17:51:09.753497	Reign Of King Henry IV	\N	\N	2	\N	\N	2	\N	57	1399	1413
179	2020-03-11 17:54:07.246059	2020-03-11 17:54:07.246059	Reign Of King Henry VI	\N	\N	2	\N	\N	2	\N	57	1422	1461
180	2020-03-11 17:54:29.797893	2020-03-11 17:54:29.797893	Reign Of King Edward IV	\N	\N	2	\N	\N	2	\N	57	1461	1483
181	2020-03-11 17:54:49.986378	2020-03-11 17:54:49.986378	Reign Of King Edward V	\N	\N	2	\N	\N	2	\N	57	1483	1483
182	2020-03-11 17:55:12.864096	2020-03-11 17:55:12.864096	Reign Of King Richard III	\N	\N	2	\N	\N	2	\N	57	1483	1485
183	2020-03-11 17:55:38.002956	2020-03-11 17:55:38.002956	Reign Of King Henry VII	\N	\N	2	\N	\N	2	\N	57	1485	1509
184	2020-03-11 17:55:59.626817	2020-03-11 17:55:59.626817	Reign Of King Henry VIII	\N	\N	2	\N	\N	2	\N	57	1509	1547
185	2020-03-11 17:56:22.737784	2020-03-11 17:56:22.737784	Reign Of King Edward VI	\N	\N	2	\N	\N	2	\N	57	1547	1553
186	2020-03-11 17:56:44.954618	2020-03-11 17:56:44.954618	Reign Of Queen Mary I	\N	\N	2	\N	\N	2	\N	57	1553	1558
187	2020-03-11 17:57:09.664256	2020-03-11 17:57:09.664256	Reign Of Queen Elizabeth I	\N	\N	2	\N	\N	2	\N	57	1558	1603
188	2020-03-11 17:57:32.859614	2020-03-11 17:57:32.859614	Reign Of King James I	\N	\N	2	\N	\N	2	\N	57	1603	1625
189	2020-03-11 17:57:55.803114	2020-03-11 17:57:55.803114	Reign Of King Charles I	\N	\N	2	\N	\N	2	\N	57	1625	1649
190	2020-03-11 17:58:23.633522	2020-03-11 17:58:23.633522	Reign Of King Charles II	\N	\N	2	\N	\N	2	\N	57	1660	1685
191	2020-03-11 17:59:54.380376	2020-03-11 17:59:54.380376	Reign Of King James II	\N	\N	2	\N	\N	2	\N	57	1685	1688
192	2020-03-11 18:00:30.427594	2020-03-11 18:00:30.427594	Reign Of King William III and Queen Mary II	\N	\N	2	\N	\N	2	\N	57	1689	1702
193	2020-03-11 18:01:06.571851	2020-03-11 18:01:06.571851	Reign Of Queen Anne	\N	\N	2	\N	\N	2	\N	57	1702	1714
194	2020-03-11 18:01:25.699067	2020-03-11 18:01:25.699067	Reign Of King George	\N	\N	2	\N	\N	2	\N	57	1714	1727
195	2020-03-11 18:01:42.915674	2020-03-11 18:01:42.915674	Reign Of King George II	\N	\N	2	\N	\N	2	\N	57	1727	1760
196	2020-03-11 18:02:02.126256	2020-03-11 18:02:02.126256	Reign Of King George III	\N	\N	2	\N	\N	2	\N	57	1760	1820
197	2020-03-11 18:02:29.042734	2020-03-11 18:02:29.042734	Reign Of King George IV	\N	\N	2	\N	\N	2	\N	57	1820	1830
198	2020-03-11 18:03:04.85879	2020-03-11 18:03:04.85879	Reign Of King William IV	\N	\N	2	\N	\N	2	\N	57	1830	1837
199	2020-03-11 18:03:25.7405	2020-03-11 18:03:25.7405	Reign Of Queen Victoria	\N	\N	2	\N	\N	2	\N	57	1837	1901
200	2020-03-11 18:03:54.469683	2020-03-11 18:03:54.469683	Reign Of King Edward VII	\N	\N	2	\N	\N	2	\N	57	1901	1910
201	2020-03-11 18:04:18.908332	2020-03-11 18:04:18.908332	Reign Of King George V	\N	\N	2	\N	\N	2	\N	57	1910	1936
202	2020-03-11 18:04:59.963813	2020-03-11 18:04:59.963813	Reign Of King Edward VIII	\N	\N	2	\N	\N	2	\N	57	1936	1936
203	2020-03-11 18:05:19.563945	2020-03-11 18:05:19.563945	Reign Of King George VI	\N	\N	2	\N	\N	2	\N	57	1936	1952
204	2020-03-11 18:05:44.988506	2020-03-11 18:05:44.988506	Reign Of Queen Elizabeth II	\N	\N	2	\N	\N	2	\N	57	1952	2020
205	2020-03-14 17:12:31.412718	2020-03-14 17:12:31.412718	Reign Of Tamerlane	Tamerlane (Tartar name Timur Lenk) was a Mongol leader. Seen as a warlord his armies conquered North India, Persia and Syria. He established the city of Samarkand as the capital.	\N	2	\N	\N	2	\N	58	1369	1405
206	2020-03-14 17:15:43.035257	2020-03-14 17:15:43.035257	The Black Death	The Black Death originated in China. It swept westwards all the way to Europe killing one-third of the population. Some estimates up to half the population.	\N	2	\N	\N	2	\N	58	1347	1351
207	2020-03-14 17:18:57.279412	2020-03-14 17:18:57.279412	The Collapse of the Soviet Union	With the tearing down of the Berlin Wall the beginnings of the soviet collapse occurred in 1989. Over the next few years the Union would continue to disintegrate with a new more democratic government rising up.	\N	2	\N	\N	2	\N	58	1989	1991
208	2020-03-14 17:27:13.529092	2020-03-14 17:27:13.529092	Construction Of The Forbidden City	Known as Gugong, the Forbidden City was built at the heart of Beijing China. Materials were imported from all over the Chinese empire and built by millions of workers. There were nearly 1,000 buildings arranged, constructed and decorated to symbolize the might of the Ming Dynasty.	\N	2	\N	\N	2	\N	58	1406	1420
209	2020-03-14 17:34:02.825794	2020-03-14 17:34:02.825794	The Bubonic Plague Reaches England	After reaching England it is estimated that the Black Death reduced the English population to around 40,000 people.	\N	2	\N	\N	2	\N	58	1349	1349
178	2020-03-11 17:51:32.194316	2020-03-14 17:37:58.126175	Reign Of King Henry V	Henry V became king at the age of 23. He died at the age of 35 of dysentery.	\N	2	\N	\N	2	\N	57	1413	1422
210	2020-03-14 17:39:55.428295	2020-03-14 17:39:55.428295	Chinese Song Dynasty	\N	\N	2	\N	\N	2	\N	58	960	1279
211	2020-03-14 17:47:43.861585	2020-03-14 17:47:43.861585	Zheng He's Epic Sea Voyages	During this time period the Chinese empire could boast the largest and most advanced naval fleet in the world. It's Admiral Zheng He commanded this fleet.\n\nWith 600 "Treasure Ships" and commanding a crew of 28,000 people, this fleet would not be rivaled in size until WWI. The ships of this navy were 300 feet long. That is five times the size of the Santa Maria on which Christopher Columbus crossed the Atlantic in 1492.\n\nWith this navy Zheng He sailed to Thailand, Sumatra, Java, Calicut, Tamasek (Singapore), Malacca, Cuttack, Hormuz, Aden, and up the Red Sea to Jeddah.	\N	2	\N	\N	2	\N	58	1405	1424
212	2020-03-14 17:50:59.269903	2020-03-14 17:50:59.269903	American Astronauts Land On The Moon	\N	\N	2	\N	\N	2	\N	58	1969	1969
213	2020-03-14 17:54:42.119177	2020-03-14 17:54:42.119177	Bartolomeu Dias Rounds The Cape Of Africa	Portuguese mariner Bartolomeu Dias was the first to round the Cape. This was well ahead of the better known rounding of the Cape by Vasco da Gama in 1497. However, Dias' ships were forced to turn by his crew.	\N	2	\N	\N	2	\N	58	1488	1488
214	2020-03-14 17:57:01.096646	2020-03-14 17:57:01.096646	Vasco da Gama Sets Sail For India	The Portuguese King Manuel put da Gama in charge of 4 ships. They rounded the Cape of Africa 4 months after setting sail.	4	2	7	4	2	7	58	1897	1897
215	2020-03-14 17:58:59.559184	2020-03-14 17:58:59.559184	Vasco da Gama Dies of Malaria	He died of Malaria during his third trip to India. His remains were returned to Europe and are now housed in a fine tomb in the Jeronimos Monastery in Lisbon.	\N	2	\N	\N	2	\N	58	1524	1524
216	2020-03-14 18:00:23.759553	2020-03-14 18:00:23.759553	John Cabot Attempts To Cross to America	John Cabot leaves Bristol, England and attempts to cross the Atlantic.	\N	2	\N	\N	2	\N	58	1496	1496
219	2020-03-16 14:53:06.277427	2020-03-16 16:22:14.990153	Moscow becomes the State Capital	Russia moves the state capital to Moscow (from Petrograd) after German soldiers march through Russia virtually unopposed.	\N	2	3	\N	2	3	48	1918	1918
217	2020-03-16 14:42:34.613069	2020-03-21 20:42:48.859309	The Ukrainian Revolution	Ukrainians seek independence from Russia a month later after Tsarist rule is toppled by Vladimir Lenin's communist party .	\N	2	4	\N	2	4	55	1917	1918
222	2020-03-16 15:59:45.62385	2020-03-16 15:59:45.62385	Stalin Becomes General Secretary	\N	\N	2	\N	\N	2	\N	48	1922	1922
220	2020-03-16 14:58:09.15908	2020-03-16 16:22:57.311069	USSR Founded	After the civil war, the country was in tatters. Around 6 million peasants had died from famine between 1921 and 1922, and there was rioting in many cities. Lenin suffered a stroke in May 1922. In December 1922, the Union of Soviet Socialist Republics (USSR) was established, based on one-party rule. Lenin died in 1924, worried about political infighting in this party. His legacy, however, was the world's first socialist state.	\N	2	12	\N	2	12	48	1922	1922
241	2020-03-18 20:06:22.09266	2020-03-18 20:07:36.168297	"Perestroika" (reconstruction) policy	Perestroika (reconstruction) was one of Mikhail Gorvachev's policies to unite socialism with democracy and bring Russia closer to the US and Europe.	\N	2	\N	\N	2	\N	48	1985	1985
256	2020-03-23 20:15:08.227225	2020-03-23 20:15:08.227225	The Battle of Karbala	By this time most Shia's had just accepted that the succession of Islam would be passed from caliph to another via the counsel and selection of wise men. This is the side the Sunnis adhere to. At this time a caliph passed the reins to his son, Yazid. There was wide discontent with this act of nepotism, and Imam Hussein rebelled against the injustice, facing off with his followers against the army of Yazid. In this battle Imam Hussein dies. His death helped crystallize what was still a nascent Shia identity. 	\N	2	\N	\N	2	\N	56	680	680
230	2020-03-16 18:02:21.405669	2020-03-17 19:59:29.832918	Major Soviet Foreign Espionage Setback	At the same time that major Soviet espionage operations are uncovered in London, Poland, Turkey, China and France, among other places, the Kremlin focuses on other non-existent spy networks. All of these incidents made the USSR paranoid of a world-conspiracy against them. The accompanied propaganda targets the Soviet society  to prepare it for wartime conditions and more austerity, seeking to also inspire greater loyalty to the communist system.	\N	2	\N	\N	2	\N	55	1927	1927
224	2020-03-16 16:55:15.184062	2020-03-16 16:55:15.184062	Gulags	Gulags (concentration camps for prisoners) were created under Lenin but proliferated under Stalin. They housed a range of convicts, who were exploited to open up remote and forbidding areas of the country, such as the Arctic north and the Siberian east. The population of the gulag camps reached its height in the late 1940s, but the system was run down under Stalin's successors.	\N	2	\N	\N	2	\N	48	1917	1953
225	2020-03-16 16:58:27.692029	2020-03-16 16:58:27.692029	Collectivization	Stalin deemed Soviet agricultural methods outdated, as they produced tool little food for a growing urban population. From 1927, Stalin instigated collectivization, uniting small farms into larger collectives. Food production eventually grew, and labor was freed for industry. Few farms volunteered, and terror was used to coerce them into handling over their land. Millions where starved, persecuted, or sent to gulags. By 1939, 99% of land was collectivized.	\N	2	\N	\N	2	\N	48	1927	1953
223	2020-03-16 16:10:42.014202	2020-03-16 17:40:46.20834	Bolshevik Revolution	When Lenin returned to Russia in fall 1917, having been in hiding in Finland, he urged immediate action. The Red Guards seized control of Petrograd, and on October 26, 1917, guards at the Winter Palace –the seat of the Provisional Government–  willingly surrendered. Power passed to the Bolsheviks, with Lenin establishing a Marxist one-party state after closing down the Russian Constituent Assembly in January 1918.	\N	2	\N	\N	2	\N	48	1917	1921
229	2020-03-16 17:50:50.510102	2020-03-16 17:50:50.510102	The Cheka	The original soviet secret police.	\N	2	\N	\N	2	\N	57	1917	1924
221	2020-03-16 15:12:50.529323	2020-03-18 19:20:28.97641	1st Ukrainian Peasant Revolt	The Ukrainian peasants pursued freedom from the State. They wanted socialism without Bolshevism. Tens of thousands of rural Ukrainians wanted a socialist revolution but not the centralized power and repression emanating from Moscow. The terms "Communists", the "Red Army" and "Bolsheviks" where all confused at the time by the peasants who felt some where giving away land and others taking away grain. What was clear was that Ukrainian peasants had wanted one form of revolution, but had got something else together.	\N	2	\N	\N	2	\N	55	1918	1920
258	2020-03-24 21:06:00.792991	2020-03-24 21:06:00.792991	World War II	\nA European and Asian conflict that became a global war, WWII was the most brutal conflict in History, engulfing the world in a struggle over ideology and national sovereignty. It was the costliest war in terms of life (at least 55 million people were killed in battle, in concentration camps, and in bombed-out cities.) 	\N	2	\N	\N	2	\N	48	1939	1945
228	2020-03-16 17:49:42.613338	2020-03-21 22:03:17.090749	The OGPU	The OGPU (Joint State Political Directorate) was the secret police of the Soviet Union from 1923 to 1934. This was used to exercise control over state security and evolved from the original "Cheka" (1917-1922). The OGPU's powers increased greatly in 1926, when the Soviet criminal code was amended to include a section on anti-state terrorism.	\N	2	\N	\N	2	\N	57	1923	1934
259	2020-03-24 21:17:06.713702	2020-03-24 21:17:06.713702	Holodomor	Holodomor ("Death by Hunger") was a political famine, created for the express purpose of weakening peasant resistance, and thus national identity in the Ukraine.	\N	2	\N	\N	2	\N	55	1932	1934
261	2020-03-24 21:28:11.472522	2020-03-24 21:28:11.472522	The Great Terror	Fearful of dissent, Stalin launched a campaign of terror to wipe out anyone who would impose him. During this period the gulag concentration camp system was expanded, with hundreds of thousands executed after a brief trial.	\N	2	\N	\N	2	\N	48	1936	1938
262	2020-04-01 19:39:11.337111	2020-04-01 19:39:11.337111	Imam Sadr Speaks In Baalbek	Musa Al-Sadr travelled to Baalbek in south Lebanon to raise awareness of the Shia plight. Approximately 75,000 men showed up from everywhere around Lebanon to see the cleric speak.	\N	2	3	\N	2	3	56	1974	1974
263	2020-04-01 20:16:41.379564	2020-04-01 20:16:41.379564	Beginning Of The Iranian Pahlavi Dynasty	With help from the British, Reza Shah, a brigadier general in the Persian Cossack army, had put an end to two centuries of Qajar dynasty.	\N	2	\N	\N	2	\N	56	1925	1925
264	2020-04-01 20:20:22.53393	2020-04-01 20:20:22.53393	Iranian Pahlavi Dynasty	The Iranian Pahlavi dynasty began with the rise of Reza Shah to leadership of the Iranian Persian empire. In 1941 the Shah abdicated making his son Shah Mohammad Reza Pahlavi the new Shah. He would be ousted in 1979 during the Iranian Revolution.	\N	2	\N	\N	2	\N	56	1925	1979
265	2020-04-01 20:23:21.999154	2020-04-01 20:23:21.999154	Launch Of The Iranian White Revolution	This was a program of reforms launched by Shah Mohammad Reza Pahlavi.	\N	2	\N	\N	2	\N	56	1963	1963
266	2020-04-01 20:25:59.988622	2020-04-01 20:25:59.988622	Reign Of Reza Shah Pahlavi	Reza Shah Pahlavi is the first Shah of the Pahlavi dynasty. He comes into power with the help of the British ending two centuries of Qajar dynasty.	\N	2	\N	\N	2	\N	56	1925	1941
260	2020-03-24 21:19:04.75145	2020-03-24 21:19:04.75145	Requisitions of vegetables are removed	\N	\N	2	\N	\N	2	\N	55	1934	1934
231	2020-03-16 18:21:31.412483	2020-03-17 20:00:41.371058	New Economic Policy 	Economic policy proposed by Lenin who described it as a progression towards "state capitalism" within the workers' state of the USSR. Lenin characterized "state capitalism" and his NEP policies in 1922 as an economic system that would include "a free market and capitalism, both subject to state control" while socialized state enterprises were to operate on "a profit basis". 	\N	2	\N	\N	2	\N	57	1922	1927
240	2020-03-18 20:04:11.248679	2020-03-18 20:04:47.059908	"Glasnost" (openess) policy	Glasnost (openness) was one of Mikhail Gorvachev's policies to bring to light government corruption. In practice it encouraged people to denounce injustices in a more broad and open way.	\N	2	\N	\N	2	\N	55	1985	1985
238	2020-03-18 19:22:53.54933	2020-03-18 19:29:07.55323	2nd Soviet Countryside Revolution	In just a few months during the winter of 1929-30 the Soviet state carried out a second revolution in the countryside, for many more shocking than the original Bolshevik revolution itself. All across the USSR, local leaders, successful farmers, priests and village elders were deposed, expropriated, arrested or deported. Entire village populations were forced to give up their land, their livestock, and sometimes their homes in order to join collective farms. Churches were destroyed, icons smashed and bells broken.	\N	2	\N	\N	2	\N	55	1929	1930
242	2020-03-18 20:14:45.872877	2020-03-18 20:14:45.872877	The Great Depression	The US stock market crash in October 1929 was part of a worldwide economic recession that crippled the future of an entire generation. As people lost faith in democracy, new extremist politics gained popularity, setting the stage for the horrors of World War II.	\N	2	\N	\N	2	\N	48	1929	1934
244	2020-03-18 20:26:08.308211	2020-03-18 20:27:24.96556	The Warsaw Pact	\nA treaty of mutual deference and military aid signed at Warsaw on 14 May 1955 by Communist states of Europe under Soviet influence, in response to the admission of West Germany to NATO.	\N	2	\N	\N	2	\N	60	1955	1991
245	2020-03-18 20:41:17.357644	2020-03-18 20:41:17.357644	West Germany joins NATO	In response the Warsaw pact is signed.	\N	2	\N	\N	2	\N	48	1955	1955
250	2020-03-23 18:34:06.210907	2020-03-23 18:34:06.210907	Sayyid Khomeini Is Exiled From Iran	While in Iran Khomeini had agitated against the Shah. This earned him exile to Najaf, Iraq.	\N	2	\N	\N	2	\N	56	1965	1978
251	2020-03-23 18:47:59.095174	2020-03-23 18:47:59.095174	Saigon, Vietnam Falls To Communist Forces	\N	\N	2	4	\N	2	4	56	1975	1975
232	2020-03-16 18:29:54.882487	2020-03-18 19:00:29.822839	Five-Year Plan	An economic programme that mandated a massive, unprecedented 20% annual increase in industrial output, the adoption of the seven-day week (workers would rest in shifts, so that factories would never have to close) and a new ethic workplace competition. 	\N	2	\N	\N	2	\N	55	1928	1933
252	2020-03-23 18:56:49.25475	2020-03-23 18:56:49.25475	Origins Of The Shia Muslims	After the death of the Prophet Muhammad one set of followers had chosen Ali, the cousin of the prophet and husband of his daughter Fatima, as the rightful heir of Islam. Afterwards this group would become known as the "Partisans of Ali", or "shi'at Ali".	\N	2	\N	\N	2	\N	56	633	633
253	2020-03-23 18:59:31.760566	2020-03-23 18:59:31.760566	Origins Of The Sunni Muslims	After the death of the Prophet Muhammad one set of followers believed that the prophet had named Abu Bakr, a close companion of the prophet, as his successor and the first caliph of the Muslim nation. Those who fell into this line of succession were the Sunnis.	\N	2	\N	\N	2	\N	56	633	633
248	2020-03-21 21:49:35.198215	2020-03-21 22:02:08.724069	The NKDV	The NKDV (People's Commissariat for Internal Affairs) was a law enforcement agency of the Soviet Union. It conducted mass extrajudicial executions, ran the Gulag system and suppressed underground resistance, and was also responsible for mass deportations of entire nationalities and Kulaks to unpopulated regions of the country.	\N	2	\N	\N	2	\N	57	1934	1946
249	2020-03-21 22:00:54.291604	2020-03-22 17:21:08.681966	The KGB	The KGB (Committee for State Security) was the main security agency for the Soviet Union until it's break-up in 1991. Attached to the Council of Ministers it acted as internal security, intelligence, and secret police. The KGB was a military service and was governed by army laws and regulations, similar to the Soviet Army or MVD Internal Troops.	\N	2	\N	\N	2	\N	57	1954	1991
254	2020-03-23 19:20:28.342432	2020-03-23 19:20:28.342432	The Safavid Dynasty	The Safavid dynasty was founded by Shah Ismail I. At it's height this Iranian empire  ruled over all of present day Iran, Azerbaijan, Armenia, most of Georgia, the North Caucusus, Iraq, Kuwait and Afghanistan. In addition parts of modern day Syria, Turkey, Pakistan, Uzbekistan and Turkmenistan.	\N	2	\N	\N	2	\N	56	1501	1700
255	2020-03-23 19:35:49.308622	2020-03-23 19:35:49.308622	Musa Sadr Moves To Lebanon	Imam Sadr moves to Lebanon at this time to shine a light on Shia dispossession and help establish schools and dispensaries. Sadr's ancestory, like all of the al-Sadrs in Iraq, Iran and beyond could trace their lineage back to Lebanon. This was a sort of reverse migration for him.	\N	2	\N	\N	2	\N	56	1959	1959
247	2020-03-21 21:41:16.801098	2020-04-08 20:20:48.449186	The Hungarian Revolution	\N	\N	2	1	\N	2	1	54	1956	1956
268	2020-04-06 12:57:52.257904	2020-04-06 12:57:52.257904	Reign Of Pharoah Khufu	The Pharoah Khufu is the one for which the largest pyramid at Giza was built as a tomb.	\N	1	\N	\N	1	\N	48	2589	2566
269	2020-04-06 13:02:54.080921	2020-04-06 13:02:54.080921	First Egyptian Pyramid Built	It was during this time period that the first Egyptian Pyramid was built. It was designed by Imhotep, one of Pharoah Djoser's most trusted advisors.	\N	1	\N	\N	1	\N	48	2611	2616
267	2020-04-06 12:56:01.10342	2020-04-06 13:05:23.205254	Earliest Pyramids Of The Norte Chico Civilization	Some time before 3000 BC it's believed the Norte Chico civilization of what is modern day Peru were building pyramid shaped structures.	\N	1	\N	\N	1	\N	48	3200	3000
271	2020-04-06 13:59:07.385957	2020-04-06 14:00:37.052253	"Sea Peoples" Invade Egypt (1177)	During this invasion of Egypt the "Sea Peoples" referred to consist according to Egyptian inscriptions as the Peleset, Tjekker, Shekelesh, Danuna, Weshesh, and the Shardana. Egypt would ultimately be victorious over the invasion, but would lose much of it's previous glorious empire in a stagnation. It wouldn't be until a couple centuries later that Egypt would return to it's former greatness.	\N	1	\N	\N	1	\N	62	1177	1177
270	2020-04-06 13:42:39.072673	2020-04-06 14:00:46.870422	"Sea Peoples" Invade Egypt (1207)	During this year the Egyptian Pharaoh Merneptah is in his fifth year of his reign. During this time inscriptions indicate Egypts ongoing battles with the Libyans and the "Sea Peoples" to the west.	\N	1	\N	\N	1	\N	62	1207	1207
272	2020-04-06 14:17:45.835728	2020-04-06 14:17:45.835728	A Grand Palace Is Built In Peru-nefer In Lower Egypt	Pharaoh Thutmose III orders the construction of a grand palace with elaborate frescoes in Peru-nefer, an Egyptian city in the Nile delta in Lower Egypt.	\N	1	\N	\N	1	\N	62	1477	1477
273	2020-04-06 14:25:31.349514	2020-04-06 16:54:30.449511	The Hyksos Rule Much Of Egyptian Lands	The Hyksos invaded and dominated much Egyptian land and were generally hated by the Egyptians. They were eventually overthrown and defeated by the Egyptians after almost two centuries of rule.	\N	1	\N	\N	1	\N	62	1720	1550
274	2020-04-06 16:56:47.543163	2020-04-06 16:56:47.543163	The Hyksos Invade Egypt	When the Hyksos invaded, Egypt was one of the established powers in the ancient Near East. The pyramids of Giza were nearly 1000 years old by this point..	\N	1	\N	\N	1	\N	62	1720	1720
275	2020-04-06 17:02:35.595877	2020-04-06 17:02:35.595877	Egyptian Middle Kingdom	\N	\N	1	\N	\N	1	\N	62	2134	1720
276	2020-04-06 17:14:06.916874	2020-04-06 17:14:06.916874	The Egyptians Defeat the Hyksos	The account of the defeat of the Hyksos was provided by the Thebian Pharaoh Kamose, the last king of the Seventeenth Dynasty of Egypt. In the account he refers to the Hyksos as "Asiatics". This provides some sense of how far what is today a short distance felt to them at the time considering that the Hyksos were from the Levant.	\N	1	\N	\N	1	\N	62	1550	1550
277	2020-04-06 17:18:26.026292	2020-04-06 17:19:34.103666	Egyptian New Kingdom	The New Kingdom period was ushered in when the Eighteenth Dynasty began. This is when the Pharaoh Kamose's brother Ahmose became the new Pharaoh.	\N	1	\N	\N	1	\N	62	1550	1069
279	2020-04-06 17:40:25.695437	2020-04-06 17:40:25.695437	Earthquake Strikes The Minoan Island Of Crete	This was a devastating earthquake that required the rebuilding of the palaces at Knossos and elsewhere on the Island of Crete. The Minoans however recovered quickly from the quake.	\N	1	\N	\N	1	\N	62	1700	1700
290	2020-04-08 17:01:03.864245	2020-04-08 17:01:03.864245	The Jacobite Rebellion	Charles Edward Stuart attempts to restore the English throne to the Stuart dynasty. He does so with the sponsorship of the French government. He assembled his army in Scotland before marching into England.	\N	2	\N	\N	2	\N	63	1745	1746
278	2020-04-06 17:38:41.201439	2020-04-06 17:55:50.466651	Minoan Civilization At The Island Of Crete	Although it's not certain it's believed that the original Minoans were from the area of Anatolia/Turkey. At some point during the 3rd millennium BC they established their civilization on the Island of Crete. The Minoan civilization would collapse under Mycenaean rule in 1200 BC.	\N	1	\N	\N	1	\N	62	3000	1200
280	2020-04-06 18:30:35.964635	2020-04-07 19:38:31.457553	Egyptian Reign of Pharaoh Hatshepsut	\N	\N	1	\N	\N	1	\N	62	1500	1480
282	2020-04-07 19:59:36.032688	2020-04-07 19:59:36.032688	The Battle Of Megiddo	The battle of Megiddo was the first of 17 campaigns performed by Pharaoh Thutmose III.  When Thutmose III came to the throne Canaanite rulers had initiated rebellion against the Egyptian rule. Thutmose III marched his army 10 days north. The Egyptians sieged the city for 7 months before they were able to capture it.	\N	1	\N	\N	1	\N	62	1479	1479
283	2020-04-07 20:04:01.095166	2020-04-07 20:04:01.095166	The Battle Of Megiddo	General Edmund Allenby attacks the city of Megiddo taking prisoner hundreds of German and Turkish soldiers, without any loss of life except for a few of his horses.	\N	2	\N	\N	2	\N	62	1918	1918
284	2020-04-07 20:33:13.42467	2020-04-07 20:33:13.42467	The Capital Of The Hittites Is Moved to Hattusa	Some time around this year the Hittite King Hattusili I established the capital city farther east of the original Hittite capital Nesha (now known and excavated as Kultepe Kanash in the Cappadocian region of Turkey).	\N	1	\N	\N	1	\N	62	1650	1650
285	2020-04-07 20:39:54.037793	2020-04-07 20:39:54.037793	The Hittites Attack Babylon	Hittite King Mursili I, grandson and successor of the above-named Hattusili I, marched his army all the way to Mesopotamia, a journey of over one thousand miles, and attacked the city of Babylon, and burning it to the ground. Interestingly, he simply turned around and went back home with his army leaving the city of Babylon abandoned.	\N	1	\N	\N	1	\N	62	1595	1595
286	2020-04-07 20:52:10.127987	2020-04-07 20:52:10.127987	The Hittite Empire	\N	\N	1	\N	\N	1	\N	62	1650	1180
287	2020-04-08 16:36:02.064387	2020-04-08 16:48:49.990263	Ann Lee Is Christened	Ann Lee was christened at Christ's Church in Manchester.	\N	2	\N	\N	2	\N	63	1742	1742
288	2020-04-08 16:50:57.102509	2020-04-08 16:50:57.102509	The Glorious Revolution	During this revolution William of Orange had deposed of Catholic King James II of England. He restored protestant rule in the combined kingdoms of England and Scotland.	\N	2	\N	\N	2	\N	63	1688	1688
289	2020-04-08 16:53:52.60353	2020-04-08 16:53:52.60353	James Edward Stuart Attempts To Seize The Throne	The English throne was seized in 1688 by William of Orange and Protestantism became the rule. James Stuart (The Old Pretender) attempts to seize back the throne to restore the Stuart dynasty. The rebellion was doomed and he was not able to restore the dynasty.	\N	2	\N	\N	2	\N	63	1715	1715
291	2020-04-08 17:05:53.055496	2020-04-08 17:05:53.055496	Charles Edward Stuart Arrive In Manchester England	The "Young Pretender" arrived in Manchester probably because there were a number there with Catholic sympathies. However, most were wary of an amateur Scottish army taking on the army of England. Nonetheless, he goes to Manchester and does manage to recruit some supporters before marching on to Derby on December 1st.	1	2	12	28	2	11	63	1745	1745
292	2020-04-08 17:11:34.484731	2020-04-08 17:11:34.484731	Ann Lee Becomes A Cook At The Manchester Infirmary	The Manchester Infirmary had expanded into it's own building during this time. The Infirmary was a large part of Manchester life at the time. It had three visiting surgeons and three physicians.	\N	2	\N	\N	2	\N	63	1755	1755
226	2020-03-16 17:13:29.874209	2020-03-18 18:51:37.592799	1st Soviet Famine	"War Communism" is implemented by Stalin with the idea of battling economic disruption and building a new economy. In reality this brought back food confiscation, grain requisitions, and the poor peasant's committees (Komnezamy) in Ukraine to strengthen the hand against the wealthier peasants and to ensure some control over the village councils. As a result, the peasants sowed far less land in both Ukraine and Russia in the spring of 1920 than they had at any time in the recent past. This in addition to a severe drought created the atmosphere for the famine.	\N	2	\N	\N	2	\N	55	1921	1923
306	2020-04-09 19:50:49.734228	2020-04-09 19:51:26.635064	Egyptian Reign of Pharaoh Amenhotep III	\N	\N	1	\N	\N	1	\N	62	1391	1353
307	2020-04-11 17:37:39.864766	2020-04-11 17:37:39.864766	Egyptian Reign of Pharaoh Amenhotep IV	Known after the fifth year of his reign as Akhenaten. He would also be known as the Heretic Pharaoh. He banned all Gods and Goddesses except for the god Aten who he alone could communicate. All Egyptians would therefore pray to Akhenaten who would then pray to Aten on their behalf. 	\N	1	\N	\N	1	\N	62	1353	1334
293	2020-04-08 20:16:39.097092	2020-04-08 20:22:03.541349	The German Army Retreats	A total silence was felt when this occurred, even in the cities like Warsaw that where already completely destroyed in the 2nd World War.	16	2	1	16	2	1	54	1945	1945
294	2020-04-08 20:39:06.146726	2020-04-08 20:39:06.146726	Hitler joins the Nazi Party (NSDAP)	\N	\N	2	\N	\N	2	\N	57	1919	1919
295	2020-04-08 20:42:30.523392	2020-04-08 20:42:30.523392	Hitler's Coup Attempt in Munich	In 1923 he attempted a coup in Munich to seize power. The failed coup resulted in Hitler's imprisonment, during which time he wrote his autobiography and political manifesto Mein Kampf ("My Struggle").	\N	2	\N	\N	2	\N	57	1923	1923
296	2020-04-08 20:44:07.847332	2020-04-08 20:44:07.847332	Hitler Becomes Chancellor of Germany	Hitler's Nazi Party became the largest elected party in the German Reichstag, leading to his appointment as chancellor in 1933.	\N	2	\N	\N	2	\N	57	1933	1933
298	2020-04-08 21:12:13.706604	2020-04-08 21:14:19.919375	Gestapo	The Gestapo was the official secret police of Nazi Germany and German-occupied Europe. Hermann Goring formed the unit in 1933. Beginning April 20 1934, it was under the administrator of SS national leader Heinrich Himmler, who in 1936 was appointed Chief of German Police by Hitler.	\N	2	\N	\N	2	\N	57	1933	1945
299	2020-04-08 21:25:24.469056	2020-04-08 21:25:24.469056	Comintern	The Communist International (also know as the Third International) was an international communist organization initiated in Moscow during March 1919. It intended to fight "by all available means, including armed force, for the overthrow of the international bourgeoisie and for the creation of an international Soviet republic as a transition stage to the complete abolition of the State. 	\N	2	\N	\N	2	\N	57	1919	1943
308	2020-04-11 19:15:21.925641	2020-04-11 19:15:21.925641	Assyrian Middle Empire	\N	\N	1	\N	\N	1	\N	62	1365	1050
300	2020-04-08 21:37:35.926031	2020-04-08 21:45:48.816771	Non-aggresion Pact between Stalin and Hitler	The secret protocols of this pact divided Easter Europe between the two dictators. Stalin got the Baltic States and eastern Poland, as well as northern Romania. Hitler got the western Poland and was given leave to exert his influence over Hungary and Romania without Soviet objection.	\N	2	\N	\N	2	\N	54	1939	1940
301	2020-04-08 22:00:36.747463	2020-04-08 22:00:36.747463	Hitler Invades the Soviet Union	\N	\N	2	6	\N	2	6	54	1941	1941
302	2020-04-08 22:10:20.951241	2020-04-08 22:10:20.951241	Stasi	The Ministry of State Security was the official state security service of the German Democratic Republic (GDR). It has been described as one of the most effective and repressive intelligence and secret police agencies to have ever existed. The Stasi was headquartered in East Berlin, with an extensive complex in Berlin-Lichtenberg and several smaller facilities throughout the city. The Stasi motto was "Shield and Sword of the Party", referring to the ruling Socialist Unity Party of Germany (SED).	31	2	3	8	2	2	57	1950	1990
309	2020-04-11 19:21:35.018981	2020-04-11 19:21:35.018981	Reign Of Assur-uballit I	Was the first king of the Middle Assyrian Empire.	\N	1	\N	\N	1	\N	62	1365	1330
243	2020-03-18 20:24:11.38505	2020-04-08 22:20:11.248077	NATO	North Atlantic Treaty Organization (NATO) is created between the US and other western nations. It was a defensive military alliance that promised to provide mutual assistance if one nation were to be attacked.	\N	2	\N	\N	2	12	48	1949	\N
303	2020-04-09 18:03:44.286898	2020-04-09 18:03:44.286898	Shakerism Is Founded	Started by a married couple, John and Jane Wardley, tailors from Bolton, a small town a dozen miles north of Manchester, England who had broken away from their Quaker faith.	\N	2	\N	\N	2	\N	63	1747	1747
304	2020-04-09 18:04:25.278015	2020-04-09 18:08:12.410079	Ann Lee Joins The Shakers	She joins at the age of 22.	\N	2	\N	\N	2	\N	63	1758	1758
305	2020-04-09 18:34:43.879673	2020-04-09 18:48:41.766437	Ann Lee Is Married	While a Shaker she is married at the age of 26 to a blacksmith Abraham Standerin. They would go on to have four children. Three of which would die during childbirth. The first child would die after just a couple years.	\N	2	\N	\N	2	\N	63	1762	1762
281	2020-04-06 18:31:23.28408	2020-04-09 19:49:57.475602	Egyptian Reign of Pharaoh Thutmose III	Upon the death of his step-mother and aunt Hatshepsut, he assumed the throne as Pharaoh.	\N	1	\N	\N	1	\N	62	1479	1425
310	2020-04-11 19:33:54.080757	2020-04-11 19:33:54.080757	Egyptian Reign of Pharaoh Tutankhamen	Colloquially referred to as King Tut, Tutankhaten means "Living Image of Aten".	\N	1	\N	\N	1	\N	62	1332	1323
311	2020-04-11 19:47:23.561457	2020-04-11 19:47:23.561457	Egyptian Early Dynastic Period	\N	\N	1	\N	\N	1	\N	62	3050	2686
312	2020-04-11 19:48:09.457903	2020-04-11 19:48:09.457903	Egyptian Old Kingdom	\N	\N	1	\N	\N	1	\N	62	2686	2181
313	2020-04-11 19:48:51.514811	2020-04-11 19:48:51.514811	Egyptian First Intermediate Period	\N	\N	1	\N	\N	1	\N	62	2181	1991
314	2020-04-11 19:51:07.839473	2020-04-11 19:51:07.839473	Egyptian Second Intermediate Period	\N	\N	1	\N	\N	1	\N	62	1674	1549
315	2020-04-11 19:54:40.57632	2020-04-11 19:54:40.57632	Egyptian Third Intermediate Period	\N	\N	1	\N	\N	1	\N	62	1069	653
316	2020-04-11 20:02:06.584772	2020-04-11 20:02:06.584772	The Mitanni Empire	Located in modern-day northern Syria and southeast Anatolia (Turkey).	\N	1	\N	\N	1	\N	62	1500	1300
317	2020-04-11 20:04:30.414911	2020-04-11 20:04:30.414911	The Assyrian Empire	\N	\N	1	\N	\N	1	\N	62	2500	609
318	2020-04-11 20:06:43.448718	2020-04-11 20:06:43.448718	The Babylonian Empire	\N	\N	1	\N	\N	1	\N	62	1894	539
319	2020-04-11 20:13:14.171807	2020-04-11 20:13:14.171807	The Mycenaean Empire	\N	\N	1	\N	\N	1	\N	62	1600	1100
320	2020-04-11 20:15:06.222329	2020-04-11 20:15:06.222329	The Ancient Egyptian Empire	\N	\N	1	\N	\N	1	\N	62	3050	653
322	2020-04-11 20:28:20.014107	2020-04-11 20:28:20.014107	The Bronze Age	\N	\N	1	\N	\N	1	\N	62	3000	1200
323	2020-04-11 20:45:37.983983	2020-04-13 10:12:45.8241	Hittite Reign Of King Mursili II	Was the son of King Suppiluliuma.	\N	1	\N	\N	1	\N	62	1321	1295
321	2020-04-11 20:24:58.236284	2020-04-15 20:34:05.750299	Hittite Reign Of King Suppiluliuma I	Was king of the Hittite empire during the late bronze age. He helped to reinvigorate the waning Hittite empire and regain control of Anatolia. He likely died of the plague brought to the Hittite population from Egyptian prisoners of war.	\N	1	\N	\N	1	\N	62	1344	1322
227	2020-03-16 17:42:02.427663	2020-03-18 18:50:13.516216	The Double Crisis	Two policies face crisis as the Soviet rule approaches their 10th year anniversary: The New Economic Policy (NEP) and the “Ukrainization”. The NEP allowed a certain degree of private property and free trading, while the “Ukrainization” had the mission to covert Ukrainians Nationals into Communism and draw them into Soviet power by supporting Ukrainian culture and language. In the first case, agricultural production was in crisis due to a contradiction the system imposed: a productive peasant made him a “Kulak” (the enemy of the people), an unproductive one made him a “Bedniak” (a poor peasant). In the second case,  nationalists were not placated and instead demanded more rapid change including questioning the primacy of Moscow altogether.	\N	2	\N	\N	2	\N	55	1927	1929
239	2020-03-18 19:49:10.780598	2020-03-19 15:37:55.151911	The "Politburo" sets a new target: 80% farms must join collective farms	This aggressive goal meant that it would require the "liquidation of the kulaks as a class". Pressure on the peasants continued: taxes on peasants who remained in their property were high, deportations to fast-expanding Gulags increased, food shortages became permanent.	\N	2	\N	\N	2	\N	55	1930	1930
329	2020-04-23 16:38:00.653136	2020-04-23 16:38:00.653136	Reign of Ugarit King Ammistamru	Ugarit was an ancient port city at what is today called Ras Shamra in northern Syria. While it's own independent state it is believed to have had close connections with the Hittite empire and maintained both trade and diplomatic relationships with other empires of time. In the 13th century King Ammistamru is recorded as being king.	\N	1	\N	\N	1	\N	62	1260	1235
330	2020-04-23 17:41:06.258589	2020-04-23 17:43:09.553065	The Battle Of Qadesh	The city of Qadesh was a border location between the Hittite and Egyptian Empires. Muwattalli, the Hittite king, was attempting to expand the Hittite Empire farther south into Canaan. Ramses II of Egypt was determined to keep the border at Qadesh. This set the stage for one of the great battles from the ancient era and one of the first known where misinformation was deliberately used to confuse the enemy. The battle ended as a stalemate with a peace treaty between the two empires.	\N	1	\N	\N	1	\N	62	1274	1274
331	2020-04-23 18:27:23.479038	2020-04-23 18:27:23.479038	Reign of Hittite King Hattusili III	\N	\N	1	\N	\N	1	\N	62	1267	1237
332	2020-04-23 18:31:03.801049	2020-04-23 18:31:03.801049	Egyptian Reign of Pharaoh Ramses II	Also known as Ramses the Great was the third Pharaoh of the Nineteenth Dynasty. He led a number of military campaigns that reasserted Egyptian control and dominance in the Levant and Canaan. 	\N	1	\N	\N	1	\N	62	1279	1213
333	2020-04-23 18:46:11.276645	2020-04-23 18:46:11.276645	Reign of Hittite King Muwatalli II	\N	\N	1	\N	\N	1	\N	62	1295	1272
334	2020-04-23 18:57:51.967524	2020-04-23 18:57:51.967524	Homer Writes The Iliad And The Odyssey	It's not dated very exact, but it is believed that Homer was writing during the 8th century BC.	\N	1	\N	\N	1	\N	62	700	800
335	2020-04-23 19:35:02.382287	2020-04-23 19:39:04.391432	The Trojan War	This is the estimated date of the Trojan war. There is still a lot of speculation about the date, and more speculation about whether it actually happened or not.	\N	1	\N	\N	1	\N	62	1250	1260
336	2020-04-23 19:48:54.37707	2020-04-23 19:48:54.37707	Hebrew Exodus From Egypt	If this event did occur clues suggest it likely occurred somewhere around the mid-13th century. According to the Book of Exodus the Hebrews were enslaved by the Egyptians after having lived there peacefully for around 400 year. Afterwards Moses led the Hebrews out of Egyptian bondage on a 40 year journey to the land of Canaan.	\N	1	\N	\N	1	\N	62	1240	1280
337	2020-04-23 19:52:54.830493	2020-04-23 19:52:54.830493	Jacob The Biblical Patriarch	This is a very rough estimate. But according to the Bible the Hebrews entered Egypt some 400 years before they were enslaved and began the Exodus to Canaan. If that date is correct at some time during the 13th Century, then they would have entered egypt some time during the 17th Century. The bible indicates as well that they entered Egypt during the time of Jacob. Hence how this date was arrived at.	\N	1	\N	\N	1	\N	62	1650	1700
338	2020-04-24 08:08:24.777817	2020-04-24 08:08:24.777817	Egyptian Reign of Pharaoh Seti I	Father of Ramses II he reigned only a short period of time.	\N	1	\N	\N	1	\N	62	1294	1279
339	2020-04-24 08:11:32.045158	2020-04-24 08:11:32.045158	King Solomon Builds The Temple Of Jerusalem	\N	\N	1	\N	\N	1	\N	62	970	970
340	2020-04-24 08:20:01.885124	2020-04-24 08:20:01.885124	Eruption Of The Santorini Volcano In The Aegean	\N	\N	1	\N	\N	1	\N	62	1628	1628
341	2020-04-24 12:27:41.921568	2020-04-24 12:27:41.921568	Reign of Hittite King Tudhaliya IV	Was one of the last kings of the Hittite Empire.	\N	1	\N	\N	1	\N	62	1237	1209
342	2020-04-24 12:28:53.467933	2020-04-24 12:28:53.467933	Reign of Hittite King Suppiluliuma II	Was the last king of the Hittite Empire.	\N	1	\N	\N	1	\N	62	1207	1178
343	2020-04-24 12:32:39.227178	2020-04-24 12:34:25.753418	Reign of Assyrian King Adad-nirari I	During his reign at the beginning of the 13th century, the Assyrians began emerging as a major power in the Near East.	\N	1	\N	\N	1	\N	62	1307	1275
344	2020-04-24 12:38:43.304873	2020-04-24 12:38:43.304873	Assyrians Invade The Mittanian Empire	Somewhere around the beginning of the 13th century the Assyrians began invading the Mittanian Empire. Sacking their cities the Assyrians King Adad-nirari I placed a client king on their throne extending the Assyrian Empire sufficiently far west that it then bordered the Hittite Empire almost to the Mediterranean Sea.	\N	1	\N	\N	1	\N	62	1290	1290
345	2020-04-24 12:41:09.816781	2020-04-24 12:41:46.677033	Reign of Assyrian King Shalmaneser I	It is believed that it was during his reign that he finally brought an end to the Mittanian Empire.	\N	1	\N	\N	1	\N	62	1275	1245
346	2020-04-24 12:43:20.334741	2020-04-24 12:43:20.334741	Reign of Assyrian King Tukulti-Ninurta I	He began his rule just after the fall of the Mittanian Empire and expansion of the Assyrian west toward the Mediterranean Sea.	\N	1	\N	\N	1	\N	62	1244	1208
347	2020-04-25 17:30:38.388486	2020-04-25 17:30:38.388486	Hittites And Amurru Sign Treaty	As Assyria was rising as a dominant power, the Hittites felt the pressure. As a result they signed a treaty with the Amurru of what is today northern Syria. This created a bit of a buffer between themselves and the Assyrians along with the additional protection that comes in increasing the size of an alliance.	\N	1	\N	\N	1	\N	62	1225	1225
348	2020-04-25 18:05:54.450196	2020-04-25 18:06:26.779506	Hittites Conquer The Ugarit Kingdom	Under the reign of Suppiluliuma I the Ugarit kingdom was made a vassal state of the Hittite empire.	\N	1	\N	\N	1	\N	62	1350	1340
349	2020-04-25 18:29:41.488019	2020-04-25 18:29:41.488019	Destruction Of The City Of Ugarit	The destruction of Ugarit appears to have been quite sudden. Originally the quickness of the destruction was believed to have been caused by an earthquake. But more recent archaeological evidence suggests it was destroyed as part of an attack. Scattered arrow heads and the fact that the populous fled the city and never returned both indicate attack as the reason.	\N	1	\N	\N	1	\N	62	1190	1185
350	2020-04-25 18:35:11.498764	2020-04-25 18:35:11.498764	Egyptian Reign of Pharaoh Sipta	Was the last Pharaoh of the Nineteenth Dynasty.	\N	1	\N	\N	1	\N	62	1195	1189
351	2020-04-25 18:37:23.298238	2020-04-25 18:37:23.298238	Egyptian Reign of Pharaoh Seti II	\N	\N	1	\N	\N	1	\N	62	1203	1197
352	2020-04-25 19:05:53.045727	2020-04-25 19:05:53.045727	City Of Emar Is Destroyed	Although the date is a rough date and it's not clear who attacked and destroyed the city in inland Syria, it's clear it was destroyed quickly and violently.	\N	1	\N	\N	1	\N	62	1185	1185
353	2020-04-25 19:22:06.889929	2020-04-25 19:22:06.889929	Egyptian Reign of Queen Twosret	Was the widow of Seti II. She ruled for just a couple years.	\N	1	\N	\N	1	\N	62	1187	1185
354	2020-04-25 19:37:57.641044	2020-04-25 19:37:57.641044	Egyptian Reign of Pharaoh Ramses VI	\N	\N	1	\N	\N	1	\N	62	1141	1133
356	2020-04-25 20:35:52.016398	2020-04-25 20:35:52.016398	Reign Of Elamite King Shutruk-Nahhunte	\N	\N	1	\N	\N	1	\N	62	1190	1155
357	2020-04-25 20:50:52.149652	2020-04-25 20:50:52.149652	The Elamites Attack Babylon	Elam King Shutruk-Nahunte and the Elam army attack Babylon, capture the city, and overthrew the Kassite king. Afterwards he placed his own son on the throne.	\N	1	\N	\N	1	\N	62	1158	1158
358	2020-04-28 07:19:52.73465	2020-04-28 07:19:52.73465	The Palace At Pylos Is Destroyed	It's not clear how the fire started, or by whom. Only that it was cataclysmic in it's destruction.	\N	1	\N	\N	1	\N	62	1180	1180
355	2020-04-25 19:41:50.458167	2020-04-28 08:30:23.306666	Egyptian Reign of Pharaoh Ramses III	During his long reign he conducted many military campaigns. In 1155 he was assassinated. Egyptian documents of the following trials indicate it as a plot hatched by a minor queen of the court to have her son succeed Ramses III as Pharaoh.  This has come to be known as the 'Harem Conspiracy'. Archaeologists working with the mummy of Ramses III have found he was stabbed in the throat causing most likely instantaneous death.	\N	1	\N	\N	1	\N	62	1184	1155
359	2020-05-09 20:39:46.797727	2020-05-09 21:04:51.732299	Roman Capital Is Moved To Byzantium	Roman emperor Constantine moves the Roman capital from Rome to Byzantium. He then renames the new capital to Constantinople.	\N	2	\N	\N	2	\N	70	330	330
367	2020-05-19 22:46:12.429125	2020-05-19 22:46:12.429125	Thomas Hobbes Publishes the "Leviathan"	\N	\N	2	\N	\N	2	\N	70	1651	1651
361	2020-05-18 22:28:48.383487	2020-05-18 22:28:48.383487	The "First Reich" (the Holy Roman Empire)	\N	\N	2	\N	\N	2	\N	60	962	1806
362	2020-05-18 22:29:55.014148	2020-05-18 22:29:55.014148	The "Third Reich"	\N	\N	2	\N	\N	2	\N	60	1933	1945
363	2020-05-18 22:31:27.268853	2020-05-18 22:31:27.268853	The Weimar Republic	\N	\N	2	\N	\N	2	\N	74	1918	1933
360	2020-05-18 22:13:25.731883	2020-05-18 22:34:00.139923	The "Second Reich" (the New German Reich)	Foundation of the German Empire by Bismarck.	\N	2	\N	\N	2	\N	74	1871	1918
364	2020-05-19 22:41:42.290771	2020-05-19 22:41:42.290771	David Hume Publishes "Treatise of Human Nature"	\N	\N	2	\N	\N	2	\N	70	1740	1740
365	2020-05-19 22:42:59.631709	2020-05-19 22:42:59.631709	David Hume Publishes "Enquiry Concerning Human Understanding"	\N	\N	2	\N	\N	2	\N	70	1748	1748
366	2020-05-19 22:44:09.176323	2020-05-19 22:44:09.176323	John Locke Publishes the "Essay Concerning Human Understanding"	\N	\N	2	\N	\N	2	\N	70	1689	1689
368	2020-05-25 22:06:42.870005	2020-06-07 09:50:09.316777	German Social Democratic Party	Need to confirm ending date.	\N	2	\N	\N	2	\N	74	1890	1933
369	2020-05-25 22:30:45.927848	2020-05-25 22:30:45.927848	Social Darwinism	The theory that individuals, groups, and peoples are subject to the same Darwinian laws of natural selection as plants and animals. Now largely discredited, social Darwinism was advocated by Herbert Spencer and others in the late 19th and early 20th centuries and was used to justify political conservatism, imperialism, and racism and to discourage intervention and reform.	\N	2	\N	\N	2	\N	74	1890	1930
370	2020-06-06 16:16:27.445816	2020-06-06 16:44:02.677738	Unification of Italy	Creation of the Italian nation-state.	\N	2	\N	\N	2	\N	74	1858	1860
372	2020-06-06 16:51:40.49048	2020-06-06 16:51:40.49048	Treaty of Versailles	A treaty signed on 1919 which brought a formal end to the First World War. The treaty redivided the territory of the defeated Central Powers, restricted Germany's armed forces, and established the League of Nations. It left Germany resentful about what it considered a vindictive settlement while not sufficiently restricting its ability eventually to ream and seek forcible redress.	\N	2	\N	\N	2	\N	60	1919	1919
257	2020-03-24 21:02:00.504741	2020-06-06 16:59:39.316267	World War I	Bound by the chains of interlocking alliances and provoked by the massive buildup of battleships and weaponry, governments sent their armies off to face a new kind of warefare.	11	2	11	28	2	6	48	1914	1918
380	2020-06-07 10:39:19.68768	2020-06-07 10:42:29.144264	1st German Concentration Camp	Created to house Nazi's political prisoners in Bavaria. Initially run by a police detachment, the camp was put into the hands of the SS in April, with SS leader Huilman Wackerele as its commandant. Wacherle introduced a regime of violence and terror at Himmle's behest. Corruption, extortion and embezzlement were rife among guards, and the prisoners were exposed to arbitrary acts of cruelty and sadism in a world without regulations or rules.	\N	2	\N	\N	2	\N	74	1933	1933
373	2020-06-06 20:12:46.29821	2020-06-06 20:13:23.32925	The Steel Helments	"League of Front Soldiers". Founded on 13 November 1918 by Franz Seldte. The organization claimed that its main function was a source of financial support for old soldiers fallen on hard times. The organizations 1927 Berlin manifesto declared: "The Steel Helmets proclaim the battle agains all softness and cowardice, which seek to weaken and destroy the consciousness of honor of the German people through renunciation of the right of deference and will to deference". It denounced the Treaty of Versailles and demanded its abrogation, it wanted the restoration of the black-white-red national flag of the Bismarckian Reich, and it ascribed the economic problems of Germany to "the deficiency in living-space and the territory in which to work".	\N	2	\N	\N	2	\N	74	1918	1950
374	2020-06-06 20:32:28.847144	2020-06-06 20:35:01.209342	German Revolution 1918	Modeled by the Russian Bolshevik revolution, was thought by the communists as the opportunity to create a socialist state run by the workers' and soldiers' councils that sprung up all over the country as the old Imperial system disintegrated.	\N	2	\N	\N	2	\N	74	1918	1919
376	2020-06-07 09:34:39.934044	2020-06-07 09:34:39.934044	General Franco Dictatorship	\N	\N	2	\N	\N	2	\N	60	1939	1975
375	2020-06-07 09:25:32.343668	2020-06-07 09:35:07.281215	Mussolini Dictatorship	\N	\N	2	\N	\N	2	\N	60	1922	1943
371	2020-06-06 16:39:57.248204	2020-06-07 09:49:58.122723	German Communist Party	Founded by Karl Liebknecht and Rosa Luxemburg. Stemming from the minority of 'Independent Social Democrats'. Communism was intent on supressing human rights, dismantling representative institutions and abolishing civil freedoms.	\N	2	\N	\N	2	\N	74	1918	1933
378	2020-06-07 10:12:32.498597	2020-06-07 10:12:32.498597	National Socialist German Workers Party (Nazi Party)	Was a far-right political party that created and supported the ideology of National Socialism. It's precursor, the German's Worker's Party existed from 1919 to 1920.	\N	2	\N	\N	2	\N	57	1920	1945
379	2020-06-07 10:33:18.86938	2020-06-07 10:33:18.86938	The Thule Society	"Study Group for Germanic Antiquity", was a German occultist and Volkish group founded in Munich. Named after the mythical northern country in Greek legend. The society is notable chiefly as the organization that sponsored the German Worker's Party, which was later reorganized by Hitler into the National Socialist German Workers Party. According to Hitler biographer Ian Keshaw, the organization's membership list reads like a Who's Who of early Nazi sympathizer and leading figure in Munich", including Rudolf Hess, Alfred Rosenberg, Hans Frank, Julius Lehmann, Gotfried Feder, Diethich Eckart, and Karl Harrer.	\N	2	\N	\N	2	\N	57	1919	1945
377	2020-06-07 09:58:45.622522	2020-06-24 20:29:24.77244	Bauhaus	(German: Building House) German art school that combined crafts and the fine arts. The school became famous for its approach to design, which attempted to unify the principles of mass production with individual artistic vision and strove to combine aesthetics with everyday function.	\N	2	\N	\N	2	\N	57	1919	1931
381	2020-06-07 11:13:59.696254	2020-06-07 11:13:59.696254	Breve Economic Stability	The ability to borrow money to purchase goods, equipment, industrial plant and the like, and pay it back when it was worth a fraction of its original value, helped stimulate industrial recovery after the war. In the period up to the middle of 1922, economic growth rates in Germany were high, and unemployment low. Real taxation rates were also low enough to stimulate demand.	\N	2	\N	\N	2	\N	74	1918	1922
383	2020-06-07 11:59:54.511013	2020-06-07 12:00:19.411039	The End of the Hyperinflation	On November 1923 a new currency is issued, the Retenmark whose value was tied to the price of gold. A number of measures where put int place to defend it from speculation. This put an end to the hyperinflation.	\N	2	\N	\N	2	\N	74	1923	1924
382	2020-06-07 11:16:14.127173	2020-06-07 12:01:06.679661	The Great Inflation	\N	\N	2	\N	\N	2	\N	74	1922	1923
385	2020-06-29 20:01:16.254131	2020-06-29 20:01:16.254131	The Great Separation	The Great Separation as an historical idea begins with the publishing of Thomas Hobbes' Leviathan. It's the wholly novel idea that religion is not a meeting point between humans, God and the world we inhabit. Instead, it flips the "divine nexus" and instead views religion as a product of humans. That is religion emanates not from some divine origin, but from the imaginations of humans. Thomas Hobbes set off a progeny of philosophers who took this notion further into politics which eventually culminated in the institutionalized separation of church and state in Western countries. Although the Great Separation as an idea has had fits and starts and only really applies to the Western world, it continues into the present.	\N	\N	\N	\N	2	\N	70	1651	\N
387	2020-07-03 21:52:10.297218	2020-07-03 22:04:31.268587	The English Civil Wars	<p>Charles I, king of England often found his way around getting parliamentary approval for taxes to help pay for the wars against Spain and France in 1636 - 1637 and against Scotland in 1639 - 1640. Parliament, became suspicious that Charles was seeking to do away with the parliamentary system as a whole. Puritanism was also growing which was opposed to the hierarchy of the Church of England. Parliament also sought to attain more power during this time as well.</p><p><br></p><p>In 1642 the first of three civil wars broke out. Led by Oliver Cromwell the Parliamentarians defeated the royalists. In the second civil war the King attempted to strike back with Scottish support. This failed and the king was executed. His son, Charles II, came to power and was defeated by the Parliamentarians in the 3rd and final civil war.</p><p><br></p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	2	\N	\N	2	\N	48	1642	1651
\.


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.event_id_seq', 387, true);


--
-- Data for Name: event_note; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.event_note (id, created, modified, note, event_fk) FROM stdin;
68	2020-03-18 19:02:36.096685	2020-03-18 19:02:36.096685	The massive increase in industrial investment created thousands of new working-class jobs, many of which would be taken by peasants forced off their land.	232
42	2020-02-12 11:35:04.437431	2020-02-12 11:35:04.437431	By 700 AD, Monte Alban had grown into a city-state of about 25,000 people and interacted with other Mesoamerican regional states.	42
43	2020-02-12 11:36:13.236661	2020-02-12 11:36:13.236661	Monte Alban and Teotihuacan were Mesoamerica's two most powerful trading centers in the early Classic era.	42
45	2020-02-13 21:53:15.575933	2020-02-13 21:53:15.575933	A note	20
49	2020-02-13 22:03:03.182278	2020-02-13 22:03:03.182278	one note	33
50	2020-02-13 22:03:09.242488	2020-02-13 22:03:09.242488	two notes	33
51	2020-02-13 22:03:14.600624	2020-02-13 22:03:14.600624	3 notes	33
52	2020-02-19 08:15:55.339254	2020-02-19 08:15:55.339254	Lutheranism was born in Wittenberg, Germany.	45
53	2020-02-19 08:19:08.442676	2020-02-19 08:19:08.442676	The peace treaty was called the Augsburg Agreement.	46
54	2020-02-21 08:07:19.046187	2020-02-21 08:07:19.046187	After capturing Constantinople the Ottomons rename it to Istanbul.	49
55	2020-03-05 14:38:03.599064	2020-03-05 14:38:03.599064	It did not take long for Israel to mobilize. Soon their armies surpassed that of the Arab countries attacking them.	84
56	2020-03-14 17:32:03.912288	2020-03-14 17:32:03.912288	Originally the Emperor Yongle reigned in the Chinese capital Nanjing. In 1420 Nanjing was probably the largest city in the world with a population between half a million and a million people. Emperor Yongle was not content however with Nanjing and began construction on a new capital. This new capital was the Forbidden City. Today it is Beijing.	208
57	2020-03-14 17:34:23.150649	2020-03-14 17:34:23.150649	The Black Death is also known as the Bubonic Plague.	206
58	2020-03-14 17:34:50.768136	2020-03-14 17:34:50.768136	It is caused by the flea-borne bacterium Yersinia Pestis.	206
59	2020-03-14 17:48:30.34729	2020-03-14 17:48:30.34729	The Navy exploration was ended with the death of the Emperor Yongle in 1424. 	211
60	2020-03-14 17:50:07.546169	2020-03-14 17:50:07.546169	Niall Ferguson compares Zheng He's landing on the East African coast in 1416 as an equivalent achievement to landing an American on the moon in 1969.	211
61	2020-03-17 20:00:51.573628	2020-03-17 20:00:51.573628	The NEP represented a more market-oriented economic policy, deemed necessary after the Russian Civil War, to foster the economy of the country, which was almost ruined.	231
62	2020-03-17 20:01:00.545735	2020-03-17 20:01:00.545735	The complete nationalization of industry, established during the period of War Communism, was partially revoked and a system of mixed economy was introduced, which allowed private individuals to own small enterprises, while the state continued to control banks, foreign trade, and large industries. 	231
63	2020-03-17 20:01:07.985703	2020-03-17 20:01:07.985703	In addition the NEP abolished forced grain requisitions (prodrazvyorstka) and introduced a tax on farmers (prodnalog) payable in the form of raw agricultural product.	231
64	2020-03-18 18:51:48.870081	2020-03-18 18:51:48.870081	The Komnezamy acted with cruelty and without impunity taking away whatever they wanted from people or denouncing them as "Kulaks" in order to get rid of them.	226
65	2020-03-18 18:51:59.899017	2020-03-18 18:51:59.899017	Lenin's instructions explicitly called for the requisitioning of all grain, even that needed for immediate consumption and for planning next year's harvest, and may people carried his orders. In response, the peasants' enthusiasm for growing, sowing, and storing grain plunged. In addition their ability to produce was very low in any case as up to a third of young men had been mobilized to fight in World War I, while even more had joined the civil war and had not returned.	226
66	2020-03-18 19:00:33.84468	2020-03-18 19:00:33.84468	Foremen, laborers and managers alike vied with one another to fulfill, or even over-fulfil, the plan.	232
70	2020-03-18 19:31:29.161583	2020-03-18 19:31:29.161583	The initial refusal to join collective farms was itself a form of resistance.	238
71	2020-03-18 19:35:30.448196	2020-03-18 19:35:30.448196	Ordered to hand over their livestock to collective farms that people they trust, peasants began to slaughter cows, pigs, sheep and even horses. They ate the meat, salted, sold it, or concealed it. Those who didn't slaughter their animals protected them ferociously. In a few cases animals where released into the streets.	238
72	2020-03-18 19:35:42.417379	2020-03-18 19:35:42.417379	Because peasants refused to cooperate, the idealistic young agitators from outside and their local allies grew angrier, their methods became more extreme and their violence harsher.	238
73	2020-03-18 19:37:49.130074	2020-03-18 19:37:49.130074	Although the refusal to follow the Soviet policies was a way for peasants to defend their health, food, and entire future, the authorities perceived it as political sabotage motivated by counter-revolutionary thinking.	238
74	2020-03-18 19:41:00.158812	2020-03-18 19:41:00.158812	Rioters view the government as a hostile force or worse. Collectivization policy was the ultimate betrayal of the revolution, proof that the Bolsheviks intended to impose a "second serfdom" and rule like the 19th century tsars.	238
75	2020-03-18 19:49:58.578122	2020-03-18 19:49:58.578122	Threatened by violence and afraid of hunger, hundreds of thousands of peasants finally relinquished their land, animals and machines to the collective farms.	239
76	2020-03-18 19:54:18.568746	2020-03-18 19:54:18.568746	Collectivization also meant that peasants had lost their ability to make decisions about their lives. Like the serfs of old, they were forced to accept a special legal status, including controls of their movement. They couldn't decide any longer when to reap, sow and sell. They didn't earn regular salaries but were paid with "trudodni" or day wages, which often meant payment in kind (grain, potatoes, or other products) rather then cash. They lost their ability to govern themselves too, as collective farms bosses and their entourages supplanted the traditional village councils.	225
77	2020-03-18 19:58:25.00625	2020-03-18 19:58:25.00625	As a consequence recently self-reliant farmers now worked as little as possible since they couldn't see a direct return on their efforts. Collective farms produced dramatically less than they could or should have done. Stealing became a common practice, as State property was not respected. This form of "every-day" resistance characterized not only the peasantry but all kinds of underpaid, underfed, and unmotivated Soviet workers.	225
78	2020-03-18 20:15:26.446653	2020-03-18 20:15:26.446653	The only country not adversely affected was the USSR. 	242
79	2020-03-18 20:16:44.777846	2020-03-18 20:16:44.777846	In Germany, the US's demand for outstanding loans to be repaid further impoverished the country, fueling the popularity of Adolf Hitler's National Socialist (Nazi) Party.	242
80	2020-03-18 20:34:03.205707	2020-03-18 20:34:03.205707	The forces collaborated only once, intervening to end the Prague Spring uprising, which occurred in Czechoslovakia in 1968.	244
81	2020-03-18 20:37:50.517222	2020-03-18 20:37:50.517222	Greece and Turkey joined in 1952.	243
82	2020-03-18 20:39:12.515766	2020-03-18 20:39:12.515766	West Germany joined in 1955, which motivated the Communist states of Europe to create the Warsaw Pact. 	243
83	2020-03-18 20:39:28.885098	2020-03-18 20:39:28.885098	Spain joined in 1982.	243
84	2020-03-18 20:40:06.015221	2020-03-18 20:40:06.015221	After the end of the cold war, NATO expanded into eastern Europe to become and alliance of 29 states.	243
85	2020-03-21 21:54:40.394843	2020-03-21 21:54:40.394843	This force was also tasked with protection of Soviet borders and espionage, which included political assassinations abroad, influencing foreign governments and enforcing Stalinist policy within communist movements in other countries.	248
86	2020-03-23 18:35:48.058072	2020-03-23 18:35:48.058072	In Najaf, Iraq Khomeini had a small loyal following. But in general the clergy of Iraq shunned him.	250
87	2020-03-23 18:50:32.725671	2020-03-23 18:50:32.725671	Saigon is later renamed to Ho Chi Minh City.	251
88	2020-03-23 19:02:46.231082	2020-03-23 19:02:46.231082	After Muhammad's death Islam fell into two divisions, Sunni and Shia. The Sunni line fell into a succession based on power. The caliphs (successors) were chosen by consensus by wise men. \n\nOn the other side the Shia fell into a line of succession that was religious. That is the power of Islam is handed down through the descendants of the prophet. These descendants are known as Imams, or leaders of prayer.	253
89	2020-03-23 19:03:25.016814	2020-03-23 19:03:25.016814	After Muhammad's death Islam fell into two divisions, Sunni and Shia. The Sunni line fell into a succession based on power. The caliphs (successors) were chosen by consensus by wise men. \nOn the other side the Shia fell into a line of succession that was religious. That is the power of Islam is handed down through the descendants of the prophet. These descendants are known as Imams, or leaders of prayer.	252
90	2020-03-23 19:06:39.402139	2020-03-23 19:06:39.402139	While throughout the history of Islam there would be Shia empires. In general the history of Shiism is the history of a minority in opposition, of sacrifice and martyrdom.	253
91	2020-03-23 19:22:23.764997	2020-03-23 19:22:23.764997	During the rule of Shah Ismail, he forced his Sunni subjects to convert to Shiism almost overnight. He brought over clerics and scholars from the holy Shia cities of Karbala and Najaf in Iraq. As well as from Jabal  Amel in south Lebanon to teach and spread the new gospel.	254
92	2020-03-23 20:16:21.8882	2020-03-23 20:16:21.8882	Imam Hussein was killed on the tenth, ashura, day of the Muslim month of Muharram and became a tragic, exalted figure, buried near the site of the battle. For centuries to come, Shias would incant "Every day is Ashura, every land is Karbala."	256
93	2020-03-23 20:23:10.611258	2020-03-23 20:23:10.611258	As with every historical event, there were difference interpretations of the meaning of the battle. Some historians dismissed Imam Hussein's endeavor as a tale of failure; some saw a battle between two fallible men each seeking power; others described Hussein as a rebel standing up for justice against tyranny. How had he gone into battle: seeking martyrdom and riding willingly to a sure death? Or clear-eyed, weighing his options, and still hoping for the best outcome?	256
94	2020-04-01 19:41:45.202739	2020-04-01 19:41:45.202739	Imam Sadr blasted the government in Beirut for its neglect of Lebanon's Shias and rural areas in general, for the unpaved roads, the lack of schools and basic rights like water and electricity.	262
95	2020-04-01 19:45:43.789823	2020-04-01 19:45:43.789823	The Baalbek rally began the Movement of the Disinherited. A movement which Sadr recently founded with his friend Husseini, a multi-confessional movement that was the result of more than a decade of work.	262
96	2020-04-01 19:59:03.705611	2020-04-01 19:59:03.705611	Israel came out of this war with full control of the city of Jerusalem.	85
97	2020-04-01 20:21:53.296702	2020-04-01 20:21:53.296702	The Pahlavi dynasty would be marked as a time of speedy industrialization of Iran. Both father and son tried to force rapid modernization of Iran.	264
98	2020-04-06 13:03:09.155782	2020-04-06 13:03:09.155782	The pyramid would serve as the Pharoah Djoser's tomb.	269
99	2020-04-06 13:43:59.45811	2020-04-06 13:43:59.45811	Pharoah Merneptah is most likely known today as being the first known instance of the use of "Israel" outside the Bible. Within the same inscription mentioned in the description he also refers to the Israelites. Noting that "Israel" as used in the inscriptions denotes it as a people and not as a place.	270
100	2020-04-06 13:48:53.735432	2020-04-06 13:48:53.735432	Of the "Sea Peoples" (does not include Libyans) Egyptian inscriptions indicate five groups. They include: the Shardana, Shekelesh, Eqwesh, Lukka, and the Teresh.	270
101	2020-04-06 13:51:51.987405	2020-04-06 13:51:51.987405	The result of this attack by outside invaders would be a victorious Egypt. Although 30 years later in 1177 BC three of the aforementioned groups would attack Egypt again.	270
102	2020-04-06 14:20:55.017298	2020-04-06 14:20:55.017298	The Frescoes were commissioned to Minoan artists from across the Mediterranean on the island of Crete. They painted frescoes of men leaping over bulls. Images never seen in Egypt.  These types of frescoes had become in vogue in other locations as well. Frescoes of this type from this time period have been found in Kabri in Israel, Alalakh in Turkey, Qatna in Syria, and Dab'a in Egypt.	272
103	2020-04-06 14:22:16.002551	2020-04-06 14:22:16.002551	Peru-nefer is known as Tell ed-Dab'a in modern Egypt.	272
104	2020-04-06 14:23:29.208268	2020-04-06 14:23:29.208268	Previously Peru-nefer was known as Hyksos, the hated invaders of Egypt who ruled much of the country from ca. 1720 to 1550 BC. When recaptured by Egypt it was named Peru-nefer.	272
105	2020-04-06 16:59:02.940224	2020-04-06 16:59:02.940224	The Hyksos was a mistranslation of the Egyptian,  phrase "hekau khasut" which means "chieftans of foreign lands". They were Semites who migrated into Egypt from teh region of Canaan, that is, modern-day Israel, Lebanon, Syria, and Jordan.	274
106	2020-04-06 17:01:19.180293	2020-04-06 17:01:19.180293	The invasion of the Hyksos brought an end to the Middle Kingdom period of Egyptian history.	274
107	2020-04-06 17:01:55.291622	2020-04-06 17:01:55.291622	They ruled from their capital city of Avaris. Later when Egypt reconquered Avaris would be known as Peru-nefer.	274
108	2020-04-06 17:52:11.277576	2020-04-06 17:52:11.277576	Archaeological evidence has shown the the Minoans participated in a large trade network. Minoan goods from the Middle to Late Bronze Age have been found in countries stretching from Egypt, Israel, Jordan, and Cyprus to Syria and Iraq.	278
109	2020-04-06 18:53:49.383441	2020-04-06 18:53:49.383441	After coming to the throne he wasted no time in attempting to remove Hatshepsut's legacy from Egyptian history. He ordered her monuments desecrated and her name chiseled out of inscriptions wherever possible.	281
110	2020-04-07 20:00:18.010676	2020-04-07 20:00:18.010676	Later Megiddo would become known as Armageddon biblically.	282
111	2020-04-07 20:06:52.8758	2020-04-07 20:06:52.8758	Interestingly General Allenby would use the same tactics as Pharaoh Thutmose III would use some 3,400 years earlier. General Allenby would later admit that he had read James Breasted's English translation of Thutmose III's account, leading Allenby to decide to replicate history.  George Santayana once reportedly said that those who do not study history are doomed to repeat it, but Allenby proved that the opposite could be true as well -- those who study history can successfully repeat it, if they choose to do so.	283
112	2020-04-07 20:08:30.433992	2020-04-07 20:08:30.433992	Thutmose III's campaigns are the first to not just be recorded, but were inscribed in stone for others to read. His campaigns are the first in known history to have been recorded not just for himself, but for others as well.	282
113	2020-04-07 20:34:50.31335	2020-04-07 20:34:50.31335	The city of Hattusa was very well fortified, both geographically and physically. So much so that it was only captured twice during it's five-hundred year occupation.	284
114	2020-04-07 20:40:49.670136	2020-04-07 20:40:49.670136	The destruction of Babylon ended the two-hundred year old dynasty made famous by Hammurabi "the Law-Giver".	285
115	2020-04-07 20:41:40.769362	2020-04-07 20:41:40.769362	As an unintended consequence of his action, a previously unknown group called the Kassites was able to occupy the city of Babylon and then ruled over it for the next several centuries.	285
116	2020-04-08 21:15:20.689858	2020-04-08 21:15:20.689858	In 1936 Himmler made it a suboffice of the Security Police.	298
117	2020-04-08 21:16:28.584389	2020-04-08 21:16:28.584389	In 1939 it was administered by the "Reich Main Security Office" and was considered a sister organization of the "Security Service".	298
118	2020-04-08 21:27:16.456823	2020-04-08 21:27:16.456823	The Comintern was founded after the 1915 Zimmerwald Conference in which Lenin had organized the "Zimmerwald Left" against those who refused to approve any statement explicitly endorsing socialist revolutionary action, and after the 1916 dissolution of the Second International.	299
119	2020-04-08 21:27:37.380306	2020-04-08 21:27:37.380306	The Comintern had seven World Congresses between 1919 and 1935.	299
120	2020-04-08 21:30:44.532609	2020-04-08 21:30:44.532609	It also acted as a communist "s.chool" for the future communist leaders	299
121	2020-04-08 21:40:08.335793	2020-04-08 21:40:08.335793	Following this pact, Hitler invaded Poland on September 1, 1939, and England and France declared the war on Germany.	300
122	2020-04-08 21:43:11.603107	2020-04-08 21:43:11.603107	Less than 3 weeks later, on September 17, 1939, Stalin invaded Poland too. The Wehrmacht and the Red Army met one another on their new border, shook hands, and agreed to exist in peace.	300
123	2020-04-08 21:50:47.198284	2020-04-08 21:50:47.198284	The Soviet Union and Nazi Germany were, for twenty-two months, real allies. The USSR sold oil and grain to Germany, and Germany sold weapons to the USSR. It even resulted on a prisoner exchange.In 1940, several hundred German communists were removed from the Gulag camps where they had been imprisoned and taken to the the border. Most of the loyal communists ended up on Nazi jails and camps.	300
124	2020-04-08 21:56:15.982969	2020-04-08 21:56:15.982969	in 1925, Stalin supervised the organization first training center in Moscow. High standards were set for the first participants. They had to know English, German or French; were required to have read the most important works of Marx, Engels, and Plekhanov; and had to pass a test administered by the Comintern as well as a very thorough background check. 	299
125	2020-04-08 22:12:30.880911	2020-04-08 22:12:30.880911	One of its main tasks was spying on the population, mainly though a vast network of citizens turned informants, and fighting an opposition by overt and covert measures, including hidden psychological destruction of dissidents (Zersetzung, literally meaning decomposition).	302
126	2020-04-11 17:37:59.090012	2020-04-11 17:37:59.090012	He would be the husband of Nefertiti.	307
127	2020-04-11 17:40:04.076585	2020-04-11 17:40:04.076585	The banning of all Gods and Goddesses was known as the Amarna Revolution.	307
128	2020-04-11 20:28:00.193111	2020-04-11 20:28:00.193111	It is possible that the young widow Ankhsenamen of King Tut in Egypt wrote to King Suppiluliumas I asking for a husband.	321
129	2020-04-11 20:30:01.552003	2020-04-11 20:30:01.552003	Modern CT scans of King Tut's body indicate that he may have died of infection stemming from a broken leg.	310
130	2020-04-11 20:30:43.554742	2020-04-11 20:30:43.554742	He also suffered from malaria and congenital deformations, including a club foot.	310
131	2020-04-11 20:41:08.803565	2020-04-11 20:41:08.803565	During his short reign he notably reversed his father Pharaoh Akhenaten's ban on all Gods and Goddesses. The large amount of treasures found in Tut's tomb could be unique in that they were gifts given by the priesthood in thanks of his reinstating the Egyptian religion.	310
134	2020-04-15 20:39:53.791026	2020-04-15 20:39:53.791026	His son Mursili II wrote on tablets what is known as the 'Plague Prayers'. Based on the writings. in these tablets it appears that after a war in what is northern Syria today Egyptian prisoners of war brought with them the Plague. The plague ravaged the Hittite population killing may royals including Suppiluliuma I. In the eyes of Mursili this plague was retribution by the Gods for a murder that took place early in Supiluliuma's reign. This was the murder of Tudhaliya the Younger, Supiluliuma's brother. While it's not clear if Supiluliuma had anything to do with the death, he did benefit from it as it was Tudhaliya who stood to inherit the throne.	321
135	2020-04-23 17:36:19.777301	2020-04-23 17:36:19.777301	In the mid-fourteenth century BC King Suppiluliuma I of the Hittite empire signed a treaty making Ugarit a Hittite vassal.	329
136	2020-04-23 19:38:58.093755	2020-04-23 19:38:58.093755	The story of the Trojan War in a nutshell is: Paris, the son of King Priam of Troy, sailed from northwestern Anatolia (Turkey) to mainland Greece on a diplomatic mission to Menelaus, the King of Sparta. While there he fell in love with Menelaus's beautiful wife, Helen. When Paris returned home, Helen accompanied him -- either voluntarily, according to the Trojans, or taken by force, according to the Greeks. Enraged, Menelaus persuaded his brother Agamemnon, King of Mycenae and the leader of the Greeks, to send an armada of a thousand ships and fifty thousand men against Troy to get Helen back. In the end, after a ten-year-long war, the Greeks were victorious. Troy was sacked, most of its inhabitants were killed, and Helen returned home to Sparta with Menelaus.	335
138	2020-04-23 19:50:00.418332	2020-04-23 19:50:00.418332	It is during this 40 year journey that Moses is said to have written the 10 commandments at Mount Sanai. In which the Ark of the Covenant was built in order to carry it on to Canaan.	336
139	2020-04-24 08:24:38.983268	2020-04-24 08:24:38.983268	This eruption has been used to explain the parting of the Red Sea as described in the Bible during the Exodus of the Hebrews from Egypt. However, given that radio carbon dating has put this eruption at 1650 earliest, and most likely during 1628 BC it would seem impossible that this could be the explanation. The Bible places the Exodus some time in the 15th century, but archaeological evidence shows that if it did occur it would have most likely been during the 13th century. So either way the eruption either occurred two centuries or four centuries prior to the parting of the Red Sea story. 	340
140	2020-04-24 08:33:01.677656	2020-04-24 08:33:01.677656	What is clear is that by the end of the 13th century BC, the Israelite/Hebrew culture was present in the lands of Canaan. It is their culture, along with the Philistines and the Phoenicians, that rises up out of the ashes of the destruction of the Canaanite civilization sometime during the twelfth century BC. It would be these peoples who would make up a new world order, emerging out of the chaos that was the end of the Late Bronze Age.	336
141	2020-04-24 12:45:27.596897	2020-04-24 12:45:27.596897	He is known as one of the greatest of Assyria's "Warrior Kings".	346
142	2020-04-24 19:43:17.978455	2020-04-24 19:43:17.978455	Two events stand out that occurred during the reign of King Tukulti-Ninurta I. First was his attack and defeat of the city of Babylon. Second, was his defeat of the Hittites under the reign of Tudhaliya Iv. This defeat drastically changed the balance of power in the Near East. Assyria by that point was a major power.	346
143	2020-04-24 19:43:41.958142	2020-04-24 19:43:41.958142	His reign came to an end when he was assassinated by one of his own sons.	346
144	2020-04-25 17:32:55.849548	2020-04-25 17:32:55.849548	The treaty was signed between Tudhaliya IV, king of the Hittites and Shaushgamuwa, king of the Amurru.	347
145	2020-04-25 17:38:13.113942	2020-04-25 17:38:13.113942	In the treaty the Hittites specify that the Ahhiyawa (Mycenaea) will not trade with the Assyrians. This is one of the earliest instances of what we would normally think of as a modern concept: the embargo.	347
146	2020-04-28 08:32:23.846414	2020-04-28 08:32:23.846414	After the death of Ramses III the Egyptian empire went into a state of decline, or at least stagnation.	355
147	2020-05-18 22:21:25.03666	2020-05-18 22:21:25.03666	<p>The word &quot;Reich&quot; conjured up an image among educated Germans that resonated far beyond the institutional structures Bismarck created: the successor to the Roman Empire; the vision of God&#39;s Empire here on earth; the universality of its claim to suzerainty, the concept of a German state that would include all German speakers in Central Europe -&#39;one People, one Reich, one Leader&#39;, as the Nazi slogan was to put it.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	360
148	2020-05-18 22:35:41.244327	2020-05-18 22:40:32.496516	<p>The constitution which Bismarck devised for the new German Reich in 1871 in many ways fell far short of the ideals dreamed of by the liberals in 1848. Alone of all modern constitutions, it lacked any declaration of principle about human rights and civic freedoms. Formally speaking the new Reich was a loose confederation of independent states, much like its predecessor had been. Its titular head was the Emperor or Kaiser, the title taken from the old head of the Holy Roma Reich and ultimately deriving from the latin name &#39;Caesar&#39;. He had wide ranging powers including the declaration of war an peace.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	360
149	2020-05-18 22:40:43.71994	2020-05-18 22:44:53.093624	<p>The Reich&#39;s institutions where stronger than those of the old, with a nationally elected parliament, the Reichstag - the name, deriving from the Holy Roman Reich, was another survival across the revolutionary divide of 1918 - and a number of central administrative institutions, most notably the Foreign Office, to which more were added as time went on. But the constitution did not accord to the national parliament the power to elect of dismiss governments and their ministers, and key aspects of political decision-making, above all on maters of war and peace, and on the administration of the army, were reserved to the monarch and his immediate entourage.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	360
151	2020-05-25 22:15:53.875477	2020-05-25 22:15:53.875477	<p>The liberals support for the Anti-socialist Law caused the Social Democrats to distrust all &quot;bourgeois&quot; political parties and to reject the idea of co-operating with the political supporters of capitalism or the exponents of what they regarded as a merely palliative reform of the existing political system.</p><p><br></p><p>The Coming of the Third Reich, chapter &quot;German Peculiarities&quot;, page 14.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	368
150	2020-05-25 22:09:29.258477	2020-05-25 22:16:17.549138	<p>By the eve of the First World War the party had over a million members, the largest political organization anywhere in the world.</p><p><br></p><p>The Coming of the Third Reich, chapter &quot;German Peculiarities&quot;, page 14.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	368
154	2020-06-07 10:16:01.540675	2020-06-07 10:16:01.540675	It would be wrong to see Nazism as a form of socialism. Although its rhetoric was frequently egalitarian, it stressed the need to put common needs above the needs of the individual, and it often declared itself opposed to big business and international finance capital. But from the very beginning Hitler declared himself implacably opposed to Social Democracy and, initially to a much smaller extent, Communism.	378
153	2020-06-07 10:03:49.928961	2020-06-07 10:04:01.788915	<p>The fate of the Bauhaus illustrated how difficult it was for avant-garde culture to receive official acceptance even in the culturally relaxed atmosphere of the Weimar Republic.&nbsp;</p><p><br></p><p><span style='color: rgb(48, 50, 53); font-family: Roboto, "Helvetica Neue", sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;'>(The Coming of the Third Reich, Culture Wars, pg 123)</span></p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	377
152	2020-06-07 10:00:51.672462	2020-06-07 10:04:07.549048	<p>Its bohemian students where unpopular with the townspeople, and its radically simple, clean, and ultra-modern designs were condemned by local politicians as owing more to the art-forms of primitve races that to anything German.&nbsp;</p><p><br></p><p>(The Coming of the Third Reich, Culture Wars, pg 123)</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	377
155	2020-06-07 10:17:34.762632	2020-06-07 10:20:47.710849	<p>The &#39;National Socialists&#39; wanted to united the two political camps of left and right into which, they argued, the Jews had manipulated the German nation. The basis of this was to be the idea of race. Nazism was in some ways an extreme counter-ideology to socialism, borrowing much of its rhetoric in the process, from its self-image as a movement rather than a party, to it&#39;s much-vaunted contempt for bourgeois convention and conservative timidity. (The Coming of the Third Reich, Bohemian Revolutionaries, page 173).</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	378
157	2020-06-24 20:28:27.149625	2020-06-24 20:28:27.149625	Its radically simple, clean and ultra-modern designs were condemned by local politicians as owing more to the art forms of primitive races than to anything German.	377
\.


--
-- Name: event_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.event_note_id_seq', 157, true);


--
-- Data for Name: event_tag; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.event_tag (id, created, modified, event_fk, tag_fk) FROM stdin;
1	2020-03-13 18:41:13.644768	2020-03-13 18:41:13.644768	11	2
\.


--
-- Name: event_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.event_tag_id_seq', 1, true);


--
-- Data for Name: month; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.month (id, created, modified, label) FROM stdin;
1	2019-12-19 19:24:57.411763	2019-12-19 19:24:57.411763	January
2	2019-12-19 19:25:05.790391	2019-12-19 19:25:05.790391	February
3	2019-12-19 19:25:09.325619	2019-12-19 19:25:09.325619	March
4	2019-12-19 19:25:12.906966	2019-12-19 19:25:12.906966	April
5	2019-12-19 19:25:17.415394	2019-12-19 19:25:17.415394	May
6	2019-12-19 19:25:21.185606	2019-12-19 19:25:21.185606	June
7	2019-12-19 19:25:25.530393	2019-12-19 19:25:25.530393	July
8	2019-12-19 19:25:32.610164	2019-12-19 19:25:32.610164	August
9	2019-12-19 19:25:39.79174	2019-12-19 19:25:39.79174	September
10	2019-12-19 19:25:44.929575	2019-12-19 19:25:44.929575	October
11	2019-12-19 19:25:49.719739	2019-12-19 19:25:49.719739	November
12	2019-12-19 19:25:55.268219	2019-12-19 19:25:55.268219	December
\.


--
-- Name: month_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.month_id_seq', 12, true);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.person (id, created, modified, first_name, middle_name, last_name, birth_day, birth_era_fk, birth_month_fk, birth_year, death_day, death_era_fk, death_month_fk, death_year, reference_fk, description) FROM stdin;
45	2020-03-14 17:23:09.535546	2020-03-14 17:23:09.535546	Emperor Wanli	\N	\N	\N	2	\N	1572	\N	2	\N	1620	\N	\N
46	2020-03-14 17:28:16.935452	2020-03-14 17:28:16.935452	Emperor Yongle	\N	\N	\N	2	\N	1402	\N	2	\N	1424	58	\N
47	2020-03-14 17:39:02.715023	2020-03-14 17:39:02.715023	Pieter 	\N	Bruegel the Elder	\N	2	\N	1525	\N	2	\N	1569	58	\N
48	2020-03-16 15:15:10.88332	2020-03-16 15:15:10.88332	Nestor	\N	Makhno	26	2	10	1888	6	2	7	1934	57	\N
49	2020-03-16 15:18:48.165927	2020-03-16 15:18:48.165927	Leon	\N	Trosky	\N	2	\N	1879	\N	2	\N	1940	48	\N
51	2020-03-16 16:38:30.756396	2020-03-16 16:38:30.756396	Symon	\N	Petliura	22	2	5	1879	25	2	5	1926	57	\N
52	2020-03-16 17:29:34.915219	2020-03-16 17:36:24.799845	Vladimir	\N	Lenin	22	2	4	1870	21	2	1	1924	57	Russian communist revolutionary, politician and political theorist who served as head of government of the Russian Republic from 1917 to 1918, of the Russian Soviet Federative Socialist Republic from 1918 to 1924 and of the Soviet Union from 1922 to 1924. Born to a wealthy middle-class family in Simbirsk, Lenin embraced revolutionary socialist politics following his brother's execution in 1887. Expelled from Kazan Imperial University for participating in protests against the Russian Empire's Tsarist goverment, he devoted the following years to a law degree. He moved to St. Petersburg in 1893 and became a senior figure in the Marxist Russian Social Democratic Labour Party. In 1897, he was arrested for sedition and exiled to Shushenskoye for three years, where he married Nadezhda Krupskaya.
50	2020-03-16 15:21:00.783865	2020-03-24 19:55:37.04327	Joseph	\N	Stalin	18	2	12	1878	4	2	3	1953	57	Stalin was the leader of the Soviet Union from the mid-1920s until his death. Holding the post of the General Secretary of the Central Committee of Communist Party of the Soviet Union, he was effectively the dictator of the state.
30	2020-02-06 09:52:06.580819	2020-04-28 09:25:55.370953	Alexander III			\N	1	\N	355	\N	1	\N	323	48	Known more commonly as "Alexander the Great".
53	2020-03-22 17:22:37.395875	2020-03-22 17:22:37.395875	Yvonne	\N	Cook	9	2	9	1961	\N	\N	\N	\N	61	\N
54	2020-03-22 17:24:09.813331	2020-03-22 17:24:09.813331	Betty 	\N	Summers	10	2	6	1933	\N	\N	\N	\N	61	\N
55	2020-03-22 17:24:33.703457	2020-03-22 17:24:33.703457	Adriana	\N	De La Cuadra	23	2	4	1981	\N	\N	\N	\N	61	\N
56	2020-03-22 17:24:50.380673	2020-03-22 17:24:50.380673	Nicholas	\N	Cook	9	2	2	1988	\N	\N	\N	\N	61	\N
32	2020-02-19 08:12:08.235138	2020-02-19 08:12:08.235138	Martin	\N	Luther	10	2	11	1483	18	2	2	1546	48	\N
33	2020-02-19 09:32:07.085925	2020-02-19 09:32:07.085925	King Francis I	\N	\N	\N	2	\N	1515	\N	2	\N	1537	48	\N
34	2020-02-19 09:32:41.75852	2020-02-19 09:32:41.75852	King Henri IV	\N	\N	\N	2	\N	1589	\N	2	\N	1610	48	\N
35	2020-02-21 08:21:10.529146	2020-02-21 08:21:10.529146	Suleyman The Magnificent	\N	\N	\N	2	\N	1520	\N	2	\N	1566	48	\N
36	2020-03-05 18:18:52.565712	2020-03-05 18:18:52.565712	Yasser	\N	Arafat	24	2	8	1929	11	2	11	2007	56	\N
40	2020-03-06 15:35:39.153909	2020-03-06 15:35:39.153909	Muhammad	\N	\N	\N	2	\N	570	\N	2	\N	632	56	\N
42	2020-03-14 17:09:51.261047	2020-03-14 17:09:51.261047	Tamerlane	\N	\N	\N	2	\N	1336	\N	2	\N	1405	58	\N
43	2020-03-14 17:20:25.738737	2020-03-14 17:20:25.738737	Abbas I	\N	\N	\N	2	\N	1587	\N	2	\N	1629	58	\N
44	2020-03-14 17:22:33.91813	2020-03-14 17:22:33.91813	Emperor Akbar	\N	\N	\N	2	\N	1556	\N	2	\N	1605	58	\N
41	2020-03-11 17:16:33.250306	2020-03-23 18:20:43.968612	Matt	\N	Cook	15	2	3	1983	\N	2	5	\N	57	This is a test description.
37	2020-03-06 10:28:33.443887	2020-03-23 18:39:11.389785	Ruhollah	Musavi	Khomeini	24	2	9	1902	3	2	6	1989	56	\N
39	2020-03-06 10:54:35.669215	2020-03-23 18:39:22.451048	Ali	Hosseini	Khamenei	19	2	4	1939	\N	2	6	\N	56	\N
58	2020-03-23 18:42:55.740495	2020-03-23 18:42:55.740495	Hussein	\N	al-Husseini	15	2	4	1937	\N	\N	\N	\N	56	A Lebanese politician.
59	2020-03-23 18:45:35.476321	2020-03-23 18:45:35.476321	Mostafa	\N	Chamran	2	2	10	1932	21	2	6	1981	56	He was an Iranian physicist turned leftist revolutionary guerrilla fighter.
60	2020-03-23 19:15:39.447469	2020-03-23 19:15:39.447469	Ismail I	\N	\N	17	2	7	1487	23	2	5	1524	56	Also knows as Shah Ismail. He founded the Safavid dynasty in Persia. 
57	2020-03-23 18:38:36.061551	2020-03-24 10:39:02.476732	Musa	\N	al-Sadr	4	2	6	1928	31	2	8	1978	56	A magnetic Iranian cleric often known as Imam Sadr was born in the holy city of Qom, Iraq. He wore the black turban, which signaled that as a cleric he was also a descendant of the prophet, a sayyed or sayyid. The title 'Imam' was an additional honorific bestowed on him by his devoted followers.
72	2020-04-11 20:21:38.148354	2020-04-11 20:21:38.148354	Tutankhamen	\N	(Tut)	\N	1	\N	1340	\N	1	\N	1323	62	'King Tut' as we know him today.
61	2020-03-24 19:59:23.175225	2020-03-24 20:01:22.00959	Klement	\N	Gottwald	23	2	11	1896	14	2	3	1953	57	Czechoslovak communist politician and longtime leader of the Communist Party. He was Prime Minister of Czechoslovakia from 1946 to 1948 and President from 1948 to 1953.
62	2020-03-24 20:06:44.657431	2020-03-24 20:09:53.18697	Joseph	\N	Tito	7	2	5	1892	4	2	5	1980	57	Yugoslav revolutionary and statesman, serving in various roles from 1943 until his death in 1980. During World War II he was the leader of the Partisans, often regarded as the most effective resistant movement in occupied Europe.
63	2020-03-24 20:40:32.771316	2020-03-24 20:40:32.771316	Georgi	\N	Dimitrov	18	2	6	1882	2	2	7	1949	57	Bulgarian communist politician. He was the first communist leader of Bulgaria, from 1946 to 1949. Dimitrov led the Third Comintern under Stalin from 1934 to 1943. He was a theorist of capitalism who expanded Lenin's ideas by arguing that fascism was the dictatorship of the most reactionary elements of financial capitalism.
64	2020-03-24 20:43:43.236662	2020-03-24 20:43:43.236662	Matyas	\N	Rakosi	9	2	3	1892	5	2	2	1971	57	Leader of Hungary's Communist Party from 1945 to 1956. His rule was aligned with USSR politics during Joseph Stalin's government. 
66	2020-03-24 20:50:50.474114	2020-03-24 20:50:50.474114	Walter	\N	Ulbricht	30	2	6	1893	1	2	8	1973	57	German communist politician. Ulbricht played a leading role in the creation of the Weimar -era Communist Party in Germany (KPD) and later in the early establishment of East Germany (the German Democratic Republic). 
65	2020-03-24 20:47:25.936221	2020-03-24 20:52:06.696079	Boleslaw	\N	Bierut	18	2	4	1882	12	2	3	1956	57	Polish communist leader, NKVD agent, and a hard-line Stalinist who became President pf Poland after the Soviet takeover of the country in the aftermath of World War II.
67	2020-04-01 20:03:37.941765	2020-04-01 20:07:25.931275	Mohammad	Reza	Pahlavi	26	2	10	1919	27	2	7	1980	56	Pahlavi was the last Shah of Iran. His reign lasted from September 16th 1941 until his overthrow during the Iranian Revolution on February 11th 1979.
68	2020-04-06 17:47:34.640785	2020-04-06 17:47:34.640785	Thucydides	\N	\N	\N	1	\N	455	\N	1	\N	400	62	A Greek historian. Remembered for his History of the Peloponnesian War. He fought in this conflict on the Athenian side.
69	2020-04-06 18:27:55.079341	2020-04-06 18:50:14.430079	Hatshepsut	\N	\N	\N	1	\N	1508	\N	1	\N	1480	62	She was the fifth pharaoh of the eighteenth dynasty of Egypt. She came to the throne in 1478 and officially ruled jointly with Thutmose III who had ascended to the throne as a child one year earlier.
73	2020-04-23 18:32:08.968637	2020-04-23 18:32:08.968637	Ramses II	\N	\N	\N	1	\N	1303	\N	1	\N	1213	62	Also known as Ramses the Great was the third Pharaoh of the Nineteenth Dynasty.
70	2020-04-08 16:33:05.430197	2020-04-08 17:13:31.589067	Ann	\N	Lee	29	2	2	1736	8	2	9	1784	63	Born poor in Manchester England. Her father was a blacksmith. She would go on to migrate to America where she would formally found the Shaker religion. Celibate and communal, she would be the guide of the church elders until her death.
71	2020-04-08 20:26:23.616865	2020-04-08 20:29:27.992959	Adolf	\N	Hitler	20	2	4	1889	30	2	4	1945	57	Adolf Hitler was an Austrian-born German politician who was the leader of the Nazi Party (NSDAP), Chancellor of Germany from 1933 to 1945, and Fuhrer ("leader") of Nazi Germany from 1933 to 1945. As effective dictator of Nazi Germany, Hitler was at the centre of World War II in Europe and the Holocaust. 
74	2020-04-28 09:19:13.098122	2020-04-28 09:19:13.098122	Herodotus	\N	\N	\N	1	\N	484	\N	1	\N	425	62	Known as the 'Father of History' he was born in Halicarnassus, Caria (modern-day Bodrum, Turkey). When it came to history he was the first to treat history as an investigation vs. the more traditional history of Homeric quality as narrative.
75	2020-04-28 09:22:46.520013	2020-04-28 09:22:46.520013	Plato	\N	\N	\N	1	\N	424	\N	1	\N	348	62	Greek philosopher.
76	2020-04-28 09:23:42.510187	2020-04-28 09:23:42.510187	Aristotle	\N	\N	\N	1	\N	385	\N	1	\N	323	62	Greek philosopher.
77	2020-04-28 09:24:18.451087	2020-04-28 09:24:18.451087	Socrates	\N	\N	\N	1	\N	470	\N	1	\N	399	62	Greek philosopher
78	2020-05-09 21:12:09.653469	2020-05-09 21:24:37.903246	Constantine	\N	\N	\N	2	\N	274	\N	2	\N	337	70	Known as 'Constantine the Great', he is most notable for having brought the Roman empire under Christian theology. Having seen a sign of God the Roman emperor brought Christianity into a new historical realm by making it the official religion of the greatest and largest empire of its time.
79	2020-05-16 20:17:33.36649	2020-05-16 20:17:33.36649	Antoni 	Van 	Leeuwenhoek	\N	2	\N	1632	\N	2	\N	1723	70	He developed a lens for scientific purposes and was the first to observe bacteria, protozoa, and yeast. He accurately described red blood cells, capillaries, striated muscle fibers, spermatozoa, and the crystalline lens of the eye.
80	2020-05-16 20:30:52.249012	2020-05-16 20:30:52.249012	Blaise	\N	Pascal	\N	2	\N	1623	\N	2	\N	1662	70	French mathematician, physicist, and religious philosopher. He founded the theory of probabilities, but is best known for deriving the principle that the pressure of a fluid at rest is transmitted equally in all directions.
81	2020-05-18 10:42:13.339525	2020-05-18 10:42:13.339525	Thomas 	\N	Hobbes	\N	2	\N	1588	\N	2	\N	1679	70	A modern Epicurean whose most famous treatise (The Leviathan) made the argument against the Christian political complex, arguing that divine laws had little to do with politics. Instead it was the Leviathan or civilization whose humanist code of laws prevented societal collapse.
82	2020-05-18 22:02:45.968592	2020-05-18 22:02:45.968592	Otto	Von	Bismarck	\N	2	\N	1815	\N	2	\N	1898	60	Prussian minister and German statesman, Chancellor of the German Empire 1871-90; known as the Iron Chancellor. He was the driving force behind the unification of Germany, orchestrating wars with Denmark (1864), Austria (1866), and France (1870-1) in order to achieve this end.
83	2020-05-19 22:31:34.434298	2020-05-19 22:31:34.434298	John	\N	Locke	\N	2	\N	1632	\N	2	\N	1704	70	An English philosopher and founder of empiricism and political liberalism. His "Two Treatises of Government" argues that the authority of rulers has a human origin and is limited. In "An Essay Concerning Human Understanding" he argued that all knowledge is derived from sense-experience.
84	2020-05-19 22:36:42.683196	2020-05-19 22:36:42.683196	David 	\N	Hume	\N	2	\N	1711	\N	2	\N	1776	70	Scottish philosopher, economist, and historian. He rejected the possibility of certainty in knowledge. Notable works include "A Treatise of Human Nature" (1739 - 1740) and "History of England" (1754 - 1762).
85	2020-05-19 22:56:09.271787	2020-05-19 22:56:09.271787	Baruch	\N	Spinoza	\N	2	\N	1632	\N	2	\N	1677	70	Dutch philosopher. Spinoza espoused a pantheistic system, seeing "God or nature" as a single infinite substance, with mind and matter being two incommensurable ways of conceiving the one reality.
86	2020-05-19 22:58:42.2735	2020-05-19 22:58:42.2735	Charles	\N	Montesquieu	\N	2	\N	1689	\N	2	\N	1755	70	French political philosopher. He is best known for "L'Esprit des lois" (1748), a comparative study of political systems in which he championed the separation of judicial, legislative, and executive powers as being most conducive to individual liberty.
87	2020-05-19 23:00:30.75215	2020-05-19 23:00:30.75215	Alexis	de	Tocqueville	\N	2	\N	1805	\N	2	\N	1859	70	French politician and historian. He is best known for his classic work of political analysis, "Democracy in America" (1835 - 1840), which he wrote after a visit to the U.S. to study the American penal system.
88	2020-05-22 21:51:17.26065	2020-05-22 21:51:17.26065	Jean	Jacques	Rousseau	\N	2	\N	1712	\N	2	\N	1778	70	French philosopher and writer, born in Switzerland. He believed that civilization warps the fundamental goodness of human nature, but that the ill effects can be moderated by active participation in democratic and consensual politics.
89	2020-05-22 21:54:32.843931	2020-05-22 21:54:32.843931	Immanuel	\N	Kant	\N	2	\N	1724	\N	2	\N	1804	\N	German philosopher. In the "Critique of Pure Reason" (1781) he countered Hume's skeptical empiricism by arguing that any affirmation or denial regarding the ultimate nature of reality ("noumenon") makes no sense. His "Critique of Practical Reason" (1788) affirms the existence of an absolute moral law -- the categorical imperative.
90	2020-06-06 21:42:08.576058	2020-06-07 09:23:35.705573	Bennito	\N	Mussolini	\N	2	\N	1883	\N	2	\N	1945	\N	(Amilcare Andrea) Italian Fascist statesman, Prime Minister 1922-43; Known as Il Duce ("The leader"). He founded the Italian Fascist Party in 1919. He annexed Abyssinia in 1936 and entered the Second World War on Germany's side in 1940.
91	2020-06-07 09:32:38.186915	2020-06-07 09:33:05.204927	Franco	\N	General	\N	2	\N	1892	\N	2	\N	1975	60	Spanish general and statesman, head of state 1939-75. Leader of the Nationalists in the Civil War, in 1937 Franco became head of the Falange Party and proclaimed himself Caudillo ("Leader") of Spain. With the defeat of the republic in 1939, he took control of the government and established a dictatorship that rules Spain until his death.
92	2020-06-22 22:11:30.094384	2020-06-22 22:11:30.094384	Georg	Wilhelm Friedrich	Hegel	\N	2	\N	1770	\N	2	\N	1831	70	A German philosopher.
93	2020-06-25 22:15:45.612116	2020-06-25 22:15:45.612116	Friedrich	Wilhelm	Nietzsche	\N	2	\N	1844	\N	2	\N	1900	70	German philosopher. He is known for repudiating Christianity's compassion for the weak, exalting the "will to power", and formulating the idea of the superman, who can rise above the restrictions of ordinary morality.
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.person_id_seq', 94, true);


--
-- Data for Name: person_note; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.person_note (id, created, modified, note, person_fk) FROM stdin;
1	2020-03-24 09:39:13.512587	2020-03-24 09:39:13.512587	This is the third note.	45
6	2020-03-24 10:38:08.409603	2020-03-24 10:38:08.409603	He was a modernist, a rare cleric who had studied not only in religious seminaries but also on the benches of a secular institution, obtaining a degree in political science from Tehran University.	57
7	2020-03-24 10:38:45.735497	2020-03-24 10:38:45.735497	He had family ties extending across borders and ethnicities, blurring the lines between Arab, Turk, and Persian. The holy city of Najaf in Iraq was the hub where all ties converged. Sadr crossed boundaries of the mind too, opening worlds onto one another. In Tyre, he bought ice cream from a Christian whose business was suffering because his Shia neighbors believed anything made by non-Muslims was unclean. Christian women swooned over him, and though clerics were not supposed to shake hands with women, he occasionally made an exception out of politeness. He taught at Sunni schools, gave classes in Islamic philosophy at the St. Joseph University in Beirut, and prayed in churches all over the country. The imagery was striking as he stood behind the altar, beneath Jesus on a crucifix, facing a full church with his black turban denoting lineage traced back to the prophet Muhammad. He understood his different audiences. He spoke with melancholy to the priests and nuns and the flock gathered in a church, paying homage to Christ as an apostle of the oppressed; he thundered in Baalbek to the men with guns, rousing them from their sorrow with imagery of Imam Hussein, son of Ali and Fatima, grandson of the prophet, killed in battle in Karbala in the year 680.	57
8	2020-03-24 19:59:39.541417	2020-03-24 19:59:39.541417	Consider one of the "Little Stalins" that followed Stalin's policies without ever challenging his views or power. 	61
9	2020-03-24 20:08:02.696023	2020-03-24 20:08:02.696023	Viewed as a unifying symbol, his internal policies maintained the peaceful coexistence of the nations of the Yugoslav federation.	62
10	2020-03-24 20:09:17.435319	2020-03-24 20:09:17.435319	While his presidency has been criticized as authoritarian, Tito was "seen by most as a benevolent dictator" due to his economic and diplomatic policies.	62
11	2020-03-24 20:44:35.705032	2020-03-24 20:44:35.705032	John Gunther, an American journalist, described Rakosi as "the most malevolent character I evet met in political life."	64
12	2020-03-24 20:47:42.956015	2020-03-24 20:47:42.956015	One of the "Little Stalins"	65
13	2020-04-01 20:08:57.696878	2020-04-01 20:08:57.696878	Shah Pahlavi took the title "King of Kings" on 26 October 1967. He had several other titles including "Light of the Aryans" and "Commander-In-Chief".	67
14	2020-04-01 20:11:25.452542	2020-04-01 20:11:25.452542	The rule of House of Pahlavi began when his father Reza Shah Pahlavi abdicated the throne during an Anglo-Soviet invasion during WWII in 1941.	67
15	2020-04-06 18:35:11.472738	2020-04-06 18:35:11.472738	It was during her reign that Egypt saw interactions not only with the Aegean but also with other areas of ancient Near East. She started the Eighteenth dynasty on its road to international contacts and global prestige, using diplomacy rather than war.	69
16	2020-04-06 18:35:39.883536	2020-04-06 18:35:39.883536	She was full royal blood. The daughter of Pharaoh Thutmose I and Queen Ahmose.	69
17	2020-04-06 18:38:25.53773	2020-04-06 18:38:25.53773	She reigned for about 22 years. She originally stepped in to reign because the next heir in line was Thutmose III, but was too young at the time to take the throne when his father Thutmose II (husband of Hatshepsut) died unexpectedly. However, when the time came to hand over the throne she refused. Thutmose III waited patiently in the background for his turn to the throne.	69
18	2020-04-06 18:40:58.93872	2020-04-06 18:40:58.93872	During her reign she began to wear the false beard of the Pharaoh, men's clothing with body armor. She also changed her name, giving it a masculine rather than a feminine ending. She became "His Majesty, Hatshepsu".	69
19	2020-04-06 18:44:11.935069	2020-04-06 18:44:11.935069	She is considered one of the most illustrious women from ancient egypt along with Nefertiti and Cleopatra.  She is also considered the first great woman in history of whom we are informed.	69
20	2020-04-06 18:52:07.231452	2020-04-06 18:52:07.231452	Archaeologists believe they have found the mummy of Hatshepsut. If the mummy they have found is indeed her, then it appears she suffered and probably died in her old age of obesity, dental problems, and cancer.	69
21	2020-04-08 17:15:00.440354	2020-04-08 17:15:00.440354	The only indication of her appearance occurs from her followers. So assuming her countenance would have been beautiful to them we should take the following description with a grain of salt. In that description she has light chestnut hair, a fair complexion and blue eyes. She was a little below average height, with a stocky, 'rather thick' build.	70
22	2020-04-08 20:29:31.477384	2020-04-08 20:29:31.477384	Hitler was a decorated veteran of World War I. 	71
23	2020-04-08 20:30:40.745511	2020-04-08 20:30:40.745511	He joined the precursor of the NSDAP, the German Workers' Party, in 1919 and became leader of the NSDAP in 1921.	71
25	2020-04-08 20:33:09.776785	2020-04-08 20:33:09.776785	In 1923 he attempted a coup in Munich to seize power. The failed coup resulted in Hitler's imprisonment, during which time he wrote his autobiography and political manifesto Mein Kampf ("My Struggle").	71
26	2020-04-08 20:34:43.948785	2020-04-08 20:34:43.948785	After his release in 1924, he gained popular support by attacking the Treaty of Versailles and promoting Pan-Germanism, anti-Semitism, and anti-communism with charismatic oratory and Nazi propaganda.	71
27	2020-04-08 20:35:40.718475	2020-04-08 20:35:40.718475	Hitler frequently denounced international capitalism and communism as being part of a Jewish conspiracy.	71
28	2020-04-08 20:36:51.276674	2020-04-08 20:36:51.276674	Hitler's Nazi Party became the largest elected party in the German Reichstag, leading to his appointment as chancellor in 1933.	71
29	2020-05-16 20:35:38.781728	2020-05-16 20:35:38.781728	Pascal, though deep in mathematics and the emerging sciences of the day was not a supporter of rational theology. In his mind, God to the rational theologian was nothing more than an idol. Pascal did not try to rationalize Christianity with the sciences, but instead they simply stood separate. He felt the scientific revolution was "to be welcomed as a liberation of God from the chains of natural philosophy.	80
\.


--
-- Name: person_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.person_note_id_seq', 29, true);


--
-- Data for Name: person_tag; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.person_tag (id, created, modified, person_fk, tag_fk) FROM stdin;
1	2020-03-13 18:47:19.72827	2020-03-13 18:47:19.72827	30	2
\.


--
-- Name: person_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.person_tag_id_seq', 1, true);


--
-- Data for Name: reference; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.reference (id, created, modified, title, published_day, published_era_fk, published_month_fk, published_year, sub_title) FROM stdin;
52	2020-02-12 18:38:28.238781	2020-02-12 18:56:33.476288	Gulag	\N	2	\N	2003	A History
48	2020-02-06 09:24:20.307092	2020-02-12 18:56:46.613799	History of the World	\N	2	\N	2018	Map by Map
55	2020-02-12 18:51:18.815232	2020-02-12 18:57:24.95727	Red Famine	\N	2	\N	2017	Stalin's War On Ukraine
54	2020-02-12 18:50:11.495517	2020-02-12 18:57:50.497013	Iron Curtain	\N	2	\N	2012	The Crushing of Eastern Europe 1944 - 1956
53	2020-02-12 18:40:17.845585	2020-02-12 18:58:01.082845	Salt	\N	2	\N	2002	A World History
56	2020-03-05 14:25:18.400446	2020-03-06 10:24:48.716798	The Black Wave	\N	2	1	2020	Saudi Arabia, Iran, And The Forty-Year Rivalry That Unraveled Culture, Religion, And Collective Memory In The Middle East
57	2020-03-11 16:44:32.861765	2020-03-11 16:44:32.861765	Wikipedia	\N	2	\N	2018	\N
58	2020-03-14 17:07:23.248067	2020-03-14 17:07:23.248067	Civilization	\N	2	\N	2011	The West And The Rest
60	2020-03-18 20:26:52.243298	2020-03-18 20:26:52.243298	Oxford Dictionary	\N	2	\N	2020	of English
61	2020-03-22 16:16:38.310194	2020-03-22 16:16:38.310194	Common Knowledge	\N	2	\N	2018	\N
63	2020-04-08 16:47:57.236228	2020-04-08 16:47:57.236228	Ann The Word	\N	2	\N	2000	\N
49	2020-02-06 10:38:22.471213	2020-04-19 09:00:45.1285	A Deep History of Ourselves	\N	2	\N	2019	The Four-Billion-Year Story of How We Got Conscious Brains
62	2020-04-06 14:00:12.578375	2020-04-23 16:18:45.184685	1177 B.C.	\N	2	\N	2014	The Year Civilization Collapsed
64	2020-04-28 20:55:48.984806	2020-04-28 20:55:48.984806	A New World Begins	\N	2	\N	2019	The History Of The French Revolution
65	2020-04-28 20:57:19.883574	2020-04-28 20:57:19.883574	Assad or We Burn the Country	\N	2	\N	2019	How One Family's Lust for Power Destroyed Syria
66	2020-04-28 20:59:07.343566	2020-04-28 20:59:07.343566	The Rising Sun	\N	2	\N	1970	The Decline and Fall of the Japanese Empire, 1936 - 1945
67	2020-04-28 21:04:24.94901	2020-04-28 21:04:24.94901	Guns, Germs, and Steel	\N	2	\N	1997	The Fates of Human Societies
68	2020-04-28 21:05:47.947715	2020-04-28 21:05:47.947715	Collapse	\N	2	\N	2005	How Societies Choose to Fail or Succeed
69	2020-04-28 21:10:25.382422	2020-04-28 21:10:25.382422	The Way of the Strangers	\N	2	\N	2016	Encounters with the Islamic State
70	2020-04-28 21:11:59.679927	2020-04-28 21:11:59.679927	The Stillborn God	\N	2	\N	2007	Religion, Politics, and the Modern West
71	2020-04-28 21:13:58.495479	2020-04-28 21:13:58.495479	The Once and Future Liberal	\N	2	\N	2017	After Identity Politics
72	2020-04-28 21:15:53.377431	2020-04-28 21:15:53.377431	The Evangelicals	\N	2	\N	2017	The Struggle To Shape America
73	2020-04-28 21:17:21.876836	2020-04-28 21:17:21.876836	The Reckless Mind	\N	2	\N	2001	Intellectuals in Politics
74	2020-05-18 21:59:33.243692	2020-05-18 21:59:33.243692	The Coming of the Third Reich	\N	2	\N	2010	\N
75	2020-06-27 19:00:55.532862	2020-06-27 19:00:55.532862	Ausgewahlte Schriften	\N	2	\N	1968	\N
\.


--
-- Data for Name: reference_author; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.reference_author (id, created, modified, author_fk, reference_fk) FROM stdin;
57	2020-02-06 09:35:16.033137	2020-02-06 09:35:16.033137	15	48
62	2020-02-12 18:40:46.610646	2020-02-12 18:40:46.610646	22	53
63	2020-02-12 18:50:26.912088	2020-02-12 18:50:26.912088	18	54
64	2020-02-12 18:51:24.247677	2020-02-12 18:51:24.247677	18	55
66	2020-02-13 21:51:43.541979	2020-02-13 21:51:43.541979	18	52
68	2020-03-06 10:24:56.265383	2020-03-06 10:24:56.265383	23	56
69	2020-03-14 17:07:47.7862	2020-03-14 17:07:47.7862	24	58
70	2020-04-06 14:00:20.11342	2020-04-06 14:00:20.11342	25	62
71	2020-04-08 16:48:21.331692	2020-04-08 16:48:21.331692	26	63
72	2020-04-19 09:00:32.068079	2020-04-19 09:00:32.068079	16	49
73	2020-04-28 20:59:21.787457	2020-04-28 20:59:21.787457	29	66
74	2020-04-28 20:59:37.317685	2020-04-28 20:59:37.317685	28	65
75	2020-04-28 20:59:59.37845	2020-04-28 20:59:59.37845	30	64
76	2020-04-28 21:06:01.825532	2020-04-28 21:06:01.825532	27	67
77	2020-04-28 21:06:06.74724	2020-04-28 21:06:06.74724	27	68
78	2020-04-28 21:10:33.659795	2020-04-28 21:10:33.659795	31	69
80	2020-04-28 21:15:59.660462	2020-04-28 21:15:59.660462	32	72
81	2020-04-28 21:17:27.795911	2020-04-28 21:17:27.795911	21	73
82	2020-05-15 13:15:10.139926	2020-05-15 13:15:10.139926	21	70
83	2020-06-27 18:51:17.003271	2020-06-27 18:51:17.003271	34	74
84	2020-06-27 19:01:34.243527	2020-06-27 19:01:34.243527	35	75
\.


--
-- Name: reference_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.reference_author_id_seq', 84, true);


--
-- Name: reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.reference_id_seq', 75, true);


--
-- Data for Name: reference_note; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.reference_note (id, created, modified, note, chapter, page, reference_fk) FROM stdin;
7	2020-04-23 17:18:57.400946	2020-04-23 17:18:57.400946	As early as the 13th century BC Kings were exempting the wealthy from paying taxes. A wealthy Ugaritic merchant whose name was Sinaranu was exempted from taxes by the King of Ugarit Ammistamru II. The recovered text reads "From the present day Ammistamru, son of Niqmepa, King of Ugarit, exempts Sinaranu, son of Siginu ... His grain, his  beer, his olive oil to the palace he shall not deliver. His ship is exempt when it arrives from Crete.	Chapter 3	79	62
8	2020-04-23 17:31:18.551574	2020-04-23 17:31:18.551574	As far back (or possibly further) than the 15th century BC evidence shows the beginnings of international diplomacy and trade. For example a grand palace was built in 1477 in Egypt. The interesting thing about the  palace is the Minoan frescoes painted on it as part of the original construction. Minoans would have either had to travel to Egypt to create the frescoes or the Egyptian artists would have had to somehow known about both frescoes and the Minoan art style. Either way it's a clear indication of knowledge traveling very long distances.	Chapter 1	14	62
9	2020-04-23 19:21:36.539142	2020-04-23 19:21:36.539142	Interesting note about the word 'sesame'. 12th century Mycenaean tablets record imports of sesame seeds. Not having a word for them in the linear B language at the time they picked it up from the culture languages from which they were being imported. In Linear B the word is sa-sa-ma, which appears to be coming from the Ugaritic word ssmn, the Akkadian word sammassammu, and the Hurrian word sumisumi.	Chapter 3	88	62
10	2020-04-25 19:18:34.198801	2020-04-25 19:18:34.198801	Excavations of certain sites along the Mediterranean suggest that it's possible that the "Sea Peoples" had sailed into this area during the time of 1205 to 1185 BC. Some 7 to 28 years prior to the 2nd wave invasion recorded by Ramses III in 1177 BC. In this case though they seem to have settled in the cities in which they sailed to and integrated with the local populations. This would mean that the destruction of these areas by the Sea Peoples in 1177 BC would have also impacted their own people who had migrated there in the years prior.	Chapter 4	114	62
11	2020-04-25 19:32:05.134383	2020-04-25 19:32:05.134383	A 'Tell' is a location that has been rebuilt so many times it appears to sit on top of a hill. This is not a geographical hill however, but a rising as a consequence of having a place built on top of a previously destroyed place repeatedly. And example is the city of Megiddo in modern-day Israel. This is also the location of the Biblical Armageddon. Around 20 cities here have been found layered one on top of the other. The Book Of Revelations indicates that Armageddon would be on top of a mountain or hill. This referring to the place of Megiddo, and seeing it as a geographical feature, but in reality it's a man-made hill.	Chapter 4	114	62
17	2020-04-28 19:18:02.792384	2020-04-28 19:18:02.792384	The "Sea Peoples" often take the blame for the collapse of civilizations in the late to mid-12th century BC. However, this is likely just not the case. Evidence suggests that in many cases the migrants simply settled down and assimilated into the cities in which they found themselves. In fact in many cases evidence suggests that these migrants were not at all raiding warriors bent on destruction. The big question is whether or not they were migrating due to issues at the origin, or if they were just taking advantage of the already collapsing empires to start a new and hopefully better life.	Chapter 5	150	62
12	2020-04-28 08:47:28.47608	2020-05-17 09:52:57.460114	<h2>Possible Causes of Collapse</h2><ul><li><h4>Earthquakes&nbsp;</h4></li></ul><p style="margin-left: 20px;">Archaeoseismologiests have shown that there was apparently a series of earthquakes in the Aegean/Mediterranean area beginning about 1225 BC and lasting until about 1175 BC. While there is much evidence of earthquake damage and destruction at sites during this time period there is also evidence of rebuilding and reoccupation. It would also seem that earthquakes alone would not be enough to destroy a civilization. Likely a setback, but not a silver bullet of collapse.</p><p><br></p><ul><li><h4>Climate Change</h4></li></ul><p style="margin-left: 20px;">There is abundant evidence supporting climate change, particularly drought, in the eastern Mediterranean between around 1250 BC and 1100 BC. Historical documentation between civilizations indicate famine in the Hittite empire, Ugarit, Cyprus, and Syria. Drought may have also been present elsewhere in the Levant and into Egypt at times. Other evidence such as pollen analysis supports the theory as well. That said, drought was recorded at many times previous to this time period and certainly in times afterwards. And yet climate change does not always lead to the collapse of the civilization. So while climate change most certainly appears to have played a role, it cannot be blamed solely.</p><p style="margin-left: 20px;"><br></p><ul><li><h4>Internal Rebellion</h4></li></ul><p style="margin-left: 20px;">While it&#39;s likely that internal rebellion would have occurred to some extent given that it&#39;s possible earthquakes, famines, droughts, and changes in international trade between civilizations were likely taking place, this alone is not nearly sufficient to explain the collapse of multiple large and powerful empires. Internal rebellions rarely lead to the collapse of a civilization, but usually to a major change in that civilization.</p><p style="margin-left: 20px;"><br></p><ul><li><h4>Trade</h4></li></ul><p style="margin-left: 20px;">There is some amount of evidence, particularly from the city of Ugarit, that maritime marauders were causing issues at sea. It&#39;s not known the origins or these marauders, but letters found do indicate they were there and problematic. Since the sea was a primary trade route, and the city of Ugarit was heavily dependent on trade (particularly for copper and tin, primary ingredients in the creation of bronze), it&#39;s maybe safe to say that these ships at sea were disrupting the trade routes to and from the city. That said, Ugarit appears to be an exception as many trade routes through the late Bronze Age appear to have been without disruption. In fact Ugarit itself appears to have had a lively international trade right up to the end. So while probable, nothing conclusive about trade disruption being a source of the collapse of the larger civilizations.</p><p style="margin-left: 20px;"><br></p><ul><li><h4>Decentralization and Private Merchants</h4></li></ul><p style="margin-left: 20px;">This is an idea more recently proposed. While it&#39;s clear that the palatial systems of economics fell during the late Bronze Age collapse, it&#39;s not clear whether this fall of centralization was the cause of the overall collapse of the civilization, or whether decentralization grew out of the collapse itself. Most likely it, like all the other alternatives is not solely responsible. Although in this particular case the argument can be made that the rise of small kingdoms and entrepreneurship was more of a product of the collapse than the cause itself.</p><p style="margin-left: 20px;"><br></p><ul><li><h4>Systems Collapse</h4></li></ul><p style="margin-left: 20px;">Another possibility that seems to be supported by the evidence is a systemic collapse. This is more entwined with the other possible reasons for collapse. That is to say that no single possibility - be it earthquakes, immigrations, internal rebellions, trade route disruptions, etc - would have been able to cause a single civilization to collapse much less most all of them. Instead, a more complex, but more likely proposal is a sort of domino effect where one event led to another event and to another. Spiraling out of control. Things got worse until the systems in place could no longer stand. This would indicate that these civilizations fell over a long period of time instead of the single invasion of a &#39;Sea People&#39; event that many like to hold as the reason for collapse.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	Chapter 5	140	62
19	2020-04-28 19:34:23.563609	2020-04-28 19:34:23.563609	Two things to note about the collapse itself. Each civilization was greatly centralized through the palatial system. That is the palace and the elites controlled all aspects of life. The second thing of note, is that these civilizations were not just in contact with one another, but highly invested and dependent upon trade with the others. If one civilization palatial system were to collapse it would take down the entirety of the empire with it due to the reliance of everything on it. And if that empire were to collapse it could have a ripple effect on the empires on which were dependent on trade with the collapsed empire. If this were to bring down their palatial system the cycle would continue until all palatial systems within the trade network were collapsed. Of note, Jared Diamond discusses this in his book Collapse concerning how trade can take down a series of otherwise independent cultures.	Chapter 5	165	62
20	2020-05-08 19:27:35.196152	2020-05-08 19:27:35.196152	Looking at the modern west we see politics as something separate from religion. However, as unthinkable as the alternative may seem to us, historically we're the group that is currently experimenting with something other than political theology. This experiment has been going on just long enough at this point that those of us under it have almost forgotten the "age-old human quest to bring the whole of human life under God's authority.	Introduction	5	70
21	2020-05-08 19:45:34.415802	2020-05-08 19:45:34.415802	Political theology was the view of politics through the lenses of religion and the supernatural. Perhaps a monarch ordained by God himself for example. Modern western politics is an experiment of viewing politics as something wholly of human nature alone.	Introduction	3	70
22	2020-05-08 20:18:17.795098	2020-05-08 20:18:17.795098	Politics is a dispute over authority. Who may legitimately exercise power over others, to what ends, and under what conditions.	1: The Crisis	22	70
23	2020-05-08 20:27:10.110891	2020-05-08 20:27:10.110891	This is a test note.	\N	\N	52
24	2020-05-08 20:32:57.90459	2020-05-08 20:32:57.90459	A religion whose god is authoritative may be more likely to find itself in the realm of politics. Jesus, referred to as "King" makes it easier for the actual king and the subjects to tell themselves the story that his authority is mandated by the authoritative God. That is the theology translates nicely to the political realm. A passive god, however, may not translate well into politics as the story of a passive god may not have much to contribute to politics itself. So not all religions and theologies become political theologies.	\N	\N	70
25	2020-05-09 20:04:29.229963	2020-05-09 20:04:29.229963	Historically there are three views of God. The first is the god of pantheism. The god that embodies everything. In this view god is here on earth not only mingling with us humans, but is the essence of all things. Second is the distant god. This is the creator god who walks away afterwards and becomes inaccessible to its own creation. Lastly is the transcendent god. This is most popularly the god of the Hebrews, the  Christians, and the Muslims. This god is one who is not necessarily present, but is also not absent. It resides in some type of space like heaven. From this space it is not instantly reachable, but also not beyond reach.	1: The Crisis	26	70
26	2020-05-16 19:56:27.880873	2020-05-16 20:11:34.646878	<p>Christianity is somewhat unique from other major religions. Judaism is based on the Torah and it&#39;s laws. These laws are divine in nature. Islam is much the same being based on Shari&#39;a or Islamic Law. But Christianity left those who follow it with little more than the &quot;laws of the heart&quot; which are vague at best leaving them open to much interpretation.</p><p><br></p><p>To some extent this vagueness in law would have contributed to the ability for political thinkers to drop cosmology and theology from any discussion of politics. The lack of law in Christendom played a part in why it was able to so easily separate itself from politics in general.&nbsp;</p><p><br></p><p>Do the reemergences of Christian theology in modern politics in the last 30 or 40 years show signs of attempting to apply hard law to Christian theology? If so where do the laws come from since there is no book of laws per se. Are they trying to consolidate a single interpretation as if it applies across the board. Is Christianity more prone to extreme fundamentalism due to the vagueness of its own laws?</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	2. The Great Separation	55	70
37	2020-06-06 16:30:12.769646	2020-06-06 16:32:59.662058	<p><span style="font-size: 18px;"><strong>Science</strong></span></p><ul><li>Social Darwinism emphasized not peaceful evolution but the struggle of survival. Antropologist Ludwing Woltmann argued in 1900 that the Aryan or German race represented the height of human evolution and was thus superior to all races. he claimed the &quot;Germanic race has been selected to dominate the earth&quot;. (<em style="margin: 0px; text-decoration: none; box-sizing: border-box; color: rgb(65, 65, 65); font-family: sans-serif; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Gospels of Hate, pg 34)</em></li><li>Racial hygiene was born of a new drive for society to be governed by scientific principles irrespective of all considerations. <em>(Gospels of Hate, pg 38)</em></li></ul><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	74
29	2020-05-22 22:10:56.163878	2020-05-23 16:39:09.563797	<p>For the majority of human history politics has revolved around the &quot;divine nexus&quot; between god, nature and humans. This changed when Thomas Hobbes published &quot;Leviathan&quot;. For the first time questions were being asked not about the role of humans in a divine realm of nature, but instead the role of religion in human existence. David Hume and John Locke expanded upon the works of Hobbes, although not from the Epicurean point of view where all religions and religious experience originate from the fear of suffering. Instead they saw the necessity of religion for reasons beyond the fear of suffering. As such their works include religion, or at least the toleration of it, with the assumption that as we become more involved in the political and individual nature of our lives, the divine would simply be forgotten. This however, came with its own sets of problems. Later enlightenment philosopher Jean Jacques Rousseau would question the nature of the role of religion in human lives. Lila defines him not so much as an &quot;anti-modern&quot; but more as a &quot;disappointed modern&quot;. Immanuel Kant was the one, influenced by Rousseau, who took these problems and contradictions rising by this new anthropological view of religion and began to address them systematically developing finally the &quot;moral imperative&quot; or an absolute morality. This move between the political theology and an anthropology of religion Lila calls &quot;The Great Separation&quot;.</p><p><br></p><p>Rousseau threw another wrench into the role of religion in politics. Hobbes denied religion calling it the &quot;Kingdom of Darkness&quot;. The religious institutions and theological defenders could deal with this however. They knew that most people would still choose the morality of the church over that of the defiant and godless atheism espoused by Hobbes. Rousseau added a new layer of complexity to this debate. In <em>Emile</em> he lays out one of his very few views on religion. Here he offers the perspective that humans are by nature good, and this inherently human goodness is simply reflected in the goodness of religion. This may sound fine to us today, but the clergy hunted Rousseau for this. Their appeal to divine revelation was the last weapon they had and suddenly Rousseau has explained it away.</p><p><br></p><p>He may have been somewhat of a defender of religion, but not as a theologian. Like the other philosophers of his time he viewed religion through an anthropological lens. He simply disagreed that the world was better off without religion. He did reject dogma and revelation, instead advocating for the more intrinsic qualities like virtue and goodness. While he may have taken a very different approach he still laid out a path towards a political structure disconnected from religion and theology.&nbsp;</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	70
28	2020-05-18 10:56:04.695518	2020-05-24 21:17:30.435169	<p>In the 17th century there began a change of thought as a reaction to the Stoicism of the Renaissance. This previous genial picture painted of religion by the Stoics where there were the underlying good seeds that all religions shared began to be viewed quite differently in light of the obvious darkness exhibited by these same religions during the drawn out and violent wars between Catholics and Protestants in Europe. The most influential writer providing voice to explanations about these darker sides of religions was Thomas Hobbes.</p><p><br></p><p>Hobbes was a modern Epicurean. Lila explains the difference between the ancient and modern epicureans as such.</p><p><br></p><h3>Ancient Epicureanism</h3><p><em>Rested on a number of philosophical doctrines regarding human nature and the cosmos, but essentially it was a spiritual exercise developed to make possible a happy private life. The Epicureans saw the human mind beset by fears and ignorance that disturbed the sould and made us suffer needlessly during our short sojourn on earth. To cope with that suffering men invented gods -- which only made matters worse, since superstition increases our terror before the unknown rather than relieving it. Epicureans considered themselves to be the great unmaskers, teaching that if there are gods, they did not create the world for our benefit, that the cosmos is nothing but a blind concourse of atoms, that the soul is not immortal.It was a terrifying doctrine, one would think, but one from which the Epicureans drew solace. By confronting death without blinking, they thought, men could resign themselves to it and focus on the pleasures of private life rather than losing themselves in the vain pursuit of immortality.</em></p><p><br></p><h3>Modern Epicureanism</h3><p><em>First developed in seventeenth-century Europe, revived this ancient picture of man and nature but employed it for the first time to a political end. That end was the dismantling of Christendom&#39;s theological-political complex. The Stoics&#39; portrayal of man, his fellow-feeling, the divine seed in his soul, could plausibly be made compatible with a Christian view of man. Modern Epicureanism could not: its strictly materialist anthropology was anti-Christian on its face.</em></p><p><br></p><p>Hobbes is the first to take a really humanist approach to the subject of Christian political theology. While other thinkers and refuters of Christian political theology would usually find themselves mired in deep pits of confusion rendering any argument irrelevant, Hobbes changed the subject entirely. For him, he changes the deepest principle of political theology (the divine nexus between god, man, and nature). For those before him (both the professors and refuters of Christian political theology) the underlying approach was always premised on God and his nature and man&#39;s role within that nature. Hobbes, however simply assumed his entire argument more simply through an anthropological lens of man and his religious nature.</p><p><br></p><p>His primary treatise The <em>Leviathan</em> laid out this new and novel argument reducing religion to a human condition. It probably sounds obvious or completely self explanatory to us today, but the fact that it does we owe to Hobbes. The impact he had was enormous. Something as simple as the study of theology as an academic discipline owes its existence to Hobbes. Other examples being the sociology of religion, anthropology of religion, religious studies, etc. Each of these perceives its source material, religion, as a condition of humanity and not as some truth or divine will.</p><p><br></p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	2. The Great Separation	74	70
30	2020-05-24 21:31:57.353588	2020-05-24 21:31:57.353588	<p>Emanuele Kant argued about reason that it cannot exceed &quot;the fixed bounds of possible experience&quot;. Lila explains this as we may know a bush is burning, and we may think that God set it on fire. However, what we cannot know is that there is a connection between the burning bush and God itself. He called this transcendental illusion. It is viewing an idea as a physical presence. The major implication of this thinking is that it tore down the logic upon which divine revelation rested. Viewing the world through this Kantian view, revelation of any sort would simply be impossible.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	3. The Ethical God	137	70
31	2020-05-25 22:21:35.958398	2020-05-25 22:26:00.329036	<p><span style="font-size: 18px;"><strong>Perception of Jews</strong></span></p><p><br></p><ul><li>Jews where associated above all with the most modern progressive developments in society, culture, and the economy.</li></ul><p><br></p><ul><li>For the disaffected and the unsuccessful, those who felt pushed aside by the Juggernaut of industrialization and yearned for a simple, more ordered, more secure, more hierarchical society such as they imagined had existed in the not-too-distant past, the Jews symbolized cultural, financial, and social modernity.</li></ul><p><br></p><ul><li>In their incomprehension of the wider forces that were destroying their livelihood, the most severely affected found it easy to believe the claims of Catholic and conservative journalists that Jewish financiers were to blame.</li></ul><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	Gospels of Hate	24	74
36	2020-06-06 16:27:46.976582	2020-06-06 16:27:46.976582	<p><strong><span style="font-size: 18px;">Lebensraum</span></strong></p><p>The Germans, in the view of some, needed more &#39;Living-space&#39;, and it would have to be acquired at the expense of others, most likely the Slavs.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	Gospels of Hate	34	74
35	2020-06-06 16:21:04.492253	2020-06-06 20:19:04.383745	<p><strong><span style="font-size: 18px;">Reich</span></strong></p><p><br></p><ul><li>The word &quot;Reich&quot; conjured up an image among educated Germans that resonated far beyond the institutional structures Bismarck created: the successor of the Roman Empire; the vision of God&#39;s Empire here on earth; the universality of its claim to suzerainty.</li></ul><p><br></p><ul><li>The concept of a German state that would include all German speakers in Central Europe -&#39;one People, one Reich, one Leader&#39;, as the Nazi slogan was to put it.&nbsp;</li></ul><p><br></p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	German Peculiarirites	7	74
38	2020-06-06 17:01:19.77511	2020-06-06 17:01:19.77511	<p><strong><span style="font-size: 18px;">Extremism</span></strong></p><ul><li>What transformed the extreme nationalist scene was not the war itself, but the experience of defeat, revolution and armed conflict at the war&#39;s end.</li><li>A powerful role was played by the myth of the &quot;front generation&quot; of 1914-18, soldiers bound together in a spirit of comradeship and self-sacrifice in a heroic cause which overcame all political, regional, social and religious differences.</li></ul><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	74
33	2020-05-25 22:38:47.46697	2020-06-06 20:19:32.564531	<p><strong><span style="font-size: 18px;">War</span></strong></p><p><br></p><ul><li>The Germans, in the view of some, needed more &quot;living space&quot; (the German word was <em>Lebesraum</em>) and it would have to be acquired at the expense of others, most likely the Slavs.</li></ul><p><br></p><ul><li>&quot;Without war, inferior or decaying races would easily choke the growth of healthy budding elements, and a universal decadence would follow&quot; (Gospels of Hate, pg 35)</li></ul><p><br></p><ul><li>Without the war, Nazism would not have emerged as a serious political force, nor would so many Germans have sought so desperately for an authoritarian alternative to the civilian politics that seemed so signally to have failed Germany in its hour of need. (The Spirit of 1914, pg 59)</li></ul><p><br></p><ul><li>Germany failed to make the transition from wartime back to peacetime after 1918. Instead, it remained on a continued war footing; at war with itself, and at war with the rest of the world, as the shock of the Treaty of Versailles united virtually every part of the political spectrum in a grim determination to overthrow its central provisions, restore the lost territories, and end the payment of reparations and re-establish Germany as the dominant power in Central Europe once more. (Descent into Chaos, pg 72)</li></ul><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	Gospels of Hate	35	74
41	2020-06-06 21:23:11.544973	2020-06-06 21:23:11.544973	<p><strong><span style="font-size: 18px;">Violence</span></strong></p><p><br></p><ul><li>National humiliation, the collapse of the Bismarckian Empire, the triumph of Social Democracy, the threat of Communism, all this seemed to some to justify the use of violence and murder to implement the measures which Pan-Germans, antisemites, eugenicists and ultra-nationalists had been advocating since before the turn of the century, if the German nation was ever to recover</li></ul><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	74
40	2020-06-06 20:11:45.943958	2020-06-07 16:42:11.231356	<p><strong><span style="font-size: 18px;">Paramilitary Groups</span></strong></p><p><br></p><ul><li><strong>Steel Helmets (ultra-nationalists) -- &quot;</strong>League of Front Soldiers&quot;. Founded on 13 November 1918 by Franz Seldte. The organization claimed that its main function was a source of financial support for old soldiers fallen on hard times. The organizations 1927 Berlin manifesto declared: &quot;The Steel Helmets proclaim the battle agains all softness and cowardice, which seek to weaken and destroy the consciousness of honor of the German people through renunciation of the right of deference and will to deference&quot;. It denounced the Treaty of Versailles and demanded its abrogation, it wanted the restoration of the black-white-red national flag of the Bismarckian Reich, and it ascribed the economic problems of Germany to &quot;the deficiency in living-space and the territory in which to work&quot;.</li></ul><p><br></p><ul><li><strong>Brownshirts (Nazis) --</strong></li></ul><p><br></p><ul><li><strong>Red Front-Fighters (Communists) -- <span style="color: rgb(65, 65, 65); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Founded in 1924.&nbsp;</span></strong>The term &quot;Red Front&quot; itself was a telling incorporation of a military metaphor into the political struggle.</li></ul><p><br></p><ul><li><strong>Reichsbanner Black-Red-Gold (Social Democrats) --&nbsp;</strong>Founded in 1924, incorporated in its flag the colors of the Repulic in alliance with the far more ambivalent concept of the Reich.</li></ul><p><br></p><ul><li><strong>Free Corps --&nbsp;</strong>Heavily armed paramilitary bands consisting of a mixture of war veterans and younger men. The Social Democrats recruited them in 1918 fearing that the revolutionaries would institute a kind of &quot;red terror&quot; as it was taking place in Russia.</li></ul><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	74
39	2020-06-06 20:01:35.885615	2020-06-07 09:45:32.432447	<p><span style="font-size: 24px;">Politics</span></p><p><br></p><table class="fr-alternate-rows" style="width: 100%;"><thead><tr><th style="text-align: left;">Political Parties</th><th style="text-align: left;">Ideology Inclination</th></tr></thead><tbody><tr><td style="width: 60.5505%;">National Socialist Party (Nazi)</td><td style="width: 39.4495%;">Extreme Right</td></tr><tr><td style="width: 39.4495%;">Fatherland Party</td><td style="width: 39.4495%;">Right</td></tr><tr><td style="width: 60.5505%;">Nationalist Party</td><td style="width: 39.4495%;">Right</td></tr><tr><td style="width: 60.5505%;">People&#39;s Party</td><td style="width: 39.4495%;">Right</td></tr><tr><td style="width: 60.5505%;">Democratic Party</td><td style="width: 39.4495%;">Left</td></tr><tr><td style="width: 60.5505%;">Social Democratic Party</td><td style="width: 39.4495%;">Left</td></tr><tr><td style="width: 60.5505%;">Centre Party</td><td style="width: 39.4495%;">Left</td></tr><tr><td style="width: 60.5505%;">Communist Party</td><td style="width: 39.4495%;">Extreme Left</td></tr></tbody></table><p><br></p><ul><li>Before the War, Germans even or widely differing and bitterly opposed political beliefs had been able to discuss their differences without restoring to violence. After 1918, however, things where entirely different. They degenerated all too often into unseemly shouting matches, with each side showing contempt for the other, and the chair unable to keep order.</li></ul><p><br></p><ul><li>Whole areas of life were completely politicized that in other societies were much freer from ideological identifications. Even choosing to join a male voice choir, he would be looking at which group belong to his political party affilication.</li></ul><p><br></p><p><br></p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	74
42	2020-06-07 10:52:01.253932	2020-06-07 16:39:57.912284	<p><span style="font-size: 24px;">Economics</span></p><p><br></p><p><strong><span style="font-size: 18px;">Debt</span></strong></p><p><br></p><ul><li>The Reich government started to borrow money to pay for the First World War, as soon as this started. From 1916 onwards, expenditure had far exceeded the revenue that the government had been able to raise from loans or indeed from any other source (the idea was to recoup its losses by annexing rich industrial areas to the west and east, by forcing the defeated nations to pay large financial reparations, and by imposing a new German-dominated economic order on conquered Europe).</li></ul><p><br></p><ul><li>The government started to print money without the economic resources to back it.</li></ul><p><br></p><p><strong><span style="font-size: 18px;">Reparation Payments</span></strong></p><ul><li>This was an additional drain on resources. Heavily populated industrial areas in Lorraine and Silesia had been removed under the terms of the Versailles Treaty. Industrial production was only 42% in 1919 of what had been the previous year, and the country was producing half of the grain it had produced before the war.</li></ul><p><br></p><p><strong><span style="font-size: 18px;">Welfare Cost</span></strong></p><ul><li>There was a high cost to cover to provide welfare for ex-soldiers seeking jobs, or unable to find them because of war disability.</li><li>Increasing taxes to cover this expense by the Republic was sought by its enemies as a way to meet Allied reparations bills.</li></ul><p><br></p><p><strong><span style="font-size: 18px;">Hyperinflation</span></strong></p><p><br></p><table style="width: 100%;"><thead><tr><th style="width: 38.354%;"><div style="text-align: left;">Exchange of 1 Dollar to Marks</div></th><th style="width: 16.1491%;"><div style="text-align: left;">Date</div></th><th style="width: 45.1863%;"><div style="text-align: left;">Month</div></th></tr></thead><tbody><tr><td style="width: 38.354%; text-align: left;">4</td><td style="width: 16.1491%;">1914</td><td style="width: 45.1863%;"><br></td></tr><tr><td style="width: 38.354%; text-align: left;">12</td><td style="width: 16.1491%;">1919</td><td style="width: 45.1863%;"><br></td></tr><tr><td style="width: 38.354%; text-align: left;">263</td><td style="width: 16.1491%;">1921&nbsp;</td><td style="width: 45.1863%;"><br></td></tr><tr><td style="width: 38.354%; text-align: left;">493</td><td style="width: 16.1491%;">1921</td><td style="width: 45.1863%;">July</td></tr><tr><td style="width: 38.354%; text-align: left;">1,000</td><td style="width: 16.1491%;">1922</td><td style="width: 45.1863%;">August</td></tr><tr><td style="width: 38.354%; text-align: left;">3,000</td><td style="width: 16.1491%;">&quot;</td><td style="width: 45.1863%;">October</td></tr><tr><td style="width: 38.354%; text-align: left;">7,000</td><td style="width: 16.1491%;">&quot;</td><td style="width: 45.1863%;">December</td></tr><tr><td style="width: 38.354%; text-align: left;">17,000</td><td style="width: 16.1491%;">1923</td><td style="width: 45.1863%;">January</td></tr><tr><td style="width: 38.354%; text-align: left;">24,000</td><td style="width: 16.1491%;">&quot;</td><td style="width: 45.1863%;">April</td></tr><tr><td style="width: 38.354%; text-align: left;">353,000</td><td style="width: 16.1491%;">&quot;</td><td style="width: 45.1863%;">July</td></tr><tr><td style="width: 38.354%; text-align: left;">4,621,000</td><td style="width: 16.1491%;">&quot;</td><td style="width: 45.1863%;">August</td></tr><tr><td style="width: 38.354%; text-align: left;">98,860,000</td><td style="width: 16.1491%;">&quot;</td><td style="width: 45.1863%;">September</td></tr><tr><td style="width: 38.354%; text-align: left;">25,260,000,000</td><td style="width: 16.1491%;">&quot;</td><td style="width: 45.1863%;">October</td></tr><tr><td style="width: 38.354%; text-align: left;">2,193,600,000,000</td><td style="width: 16.1491%;">&quot;</td><td style="width: 45.1863%;">November</td></tr><tr><td style="width: 38.354%; text-align: left;">4,200,000,000,000</td><td style="width: 16.1491%;">&quot;</td><td style="width: 45.1863%;">December</td></tr></tbody></table><p><br></p><ul><li>The ability to borrow money to purchase goods, equipment, industrial plant and the like, and pay it back when it was worth a fraction of its original value, helped stimulate industrial recovery after the war. In the period up to the middle of 1922, economic growth rates in Germany were high, and unemployment low. Real taxation rates were also low enough to stimulate demand.</li></ul><p><br></p><ul><li>The recovery was built on sand as the inflation proved unstoppable. The political consequences where catastrophic:<ul><li>The German government could not make the required reparations payments any longer (they had to be tendered in gold, whose price in the international market couldn&#39;t afford any longer)</li><li>By the end of 1922 it had fallen behind its deliveries of coal fo the French (another part of the reparations programme). So French and Belgian Troops occupied Germany&#39;s leading industrial district, the Ruhr. In response the government proclaimed a policy of passive resistance a non-cooperation in order to deny the occupiers resource production. This resistance made the economic situation worse by skyrocketing the inflation.</li><li>The collapsed of the mark made it impossible to import supplies from abroad.</li></ul></li></ul><p><br></p><ul><li>Money lost meaning almost completely.&nbsp;<ul><li>Employees would collect their wages in wheelbarrows as so many banknotes where necessary to make up their pay packets; and then rushed the shops to buy supplies before their money devaluated even more.</li><li>Letters had to be mailed with the latest denomination banknotes staples to the envelope, since postage stamps of the right value could not be printed fast enough to keep up with the price rise.</li><li>The price of food could fluctuation vary even in within the hour: a coffee cup at a cafe worth $5,000 marks at the time of ordering it would $8,000 at the time of pay.</li><li>At the height of the hyperinflation, over 90% of the expenditure of the average household we to food. Unable to afford the most basic necessities, crowds began to riot and to loot food shops. Malnutrition caused an immediate rise in deaths from tuberculosis.</li><li>Prices had reached a billion times their prewar level.</li></ul></li></ul><p><br></p><p><strong style="margin: 0px; text-decoration: none; box-sizing: border-box; font-weight: 700; color: rgb(48, 50, 53); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"><span style="margin: 0px; text-decoration: none; box-sizing: border-box; font-size: 18px;">The End of the Hyperinflation</span></strong></p><ul><li>The Dawes Plan negotiated the withdrawal of the French and Belgian troops from the Ruhr in turn for an agreement so Germany could make the reparation payments possible and for the next five years their were paid indeed without much problem</li><li>On November 1923 a new currency is issued, the Retenmark whose value was tied to the price of gold. A number of measures where put int place to defend it from speculation. This put an end to the hyperinflation.</li></ul><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	74
43	2020-06-22 15:51:19.247783	2020-06-22 16:06:11.829395	<p><span style="font-size: 24px;">Art</span></p><ul><li>The Avant-garde art had impinged on the public conciseness with the work of Expressionists (Kirchner, Macke or Nolde) and abstract painters (Kandinsky)</li><li>Bauhaus: Its radically simple, clean and ultra-modern designs were condemned by local politicians as owing more to the art forms of primitive races than to anything German.&nbsp;</li><li>The sense of cultural crisis which the emergence of modernist art and culture generated amongst the middle classes after the turn of the century, was held in check under the Wilhelmine regime, but after 1918 it became more widespread. (Culture Wars,page 123)</li></ul><p><br></p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	74
44	2020-06-22 22:18:38.911469	2020-06-22 22:18:38.911469	<p>Georg Hegel would take the reintegration even further after Rousseau and Kant. He would the necessity of religion on ethical grounds. For him Protestantism was the final culmination of Christianity taking it to its logical conclusion. It provided freedom for individuals while providing the guiding ethical nature Christianity. He saw the French Revolution as a guiding proof of his philosophy. Here the French philosophes has narrowly focused on a single idea of human freedom without understanding the important place religion holds within it. As a result french philosophy of the early and mid 18th century led to the logical conclusion that was the French Revolution. But given the removal of the divine as part of that revolution it quickly devolved into the terror and Napoleonic revolutions that culminated in despotism. That is without an ethical foundation these results of the revolution would be expected.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	70
34	2020-05-27 21:08:39.714177	2020-06-22 22:23:43.616058	<p>The enlightenment posed the first questions to the reigning multiple millennia of political theology defined by the &quot;divine nexus&quot;. The questioning began with a complete removal of god as a player in politics. It ended however with Kant bringing god and religion back into story. Thomas Hobbes raised the original questions and sought to eliminate what he called the Kingdom of Darkness. Kant reasoned the necessity of the church in social life arguing against revelation and dogma, but allowing for the critical role religion plays to counter the moral dilemma Kant called the evil principle. While Rousseau argued humans were naturally good in isolation of larger society, and only became evil within society therefore showing that there is a context in which morality may necessary -- Kant was the opposite. He argued for what he called the &#39;evil principle&#39;, or an innate evil within us. This meant that while this was true morality would always be necessary, and to understand and build out that morality the church was necessary.</p><p><br></p><p>This logic leads to a reunification of Church and State. He argues that while the authors of the Great Separation and earlier were right to look to a separation as the answer that was not a modern human state. In the modern human state the necessity of religion is understood for ethical reasons and as such should not be separated from the State, but should be subordinate to it. That is, for Hegel, the protestant community is any modern man. That community is inherent and omnipresent, but in matters of law if it cannot be worked out within the church then the rule of the state should abide.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	70
45	2020-06-23 22:04:52.964979	2020-06-23 22:04:52.964979	<p>The crux of Rousseau&#39;s argument is that &quot;it was not religion as such that threatened a good political order, for genuine religion had nothing to do with ignorance, fear or passion. It was the perversion of moral faith by corrupt religious and political institutions that fanned superstition and debased moral feeling, making believers intolerant and violent toward one another.&quot;</p><p><br></p><p>At it&#39;s simplest, humans cannot ignore questions of eternity, divinity, and transcendence in our life or political life. This idea that humans are religious animals was at the core of the Romantics view of religion. As Lila states, for the Romantics religion would not exist for any form or revelation or dogma, but solely to smooth out the harsh edges of a non-religious world.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	70
46	2020-06-23 22:29:53.290157	2020-06-23 22:29:53.290157	<p>In the 19th century, it was general consensus in the US and England that the separation of church and state had been mutually beneficial. The state being relieved of it&#39;s duties of divine doctrine and the church being relieved of the laws of the state. But in Germany, the influence of Kant and then Hegel was still deeply ingrained in the culture. Here Germans were still seeking a Kantian or rational approach to the true form of political theology. If Hegel were to be listened to it would be inevitable this would be a political rule based on Protestantism. These new thinkers were called &#39;Liberal Theologians&#39;.</p><p><br></p><p>The approach of the liberal theologians was completely novel. The completely denied &#39;revealed political theology&#39;. Following in the footsteps of Rousseau, Kant and Hegel they viewed religion as necessary for human existence while also being a sole product of human existence. Merging this idea with that of the need for a political theology they devised a way to discuss the divine nexus in terms solely of human experience.</p><p><br></p><p>The liberal theological idea is best contained in the summary conclusion by the best known theologian of this movement Friedrich Schleiermacher. He concludes that we can find God by finding ourselves. This moved beyond the practical view held by Rousseau, Kant and Hegel who viewed religion as a product of human invention, but also acknowledging that it serves a necessary role. Schleiermacher brings this back to an actual theology, not viewing religion as a utilitarian tool, as some means to a moral end, but as a method to divine realization.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	70
53	2020-06-29 21:20:57.248555	2020-06-29 21:20:57.248555	<p>What is the stillborn god? This is the final stage of Lila&#39;s analysis of the movement from Hobbes to post WWI views on political theology.</p><p><br></p><p>The picture drawn by Lila is one where it originates at it&#39;s most extreme of reactionary philosophy. Hobbes argued not for some modern spin on religion and theology, not even a separation of the two - but instead a full abolishing of it. This extremism was smoothed out over the next few centuries. Rousseau brought religion back from abyss as the center of good human sentiment, Kant pulled it even further out by making it the logical center of human morality, and finally Hegel pulled it out of the abyss by centralizing its role in human culture.</p><p><br></p><p>From here the liberal theologians of the pre-WWI period fully re-integrated the divine nexus into the modern world and modern politics. This new divine nexus was void of redemption and revelation. It was the cold and logical religion of Kant. It was this culmination of the divine that is the stillborn god. Post WWI when Europe as a whole was falling apart it became not uncommon to ask &#39;if the religion provides no redemption, why a religion at all?&#39;. While this may sound Hobbesian in nature, the German theologian of the Weimar period answers were far from Hobbesian. Where Hobbes rejected it in whole, this new generation of theologians accepted religion for what they historically felt it had always been. They pulled in the Protestantism of Rousseau, Kant and Hegel and unapologetically injected it with the pre-Hobbesian religious dogma, revelation and redemption. This brought religion back full circle with itself.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	70
47	2020-06-24 21:28:11.924808	2020-06-24 22:02:50.437453	<p>Behind the liberal theology resting on the philosophy of Hegel was Protestantism. But while the liberal version of Protestantism was attempting to &quot;defend Christianity in an age when belief in magic and miracles had declined, when science was explaining the inner workings of nature without appealing to God, when scholarship was revealing the tremendous historical and geographical variety of human customs, and when Europeans were becoming convinced of their own absolute right to free self-determination&quot;, arising along side of it was a Jewish attempt at a liberal theology. With much the same goals as the stated above, but in addition that it could live alongside Protestantism in a modern world.</p><p><br></p><p>The Jews were exiled from Spain and Portugal at the end of the fifteenth century. It wasn&#39;t until the Napoleonic wars that they were liberated, and it was in Germany where they were most swiftly integrated into the German nationalist culture. Their problem was that while liberal theology allowed for the individualism and rational approach of the modern world, it did not allow for an alternative to Protestantism. In this sense Jews were left with little option. Either modernize with their own liberal theology which could philosophically and theologically argue for their place in the modern world alongside the Protestant liberal theologians, or they could become Protestants. They chose option one, but coming up with a Jewish liberal theology required a daunting task in Germany. That was to come up with a philosophical alternative to Hegellian philosophy.&nbsp;</p><p><br></p><p>That alternative was found in Kantian philosophy. There Hermann Cohen argued that like Kant religion was not just viable, but necessary only if it always used it&#39;s place as a pusher of moral code into the society around it, and it stayed within the bounds of reason. Based on Kant&#39;s logic, Cohen argued that there would be no reason why Judaism could not only coexist with with Protestantism, but that it could also participate in the growing German nationalism of the late 19th century.&nbsp;</p><p><br></p><p>The worlds of both Protestant liberal theology and Jewish liberal theology came crumbling down in 1914 with the beginnings of WWI. Nationalism along with the modern role of religion as moral guide became increasingly difficult to rationally explain away. Cohen and his Protestant counterparts did find ways, albeit somewhat lame attempts to reconcile the two. Many philosophers and theologians, came later to regret their having been taken in by German nationalism and their defenses of it. With the end of WWI came the demise of any understanding of what the modern world was or could be. And with the crumbling of any understanding of modernity came the death of liberal theology.</p><p><br></p><p>Liberal theology was full of optimism and perhaps had a skewed view of the modern human being. The underlying problem for Hobbes, Locke, and Hume were what they referred to as the Passions. For the liberal theologians these passions had been tamed paving the way for modern man to merge the modern form of rational religion with that of modern politics. WWI quickly illustrated that the Passions were not dead.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	5: The Well-Ordered House	\N	70
48	2020-06-25 22:33:00.618267	2020-06-25 22:33:00.618267	<p>After Protestant liberal theology came to a halt with WWI reactionary voices emerged post-war. These voices were messianic and eschatological in nature. Where the liberal theologians saw the embracing of modern life and culture as the route to God, these new voices proclaimed that they had idolized modernity and WWI is what it got them.&nbsp;</p><p><br></p><p>It&#39;s important to note that this was not just a nostalgic return to the past type reaction. The rise of the Weimar republic in Germany propelled novel thinkers, artists, poets and writers &quot;in every direction, so long as it was away from the complacent bourgeois center&quot; that pre-existed WWI.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	6: The Redeeming God	\N	70
49	2020-06-25 22:45:55.192614	2020-06-25 22:45:55.192614	<p>Thomas Hobbes&#39; insight and basic foundation for the Great Separation was that the revelatory and messianic tendencies that religion often invoked led not just to redemption of the spirit but also seemed to lead to political redemption. As Hobbes noted, this was almost always a means of violence.</p><p><br></p><p>By early 20th century Germany, those under the Weimar Republic, Hobbes&#39; insight was nearly forgotten. Starting with Rousseau, the role of religion became a rational means by which we could draw out a more &quot;noble moral sentiments, sustaining hope, and building community&quot;. Most thinkers followed the path pointed by Rousseau afterwards. While these thinkers right up to post-WWI perhaps had only the good in mind and wished their thinking to have only positive effects, they had completely overlooked one of the core principles proposed by Hobbes -- that religion while full of good intent, it &quot;can also express darker fears and desires, that it can destroy community by dividing its members, that it can inflame the mind with destructive apocalyptic fantasies of immediate redemption.&quot;</p><p><br></p><p>Karl Barth and Franz Rosensweig both wrote of religion in Messianic and apocalyptic terms. Neither had any intention of being political, but many in the Weimar Republic were influenced by them and reinterpreted their calls for religious redemption to that of political redemption. That political redemption drawn from their works grew into the foulest of modern ideologies.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	70
50	2020-06-25 22:51:21.012987	2020-06-25 22:51:21.012987	<p>Rousseau started the reaction against the Great Separation. Later thinkers in the early 20th century would grow reaction against Rousseau and those that followed up on his thinking over the next century. These thinkers considered their adversary to be every form of what they referred to as liberal theological humanism, &quot;whether it defined Christianity as the highest expression of human sentiment (Rousseau, Schleiermacher), the highest development of human morality (Kant, Ritschl), or the highest manifestation of human culture (Hegel, Troeltsch).</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	6: The Redeeming God	260	70
51	2020-06-25 22:54:45.936542	2020-06-25 22:54:45.936542	<p>The liberal theologians shifted the center of focus from God to the human according to Barth. This shift had the predictable outcome of WWI. Barth believed that God had spoken of the fallible human, when the human is made the center of existence (humanism) the outcome is bound to be fallible as well.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	6: The Redeeming God	261	70
52	2020-06-28 17:06:39.910086	2020-06-28 17:06:39.910086	<p>The generation spawned by Karl Barth post-WWI was a generation of theologians who saw the world in black and white. Lila writes, &quot;[they] had no taste for compromise with the culture that their liberal teachers celebrated and that committed suicide in the Great War They wanted to confront the unknown God, the wholly other, the deus absconditus. They wanted to live in the paradox, feel the eschatological tension embedded in creation. They longed to inhabit a chiaroscuro world of either-or, not &#39;yes, but&#39;. They wanted to experience the moment of absolute decision and to have that decision determine the whole of their existence.&quot;</p><p><br></p><p>However, one wishes to view the chicken and egg scenario at play here, it&#39;s clear that their worldview played a role in their acceptance of the rise of the Nazi party, or as others may argue their worldview helped to inspire the rise of the Nazi party.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	\N	\N	70
27	2020-05-18 10:05:17.099782	2020-06-29 22:18:57.44722	<p>The idea of natural religion and religion as a social phenomenon is not as modern as we may think. It goes back to the ancient greek philosophers.&nbsp;</p><p><br></p><ul><li><h3>Aristotle</h3></li></ul><p>He made the influential suggestion that religion was born of wonder, which was then given expression through myth.</p><p><br></p><ul><li><h3>The Epicureans</h3></li></ul><p>They speculated that religion arose from ignorance and fear of suffering, expressing hopes that the gods might protect us.</p><p><br></p><ul><li><h3>The Euhemerists</h3></li></ul><p>They remarked that many nations turn their heroes into gods and reasoned that many traditional gods probably began as human heroes.</p><p><br></p><ul><li><h3>The Stoics</h3></li></ul><p>They emphasized the fact that, whatever role ignorance and fear may play in belief, basic religious notions across cultures are remarkably similar. This led the them to lay out the genial theory that a magnanimous force (spermatikos logos) plants divine seeds in all human souls that blossom into roughly similar moral and religious ideas in all nations.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>	2. The Great Separation	67	70
\.


--
-- Name: reference_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.reference_note_id_seq', 53, true);


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.tag (id, created, modified, label) FROM stdin;
2	2020-03-13 18:32:08.773055	2020-03-13 18:32:53.342151	conflict
\.


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.tag_id_seq', 2, true);


--
-- Data for Name: timeline; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.timeline (id, created, modified, label, description) FROM stdin;
2	2020-02-19 07:35:11.365264	2020-02-19 07:35:11.365264	The Reformation	\N
3	2020-02-21 07:46:41.15554	2020-02-21 07:46:41.15554	Reign Of The Ottomans	\N
4	2020-02-21 20:15:36.373406	2020-02-21 20:15:36.373406	World Events	\N
5	2020-03-05 14:46:42.642396	2020-03-05 14:46:42.642396	Conflict In The Middle East	\N
6	2020-03-05 18:48:48.582366	2020-03-05 18:48:48.582366	Iranian Revolution	\N
7	2020-03-11 16:45:04.024638	2020-03-11 16:45:04.024638	U.S. Presidents	\N
8	2020-03-11 17:33:13.831701	2020-03-11 17:33:13.831701	English Kings And Queens	\N
10	2020-03-18 18:03:36.722992	2020-03-18 18:03:36.722992	The Iron Curtain	\N
1	2020-02-06 12:27:16.114802	2020-03-19 17:51:43.417736	The Big Picture	\N
9	2020-03-16 15:15:23.973316	2020-03-21 20:26:35.608634	Ukrainian Famine	\N
11	2020-03-23 19:03:45.107475	2020-03-23 19:03:45.107475	Islam	\N
12	2020-04-06 12:58:28.508829	2020-04-06 12:58:28.508829	The Ancient World	\N
13	2020-04-08 16:29:43.377058	2020-04-08 16:29:43.377058	Shakers	\N
15	2020-05-19 22:37:10.278661	2020-05-19 22:37:10.278661	European Philosophers	\N
14	2020-05-18 22:04:27.563444	2020-05-25 21:54:58.210705	The Third Reich	\N
16	2020-06-29 19:56:04.004518	2020-06-29 20:32:16.768981	The Great Separation (Macro View)	<p>Looking at the time of the Great Separation on a scale of human history illustrates the experimental nature of we find ourselves living out in the moment. History has been an ongoing aggregate of politics and theology. In the most extreme cases both being one and the same.&nbsp;</p><p><br></p><p>One of the earliest and most explicit accounts of a political theology is the early Egyptian Empire whose Pharaohs were the incarnate gods themselves. There was no line between Egyptian theology and Egyptian politics at the time. When plotted on scale it&#39;s clear how small our moment in time is.</p><p><br></p><p>Another illustration is to hold up this moment in time against another moment that seems fleeting in history. As something that came, made history, only to be generally forgotten in all but name by most everyone except historians of ancient history. That is the Babylonian Empire. Plotted here it becomes evident that empire lasting 1,355 years dwarfs in scale the length of the Great Separation (369 years). While the cycles of forgetfulness have come and gone already within this event it reminds us of the dangers of complacency. Historically the Babylonian Empire rose and fell. What would a citizen have said of the Empire 369 years into it. Would they have thought it immortal. Maybe so. Why would they have believed otherwise. All indication would have pointed to an unbreakable empire in that given moment. With hindsight however, we can realize the futility in believing any ideology or empire is immortal. This comparison also underscores just how young this moment is. Were it to die out and the western world return to deep political theologies in the next 100 years, this is a moment that might not even register on the historical scale of human history.</p><p data-f-id="pbf" style="text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;">Powered by <a href="https://www.froala.com/wysiwyg-editor?pb=1" title="Froala Editor">Froala Editor</a></p>
17	2020-07-03 22:04:57.086005	2020-07-03 22:04:57.086005	The Great Separation	\N
\.


--
-- Data for Name: timeline_category; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.timeline_category (id, created, modified, timeline_fk, label) FROM stdin;
3	2020-03-17 19:50:51.420863	2020-03-17 19:50:51.420863	9	Revolutions
6	2020-03-19 19:10:57.391341	2020-03-19 19:10:57.391341	9	Famines
7	2020-03-19 19:13:31.464497	2020-03-19 19:13:31.464497	9	Leaders
8	2020-03-21 20:32:02.844783	2020-03-21 20:32:02.844783	9	Secret Police
9	2020-03-21 20:43:40.536426	2020-03-21 20:43:40.536426	9	Economy
10	2020-03-21 22:05:18.576207	2020-03-21 22:05:18.576207	10	Secret Police
11	2020-03-22 09:06:43.636864	2020-03-22 09:06:43.636864	5	Israel
12	2020-03-22 09:08:21.049663	2020-03-22 09:08:21.049663	5	Iranian Revolution
13	2020-03-22 09:11:24.740576	2020-03-22 09:11:24.740576	3	Conquest
14	2020-03-22 09:11:48.475753	2020-03-22 09:11:48.475753	3	Decline Of Empire
15	2020-03-22 09:15:13.835779	2020-03-22 09:15:13.835779	3	Naval Warfare
16	2020-03-22 16:27:21.572241	2020-03-22 16:27:21.572241	8	U.S. Presidents
30	2020-03-24 14:34:58.622697	2020-03-24 14:34:58.622697	4	Test Three
31	2020-03-24 14:35:04.120259	2020-03-24 14:35:04.120259	4	Test Four
32	2020-03-24 14:38:35.944857	2020-03-24 14:38:35.944857	4	Test One
33	2020-03-24 14:38:43.667935	2020-03-24 14:38:43.667935	4	Test Two
34	2020-03-24 17:58:28.553142	2020-03-24 17:58:28.553142	5	Leaders
35	2020-03-24 17:59:55.463483	2020-03-24 17:59:55.463483	11	Origins of Islam
36	2020-03-24 18:00:30.016727	2020-03-24 18:00:30.016727	11	Dynasties
38	2020-03-24 20:53:57.640686	2020-03-24 20:53:57.640686	10	World Events
39	2020-04-01 20:24:04.885999	2020-04-01 20:24:04.885999	5	Pahlavi Dynasty
40	2020-04-06 17:05:06.504129	2020-04-06 17:05:06.504129	12	Egyptian Periods
41	2020-04-06 17:05:51.144449	2020-04-06 17:05:51.144449	12	Egyptian Pharaohs
42	2020-04-06 17:05:56.553919	2020-04-06 17:05:56.553919	12	Egypt
43	2020-04-06 17:40:43.699561	2020-04-06 17:40:43.699561	12	Minoans
44	2020-04-07 20:44:21.545746	2020-04-07 20:44:21.545746	12	Hittites
45	2020-04-08 21:29:08.423689	2020-04-08 21:29:08.423689	10	International Organizations
47	2020-04-09 18:05:25.229875	2020-04-09 18:05:25.229875	13	Ann Lee
49	2020-04-11 19:17:07.633117	2020-04-11 19:17:07.633117	12	Assyrians
50	2020-04-11 20:02:46.402015	2020-04-11 20:02:46.402015	12	Mitanni
51	2020-04-11 20:06:59.749507	2020-04-11 20:06:59.749507	12	Babylonians
52	2020-04-11 20:07:40.900863	2020-04-11 20:07:40.900863	12	Empires
53	2020-04-24 08:35:16.523184	2020-04-24 08:35:16.523184	12	Biblical
54	2020-05-25 21:52:43.367273	2020-05-25 21:52:43.367273	14	Governments
55	2020-05-25 21:56:42.065938	2020-05-25 21:56:42.065938	14	Key Characters
56	2020-05-25 21:58:06.271499	2020-05-25 21:58:06.271499	14	Paralel Events
57	2020-05-25 22:08:15.829272	2020-05-25 22:08:15.829272	14	Political Parties
58	2020-05-25 22:33:15.667999	2020-05-25 22:33:15.667999	14	Science
59	2020-06-06 20:14:07.020735	2020-06-06 20:14:07.020735	14	Paramilitary Groups
60	2020-06-07 10:25:13.121341	2020-06-07 10:25:13.121341	14	Art
61	2020-06-07 11:14:34.604051	2020-06-07 11:14:34.604051	14	Economics
62	2020-06-29 20:06:39.930748	2020-06-29 20:06:39.930748	16	Earliest Political Theology
63	2020-06-29 20:07:04.761492	2020-06-29 20:07:04.761492	16	The Great Separation
64	2020-06-29 20:12:54.812396	2020-06-29 20:12:54.812396	16	Babylonian Empire
65	2020-07-03 22:07:02.633891	2020-07-03 22:07:02.633891	17	Thomas Hobbes
\.


--
-- Data for Name: timeline_category_event; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.timeline_category_event (id, created, modified, timeline_category_fk, event_fk) FROM stdin;
190	2020-03-24 17:24:45.11369	2020-03-24 17:24:45.11369	32	80
192	2020-03-24 17:28:46.759652	2020-03-24 17:28:46.759652	32	256
198	2020-03-24 18:00:02.113943	2020-03-24 18:00:02.113943	35	252
199	2020-03-24 18:00:07.20394	2020-03-24 18:00:07.20394	35	253
200	2020-03-24 18:00:15.491448	2020-03-24 18:00:15.491448	35	256
201	2020-03-24 18:00:35.016479	2020-03-24 18:00:35.016479	36	254
204	2020-03-24 20:54:04.083678	2020-03-24 20:54:04.083678	38	242
205	2020-03-24 21:06:17.477507	2020-03-24 21:06:17.477507	38	257
206	2020-03-24 21:06:28.029805	2020-03-24 21:06:28.029805	38	258
207	2020-04-01 20:24:11.409982	2020-04-01 20:24:11.409982	39	263
208	2020-04-01 20:24:17.967331	2020-04-01 20:24:17.967331	39	264
38	2020-03-21 17:07:39.489538	2020-03-21 17:07:39.489538	3	223
209	2020-04-01 20:24:25.174235	2020-04-01 20:24:25.174235	39	81
40	2020-03-21 17:08:27.810048	2020-03-21 17:08:27.810048	3	238
41	2020-03-21 17:15:22.492807	2020-03-21 17:15:22.492807	3	217
42	2020-03-21 20:30:31.150851	2020-03-21 20:30:31.150851	3	221
43	2020-03-21 20:32:42.975368	2020-03-21 20:32:42.975368	8	229
44	2020-03-21 20:43:09.132855	2020-03-21 20:43:09.132855	8	228
45	2020-03-21 20:44:01.003449	2020-03-21 20:44:01.003449	9	231
46	2020-03-21 20:44:20.318628	2020-03-21 20:44:20.318628	9	232
47	2020-03-21 20:46:23.939022	2020-03-21 20:46:23.939022	9	242
48	2020-03-21 21:55:16.287916	2020-03-21 21:55:16.287916	8	248
49	2020-03-21 22:01:24.710064	2020-03-21 22:01:24.710064	8	249
50	2020-03-21 22:05:40.200395	2020-03-21 22:05:40.200395	10	229
51	2020-03-21 22:05:45.886324	2020-03-21 22:05:45.886324	10	228
52	2020-03-21 22:05:50.773254	2020-03-21 22:05:50.773254	10	248
53	2020-03-21 22:05:54.953067	2020-03-21 22:05:54.953067	10	249
54	2020-03-22 09:07:09.779087	2020-03-22 09:07:09.779087	11	83
55	2020-03-22 09:07:19.009164	2020-03-22 09:07:19.009164	11	84
56	2020-03-22 09:07:24.929656	2020-03-22 09:07:24.929656	11	85
57	2020-03-22 09:07:32.962687	2020-03-22 09:07:32.962687	11	82
58	2020-03-22 09:08:49.329403	2020-03-22 09:08:49.329403	12	88
59	2020-03-22 09:08:54.171614	2020-03-22 09:08:54.171614	12	89
60	2020-03-22 09:08:57.684798	2020-03-22 09:08:57.684798	12	91
61	2020-03-22 09:12:03.874104	2020-03-22 09:12:03.874104	14	78
62	2020-03-22 09:12:08.329194	2020-03-22 09:12:08.329194	14	77
63	2020-03-22 09:12:12.179425	2020-03-22 09:12:12.179425	14	76
64	2020-03-22 09:12:16.097772	2020-03-22 09:12:16.097772	14	75
65	2020-03-22 09:12:19.986974	2020-03-22 09:12:19.986974	14	74
66	2020-03-22 09:12:29.547607	2020-03-22 09:12:29.547607	14	72
67	2020-03-22 09:12:35.36192	2020-03-22 09:12:35.36192	13	71
68	2020-03-22 09:12:39.082878	2020-03-22 09:12:39.082878	13	70
69	2020-03-22 09:12:43.763859	2020-03-22 09:12:43.763859	13	69
70	2020-03-22 09:12:48.62414	2020-03-22 09:12:48.62414	13	68
71	2020-03-22 09:12:51.639726	2020-03-22 09:12:51.639726	13	67
72	2020-03-22 09:12:55.577887	2020-03-22 09:12:55.577887	13	66
73	2020-03-22 09:13:28.724784	2020-03-22 09:13:28.724784	13	62
74	2020-03-22 09:13:33.411501	2020-03-22 09:13:33.411501	13	58
75	2020-03-22 09:13:37.667073	2020-03-22 09:13:37.667073	13	57
76	2020-03-22 09:13:42.988142	2020-03-22 09:13:42.988142	13	61
77	2020-03-22 09:13:49.578913	2020-03-22 09:13:49.578913	13	54
78	2020-03-22 09:13:52.723626	2020-03-22 09:13:52.723626	13	56
79	2020-03-22 09:13:56.034699	2020-03-22 09:13:56.034699	13	55
80	2020-03-22 09:14:02.915594	2020-03-22 09:14:02.915594	13	52
81	2020-03-22 09:14:05.808773	2020-03-22 09:14:05.808773	13	50
82	2020-03-22 09:14:09.090642	2020-03-22 09:14:09.090642	13	51
83	2020-03-22 09:14:12.035192	2020-03-22 09:14:12.035192	13	48
84	2020-03-22 09:14:15.293106	2020-03-22 09:14:15.293106	13	49
85	2020-03-22 09:15:32.994151	2020-03-22 09:15:32.994151	15	60
86	2020-03-22 09:15:58.907193	2020-03-22 09:15:58.907193	15	64
87	2020-03-22 16:27:39.564009	2020-03-22 16:27:39.564009	16	99
88	2020-03-22 16:27:44.884926	2020-03-22 16:27:44.884926	16	100
89	2020-03-22 16:27:49.55504	2020-03-22 16:27:49.55504	16	101
90	2020-03-22 16:27:52.475298	2020-03-22 16:27:52.475298	16	102
91	2020-03-22 16:27:55.773	2020-03-22 16:27:55.773	16	103
92	2020-03-22 16:27:59.34817	2020-03-22 16:27:59.34817	16	104
93	2020-03-22 16:28:02.10674	2020-03-22 16:28:02.10674	16	105
94	2020-03-22 16:28:12.4663	2020-03-22 16:28:12.4663	16	106
95	2020-03-22 16:28:16.68555	2020-03-22 16:28:16.68555	16	107
96	2020-03-22 16:28:19.2033	2020-03-22 16:28:19.2033	16	108
97	2020-03-22 16:28:21.674814	2020-03-22 16:28:21.674814	16	109
98	2020-03-22 16:28:25.203127	2020-03-22 16:28:25.203127	16	110
99	2020-03-22 16:28:29.852414	2020-03-22 16:28:29.852414	16	111
100	2020-03-22 16:28:33.538137	2020-03-22 16:28:33.538137	16	112
101	2020-03-22 16:28:36.523302	2020-03-22 16:28:36.523302	16	113
102	2020-03-22 16:28:39.099438	2020-03-22 16:28:39.099438	16	114
103	2020-03-22 16:28:41.996933	2020-03-22 16:28:41.996933	16	115
104	2020-03-22 16:28:45.185513	2020-03-22 16:28:45.185513	16	116
105	2020-03-22 16:28:47.714761	2020-03-22 16:28:47.714761	16	117
106	2020-03-22 16:28:50.267019	2020-03-22 16:28:50.267019	16	118
107	2020-03-22 16:28:52.689739	2020-03-22 16:28:52.689739	16	119
108	2020-03-22 16:28:55.139144	2020-03-22 16:28:55.139144	16	120
109	2020-03-22 16:28:57.830089	2020-03-22 16:28:57.830089	16	121
110	2020-03-22 16:29:00.115609	2020-03-22 16:29:00.115609	16	122
111	2020-03-22 16:29:02.516198	2020-03-22 16:29:02.516198	16	123
112	2020-03-22 16:29:05.427242	2020-03-22 16:29:05.427242	16	124
113	2020-03-22 16:29:07.834101	2020-03-22 16:29:07.834101	16	125
114	2020-03-22 16:29:15.146039	2020-03-22 16:29:15.146039	16	126
115	2020-03-22 16:29:18.042555	2020-03-22 16:29:18.042555	16	127
116	2020-03-22 16:29:21.323827	2020-03-22 16:29:21.323827	16	128
117	2020-03-22 16:29:23.476639	2020-03-22 16:29:23.476639	16	129
118	2020-03-22 16:29:25.795836	2020-03-22 16:29:25.795836	16	130
119	2020-03-22 16:29:30.325426	2020-03-22 16:29:30.325426	16	131
120	2020-03-22 16:29:33.387169	2020-03-22 16:29:33.387169	16	132
121	2020-03-22 16:29:35.562926	2020-03-22 16:29:35.562926	16	133
122	2020-03-22 16:29:38.630991	2020-03-22 16:29:38.630991	16	134
123	2020-03-22 16:29:41.114668	2020-03-22 16:29:41.114668	16	135
124	2020-03-22 16:29:43.923564	2020-03-22 16:29:43.923564	16	136
125	2020-03-22 16:29:46.603628	2020-03-22 16:29:46.603628	16	137
126	2020-03-22 16:29:49.92554	2020-03-22 16:29:49.92554	16	138
127	2020-03-22 16:29:53.293052	2020-03-22 16:29:53.293052	16	139
128	2020-03-22 16:29:56.242907	2020-03-22 16:29:56.242907	16	140
129	2020-03-22 16:29:58.610645	2020-03-22 16:29:58.610645	16	141
130	2020-03-22 16:30:01.081636	2020-03-22 16:30:01.081636	16	142
131	2020-03-22 16:30:03.642129	2020-03-22 16:30:03.642129	16	143
210	2020-04-01 20:26:25.139555	2020-04-01 20:26:25.139555	39	266
211	2020-04-01 20:30:36.661324	2020-04-01 20:30:36.661324	39	265
212	2020-04-06 17:05:14.960902	2020-04-06 17:05:14.960902	40	275
213	2020-04-06 17:06:04.650938	2020-04-06 17:06:04.650938	42	272
214	2020-04-06 17:06:10.51046	2020-04-06 17:06:10.51046	42	270
137	2020-03-24 14:38:53.572568	2020-03-24 14:38:53.572568	33	39
215	2020-04-06 17:06:14.042325	2020-04-06 17:06:14.042325	42	271
141	2020-03-24 14:51:12.734026	2020-03-24 14:51:12.734026	33	211
142	2020-03-24 14:51:28.012102	2020-03-24 14:51:28.012102	33	252
143	2020-03-24 14:51:32.134285	2020-03-24 14:51:32.134285	30	253
144	2020-03-24 14:51:36.146947	2020-03-24 14:51:36.146947	30	254
216	2020-04-06 17:06:18.402591	2020-04-06 17:06:18.402591	42	274
217	2020-04-06 17:06:22.454216	2020-04-06 17:06:22.454216	42	273
218	2020-04-06 17:06:31.44601	2020-04-06 17:06:31.44601	41	268
219	2020-04-06 17:06:41.517244	2020-04-06 17:06:41.517244	42	269
220	2020-04-06 17:19:59.301287	2020-04-06 17:19:59.301287	42	276
221	2020-04-06 17:20:05.414331	2020-04-06 17:20:05.414331	40	277
222	2020-04-06 17:40:52.096525	2020-04-06 17:40:52.096525	43	279
224	2020-04-06 18:32:30.290724	2020-04-06 18:32:30.290724	41	281
225	2020-04-06 18:32:37.555732	2020-04-06 18:32:37.555732	41	280
226	2020-04-07 20:43:49.19448	2020-04-07 20:43:49.19448	42	282
227	2020-04-07 20:44:30.387649	2020-04-07 20:44:30.387649	44	285
228	2020-04-07 20:44:35.312994	2020-04-07 20:44:35.312994	44	284
232	2020-04-08 21:29:19.629906	2020-04-08 21:29:19.629906	45	299
233	2020-04-08 21:29:33.463431	2020-04-08 21:29:33.463431	45	243
234	2020-04-08 21:29:40.088811	2020-04-08 21:29:40.088811	45	244
235	2020-04-08 21:46:28.644044	2020-04-08 21:46:28.644044	38	261
236	2020-04-08 21:46:35.776597	2020-04-08 21:46:35.776597	38	300
237	2020-04-08 22:13:04.677733	2020-04-08 22:13:04.677733	10	302
238	2020-04-08 22:13:16.75002	2020-04-08 22:13:16.75002	10	298
239	2020-04-09 18:05:32.363027	2020-04-09 18:05:32.363027	47	292
240	2020-04-09 18:05:36.449597	2020-04-09 18:05:36.449597	47	287
241	2020-04-09 18:05:44.146231	2020-04-09 18:05:44.146231	47	304
242	2020-04-09 18:49:04.743641	2020-04-09 18:49:04.743641	47	305
243	2020-04-09 19:51:40.022983	2020-04-09 19:51:40.022983	41	306
244	2020-04-11 17:38:12.332672	2020-04-11 17:38:12.332672	41	307
245	2020-04-11 19:19:15.006735	2020-04-11 19:19:15.006735	49	308
246	2020-04-11 19:21:51.921565	2020-04-11 19:21:51.921565	49	309
247	2020-04-11 19:34:09.920783	2020-04-11 19:34:09.920783	41	310
248	2020-04-11 19:49:14.028118	2020-04-11 19:49:14.028118	40	311
249	2020-04-11 19:49:22.593304	2020-04-11 19:49:22.593304	40	312
250	2020-04-11 19:49:29.247632	2020-04-11 19:49:29.247632	40	313
251	2020-04-11 19:51:39.351572	2020-04-11 19:51:39.351572	40	314
252	2020-04-11 19:54:58.849416	2020-04-11 19:54:58.849416	40	315
257	2020-04-11 20:13:52.932571	2020-04-11 20:13:52.932571	52	278
258	2020-04-11 20:14:00.450429	2020-04-11 20:14:00.450429	52	317
259	2020-04-11 20:14:05.3972	2020-04-11 20:14:05.3972	52	318
260	2020-04-11 20:14:10.13576	2020-04-11 20:14:10.13576	52	286
261	2020-04-11 20:14:14.846871	2020-04-11 20:14:14.846871	52	319
262	2020-04-11 20:15:25.697587	2020-04-11 20:15:25.697587	52	320
263	2020-04-11 20:16:05.157356	2020-04-11 20:16:05.157356	52	316
264	2020-04-11 20:28:54.028741	2020-04-11 20:28:54.028741	44	321
265	2020-04-11 20:46:51.107858	2020-04-11 20:46:51.107858	44	323
266	2020-04-23 18:33:27.163884	2020-04-23 18:33:27.163884	44	331
267	2020-04-23 18:34:16.633172	2020-04-23 18:34:16.633172	41	332
268	2020-04-23 18:46:35.891809	2020-04-23 18:46:35.891809	44	333
269	2020-04-24 08:08:54.978089	2020-04-24 08:08:54.978089	41	338
270	2020-04-24 08:35:26.263663	2020-04-24 08:35:26.263663	53	337
271	2020-04-24 08:35:47.320785	2020-04-24 08:35:47.320785	53	339
272	2020-04-24 08:35:57.291766	2020-04-24 08:35:57.291766	53	336
273	2020-04-24 12:29:16.544707	2020-04-24 12:29:16.544707	44	341
274	2020-04-24 12:29:22.723155	2020-04-24 12:29:22.723155	44	342
275	2020-04-24 12:32:58.592322	2020-04-24 12:32:58.592322	49	343
276	2020-04-24 12:39:16.308075	2020-04-24 12:39:16.308075	49	344
277	2020-04-24 12:44:11.068347	2020-04-24 12:44:11.068347	49	345
278	2020-04-24 12:44:17.299067	2020-04-24 12:44:17.299067	49	346
279	2020-04-25 17:32:00.640083	2020-04-25 17:32:00.640083	44	347
280	2020-04-25 18:06:13.040564	2020-04-25 18:06:13.040564	44	348
281	2020-04-25 18:35:33.544946	2020-04-25 18:35:33.544946	41	350
282	2020-04-25 18:37:44.594553	2020-04-25 18:37:44.594553	41	351
283	2020-04-25 19:22:26.44987	2020-04-25 19:22:26.44987	41	353
284	2020-04-25 19:38:30.189267	2020-04-25 19:38:30.189267	41	354
285	2020-04-25 19:42:15.366842	2020-04-25 19:42:15.366842	41	355
286	2020-05-25 21:55:15.223858	2020-05-25 21:55:15.223858	54	360
287	2020-05-25 21:55:29.960563	2020-05-25 21:55:29.960563	54	362
288	2020-05-25 21:55:54.423866	2020-05-25 21:55:54.423866	54	363
289	2020-05-25 21:58:10.007249	2020-05-25 21:58:10.007249	56	223
291	2020-05-25 22:02:28.82666	2020-05-25 22:02:28.82666	38	362
292	2020-05-25 22:08:23.540308	2020-05-25 22:08:23.540308	57	368
293	2020-05-25 22:33:19.998242	2020-05-25 22:33:19.998242	58	369
294	2020-06-06 16:42:12.102262	2020-06-06 16:42:12.102262	57	371
295	2020-06-06 16:42:19.671587	2020-06-06 16:42:19.671587	56	370
297	2020-06-06 20:14:16.50894	2020-06-06 20:14:16.50894	59	373
298	2020-06-07 09:26:03.429683	2020-06-07 09:26:03.429683	56	375
300	2020-06-07 09:35:26.255321	2020-06-07 09:35:26.255321	56	376
301	2020-06-07 10:24:30.407976	2020-06-07 10:24:30.407976	57	378
302	2020-06-07 10:25:20.758481	2020-06-07 10:25:20.758481	60	377
303	2020-06-07 10:33:42.245662	2020-06-07 10:33:42.245662	57	379
304	2020-06-07 11:14:41.712887	2020-06-07 11:14:41.712887	61	381
305	2020-06-07 11:15:52.297606	2020-06-07 11:15:52.297606	61	242
307	2020-06-07 11:16:30.540633	2020-06-07 11:16:30.540633	61	382
308	2020-06-07 12:00:33.131238	2020-06-07 12:00:33.131238	61	383
309	2020-06-29 20:06:45.573247	2020-06-29 20:06:45.573247	62	268
310	2020-06-29 20:07:11.027158	2020-06-29 20:07:11.027158	63	385
311	2020-06-29 20:07:16.689796	2020-06-29 20:07:16.689796	63	367
312	2020-06-29 20:13:06.03329	2020-06-29 20:13:06.03329	64	318
313	2020-06-29 20:13:09.360488	2020-06-29 20:13:09.360488	63	257
314	2020-06-29 20:13:12.591002	2020-06-29 20:13:12.591002	63	258
315	2020-07-03 22:07:07.020593	2020-07-03 22:07:07.020593	65	367
\.


--
-- Name: timeline_category_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.timeline_category_event_id_seq', 315, true);


--
-- Name: timeline_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.timeline_category_id_seq', 65, true);


--
-- Data for Name: timeline_category_person; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.timeline_category_person (id, created, modified, timeline_category_fk, person_fk) FROM stdin;
\.


--
-- Name: timeline_category_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.timeline_category_person_id_seq', 1, false);


--
-- Data for Name: timeline_event; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.timeline_event (id, created, modified, timeline_fk, event_fk, is_shadow, priority) FROM stdin;
213	2020-03-11 18:06:57.214221	2020-03-11 18:06:57.214221	8	203	f	0
214	2020-03-11 18:07:01.835901	2020-03-11 18:07:01.835901	8	204	f	0
252	2020-03-22 16:23:00.810753	2020-03-22 16:23:00.810753	8	139	f	0
85	2020-03-05 14:47:00.888458	2020-03-05 14:47:00.888458	5	81	f	0
86	2020-03-05 14:47:07.181443	2020-03-05 14:47:07.181443	5	82	f	0
87	2020-03-05 14:47:12.756414	2020-03-05 14:47:12.756414	5	83	f	0
90	2020-03-05 18:24:09.074857	2020-03-05 18:24:09.074857	5	86	f	0
91	2020-03-05 18:24:14.634727	2020-03-05 18:24:14.634727	5	87	f	0
92	2020-03-05 18:41:57.406345	2020-03-05 18:41:57.406345	5	88	f	0
93	2020-03-05 18:47:41.925826	2020-03-05 18:47:41.925826	5	89	f	0
94	2020-03-05 18:49:02.390802	2020-03-05 18:49:02.390802	6	89	f	0
95	2020-03-05 18:49:12.192402	2020-03-05 18:49:12.192402	6	88	f	0
97	2020-03-05 20:02:33.027687	2020-03-05 20:02:33.027687	6	91	f	0
98	2020-03-05 20:02:37.80344	2020-03-05 20:02:37.80344	5	91	f	0
99	2020-03-05 20:02:50.769343	2020-03-05 20:02:50.769343	5	90	f	0
215	2020-03-11 18:13:23.799069	2020-03-11 18:13:23.799069	8	179	f	0
89	2020-03-05 14:47:22.159423	2020-03-06 09:57:43.309286	5	85	f	0
110	2020-03-11 16:45:13.111977	2020-03-11 16:45:13.111977	7	99	f	0
111	2020-03-11 16:49:43.032307	2020-03-11 16:49:43.032307	7	100	f	0
112	2020-03-11 16:49:47.104853	2020-03-11 16:49:47.104853	7	101	f	0
113	2020-03-11 16:49:50.272531	2020-03-11 16:49:50.272531	7	102	f	0
114	2020-03-11 16:49:53.879919	2020-03-11 16:49:53.879919	7	103	f	0
115	2020-03-11 16:49:56.802961	2020-03-11 16:49:56.802961	7	104	f	0
116	2020-03-11 16:49:59.767169	2020-03-11 16:49:59.767169	7	105	f	0
117	2020-03-11 16:50:02.680617	2020-03-11 16:50:02.680617	7	106	f	0
118	2020-03-11 16:55:28.122299	2020-03-11 16:55:28.122299	7	107	f	0
119	2020-03-11 16:55:32.160858	2020-03-11 16:55:32.160858	7	108	f	0
120	2020-03-11 16:55:35.383909	2020-03-11 16:55:35.383909	7	109	f	0
121	2020-03-11 16:55:38.609832	2020-03-11 16:55:38.609832	7	110	f	0
122	2020-03-11 16:55:41.793651	2020-03-11 16:55:41.793651	7	111	f	0
123	2020-03-11 16:55:44.746202	2020-03-11 16:55:44.746202	7	112	f	0
124	2020-03-11 16:55:47.667213	2020-03-11 16:55:47.667213	7	113	f	0
125	2020-03-11 16:55:50.769913	2020-03-11 16:55:50.769913	7	114	f	0
126	2020-03-11 17:01:21.331052	2020-03-11 17:01:21.331052	7	115	f	0
127	2020-03-11 17:01:24.859307	2020-03-11 17:01:24.859307	7	116	f	0
128	2020-03-11 17:01:27.540535	2020-03-11 17:01:27.540535	7	117	f	0
129	2020-03-11 17:01:30.347089	2020-03-11 17:01:30.347089	7	118	f	0
130	2020-03-11 17:01:33.321404	2020-03-11 17:01:33.321404	7	119	f	0
131	2020-03-11 17:01:36.173411	2020-03-11 17:01:36.173411	7	120	f	0
132	2020-03-11 17:01:39.35425	2020-03-11 17:01:39.35425	7	121	f	0
133	2020-03-11 17:01:42.459381	2020-03-11 17:01:42.459381	7	122	f	0
134	2020-03-11 17:01:45.372199	2020-03-11 17:01:45.372199	7	123	f	0
201	2020-03-11 18:06:04.222525	2020-03-11 18:06:04.222525	8	191	f	0
202	2020-03-11 18:06:09.743847	2020-03-11 18:06:09.743847	8	192	f	0
203	2020-03-11 18:06:12.875445	2020-03-11 18:06:12.875445	8	193	f	0
204	2020-03-11 18:06:16.458025	2020-03-11 18:06:16.458025	8	194	f	0
205	2020-03-11 18:06:19.318644	2020-03-11 18:06:19.318644	8	195	f	0
206	2020-03-11 18:06:22.549711	2020-03-11 18:06:22.549711	8	196	f	0
207	2020-03-11 18:06:32.363649	2020-03-11 18:06:32.363649	8	197	f	0
208	2020-03-11 18:06:35.387933	2020-03-11 18:06:35.387933	8	198	f	0
209	2020-03-11 18:06:38.579264	2020-03-11 18:06:38.579264	8	199	f	0
210	2020-03-11 18:06:41.85934	2020-03-11 18:06:41.85934	8	200	f	0
211	2020-03-11 18:06:45.612394	2020-03-11 18:06:45.612394	8	201	f	0
212	2020-03-11 18:06:48.738731	2020-03-11 18:06:48.738731	8	202	f	0
231	2020-03-18 18:04:42.603956	2020-03-18 18:04:42.603956	10	229	f	0
232	2020-03-18 18:04:56.875423	2020-03-18 18:04:56.875423	10	228	f	0
233	2020-03-18 19:03:49.472351	2020-03-18 19:03:49.472351	9	232	f	0
234	2020-03-18 19:23:00.686911	2020-03-18 19:23:00.686911	9	238	f	0
235	2020-03-18 20:04:15.382972	2020-03-18 20:04:15.382972	9	240	f	0
236	2020-03-18 20:04:20.570318	2020-03-18 20:04:20.570318	10	240	f	0
237	2020-03-18 20:07:40.861248	2020-03-18 20:07:40.861248	10	241	f	0
238	2020-03-18 20:17:49.0538	2020-03-18 20:17:49.0538	10	242	f	0
239	2020-03-18 20:17:55.980701	2020-03-18 20:17:55.980701	9	242	f	0
240	2020-03-18 20:27:42.779451	2020-03-18 20:27:42.779451	10	244	f	0
241	2020-03-18 20:30:51.987718	2020-03-18 20:30:51.987718	10	243	f	0
242	2020-03-18 20:41:27.417078	2020-03-18 20:41:27.417078	10	245	f	0
41	2020-02-21 08:05:51.139925	2020-03-22 09:14:16.018229	3	49	f	0
253	2020-03-22 16:23:07.801475	2020-03-22 16:23:07.801475	8	138	f	0
254	2020-03-22 16:23:12.145957	2020-03-22 16:23:12.145957	8	137	f	0
255	2020-03-22 16:23:17.458041	2020-03-22 16:23:17.458041	8	136	f	0
1	2020-02-06 19:41:37.13651	2020-02-06 19:41:37.13651	1	7	f	0
2	2020-02-06 19:45:39.466756	2020-02-06 19:45:39.466756	1	8	f	0
3	2020-02-06 19:45:44.08894	2020-02-06 19:45:44.08894	1	9	f	0
4	2020-02-07 10:27:03.220067	2020-02-07 10:27:03.220067	1	10	f	0
7	2020-02-07 13:10:18.507596	2020-02-07 13:10:18.507596	1	13	f	0
8	2020-02-07 17:04:59.15859	2020-02-07 17:04:59.15859	1	14	f	0
9	2020-02-07 17:05:02.404884	2020-02-07 17:05:02.404884	1	15	f	0
10	2020-02-07 17:05:05.37419	2020-02-07 17:05:05.37419	1	16	f	0
11	2020-02-07 17:05:08.358459	2020-02-07 17:05:08.358459	1	17	f	0
12	2020-02-07 17:05:11.502425	2020-02-07 17:05:11.502425	1	18	f	0
13	2020-02-07 17:05:15.275038	2020-02-07 17:05:15.275038	1	19	f	0
14	2020-02-07 17:05:20.799597	2020-02-07 17:05:20.799597	1	20	f	0
15	2020-02-07 17:05:24.204393	2020-02-07 17:05:24.204393	1	21	f	0
16	2020-02-07 17:05:27.372076	2020-02-07 17:05:27.372076	1	22	f	0
17	2020-02-07 17:05:30.635926	2020-02-07 17:05:30.635926	1	23	f	0
18	2020-02-07 17:05:34.478216	2020-02-07 17:05:34.478216	1	24	f	0
19	2020-02-07 17:05:37.925274	2020-02-07 17:05:37.925274	1	25	f	0
20	2020-02-07 17:05:41.014396	2020-02-07 17:05:41.014396	1	26	f	0
21	2020-02-07 17:05:44.194159	2020-02-07 17:05:44.194159	1	27	f	0
22	2020-02-07 17:05:47.595734	2020-02-07 17:05:47.595734	1	28	f	0
23	2020-02-07 17:05:50.495269	2020-02-07 17:05:50.495269	1	29	f	0
24	2020-02-07 17:05:53.957252	2020-02-07 17:05:53.957252	1	30	f	0
25	2020-02-07 17:05:57.171679	2020-02-07 17:05:57.171679	1	31	f	0
26	2020-02-07 17:06:01.738291	2020-02-07 17:06:01.738291	1	32	f	0
27	2020-02-07 17:06:05.511315	2020-02-07 17:06:05.511315	1	33	f	0
28	2020-02-07 17:06:08.819854	2020-02-07 17:06:08.819854	1	34	f	0
29	2020-02-07 17:06:12.006573	2020-02-07 17:06:12.006573	1	35	f	0
30	2020-02-07 17:06:15.987347	2020-02-07 17:06:15.987347	1	36	f	0
31	2020-02-07 17:06:19.195281	2020-02-07 17:06:19.195281	1	37	f	0
32	2020-02-07 17:06:22.211947	2020-02-07 17:06:22.211947	1	38	f	0
33	2020-02-07 17:06:25.301084	2020-02-07 17:06:25.301084	1	39	f	0
37	2020-02-19 11:59:01.395122	2020-02-19 11:59:01.395122	2	45	f	0
38	2020-02-19 11:59:12.295021	2020-02-19 11:59:12.295021	2	47	f	0
39	2020-02-19 11:59:19.528982	2020-02-19 11:59:19.528982	2	46	f	0
40	2020-02-21 08:05:45.059262	2020-02-21 08:05:45.059262	3	48	f	0
42	2020-02-21 08:05:54.660938	2020-02-21 08:05:54.660938	3	50	f	0
43	2020-02-21 08:05:57.860614	2020-02-21 08:05:57.860614	3	51	f	0
44	2020-02-21 08:06:01.570836	2020-02-21 08:06:01.570836	3	52	f	0
45	2020-02-21 08:10:11.366412	2020-02-21 08:10:11.366412	3	53	f	0
46	2020-02-21 08:12:37.879142	2020-02-21 08:12:37.879142	3	54	f	0
47	2020-02-21 08:19:40.656942	2020-02-21 08:19:40.656942	3	55	f	0
48	2020-02-21 08:19:44.84831	2020-02-21 08:19:44.84831	3	56	f	0
49	2020-02-21 08:25:01.594242	2020-02-21 08:25:01.594242	3	57	f	0
50	2020-02-21 08:25:05.200711	2020-02-21 08:25:05.200711	3	58	f	0
51	2020-02-21 08:26:21.104691	2020-02-21 08:26:21.104691	3	59	f	0
52	2020-02-21 08:33:15.365227	2020-02-21 08:33:15.365227	3	60	f	0
53	2020-02-21 08:33:21.229602	2020-02-21 08:33:21.229602	3	61	f	0
55	2020-02-21 08:33:27.858711	2020-02-21 08:33:27.858711	3	63	f	0
56	2020-02-21 08:33:31.250137	2020-02-21 08:33:31.250137	3	64	f	0
57	2020-02-21 08:39:07.036878	2020-02-21 08:39:07.036878	3	65	f	0
58	2020-02-21 08:39:12.635499	2020-02-21 08:39:12.635499	3	66	f	0
59	2020-02-21 08:39:16.04409	2020-02-21 08:39:16.04409	3	67	f	0
60	2020-02-21 08:39:19.300808	2020-02-21 08:39:19.300808	3	68	f	0
61	2020-02-21 08:46:45.111868	2020-02-21 08:46:45.111868	3	69	f	0
62	2020-02-21 08:46:51.383701	2020-02-21 08:46:51.383701	3	70	f	0
63	2020-02-21 08:46:54.29173	2020-02-21 08:46:54.29173	3	71	f	0
64	2020-02-21 08:46:57.125759	2020-02-21 08:46:57.125759	3	72	f	0
65	2020-02-21 08:47:00.510245	2020-02-21 08:47:00.510245	3	73	f	0
66	2020-02-21 08:47:03.70611	2020-02-21 08:47:03.70611	3	74	f	0
67	2020-02-21 08:58:29.138784	2020-02-21 08:58:29.138784	3	75	f	0
68	2020-02-21 08:58:33.027143	2020-02-21 08:58:33.027143	3	76	f	0
69	2020-02-21 08:58:35.889193	2020-02-21 08:58:35.889193	3	77	f	0
70	2020-02-21 08:58:39.040469	2020-02-21 08:58:39.040469	3	78	f	0
81	2020-02-21 21:10:39.169314	2020-02-21 21:10:39.169314	4	79	f	0
225	2020-03-16 17:13:38.397015	2020-03-16 17:13:38.397015	9	226	f	0
248	2020-03-22 16:22:37.746998	2020-03-22 16:22:37.746998	8	143	f	0
103	2020-03-06 16:03:58.941288	2020-03-06 16:03:58.941288	6	92	f	0
104	2020-03-06 16:10:41.48074	2020-03-06 16:10:41.48074	6	93	f	0
105	2020-03-06 16:15:19.849325	2020-03-06 16:15:19.849325	6	94	f	0
106	2020-03-06 16:25:21.54798	2020-03-06 16:25:21.54798	6	95	f	0
107	2020-03-06 16:33:20.596826	2020-03-06 16:33:20.596826	6	96	f	0
108	2020-03-06 16:38:29.344051	2020-03-06 16:38:29.344051	6	97	f	0
109	2020-03-06 16:41:35.694829	2020-03-06 16:41:35.694829	6	98	f	0
135	2020-03-11 17:11:37.815119	2020-03-11 17:11:37.815119	7	124	f	0
136	2020-03-11 17:11:41.311843	2020-03-11 17:11:41.311843	7	125	f	0
137	2020-03-11 17:11:44.151423	2020-03-11 17:11:44.151423	7	126	f	0
138	2020-03-11 17:11:47.05644	2020-03-11 17:11:47.05644	7	127	f	0
139	2020-03-11 17:11:49.951407	2020-03-11 17:11:49.951407	7	128	f	0
140	2020-03-11 17:11:52.908828	2020-03-11 17:11:52.908828	7	129	f	0
141	2020-03-11 17:11:56.50978	2020-03-11 17:11:56.50978	7	130	f	0
142	2020-03-11 17:11:59.742275	2020-03-11 17:11:59.742275	7	131	f	0
143	2020-03-11 17:12:02.493374	2020-03-11 17:12:02.493374	7	132	f	0
144	2020-03-11 17:12:05.430207	2020-03-11 17:12:05.430207	7	133	f	0
145	2020-03-11 17:12:08.474372	2020-03-11 17:12:08.474372	7	134	f	0
146	2020-03-11 17:12:12.769524	2020-03-11 17:12:12.769524	7	135	f	0
147	2020-03-11 17:12:15.866701	2020-03-11 17:12:15.866701	7	136	f	0
148	2020-03-11 17:12:20.109329	2020-03-11 17:12:20.109329	7	137	f	0
149	2020-03-11 17:12:23.168029	2020-03-11 17:12:23.168029	7	138	f	0
150	2020-03-11 17:12:25.86171	2020-03-11 17:12:25.86171	7	139	f	0
151	2020-03-11 17:12:29.206819	2020-03-11 17:12:29.206819	7	140	f	0
152	2020-03-11 17:12:31.969851	2020-03-11 17:12:31.969851	7	141	f	0
153	2020-03-11 17:12:34.70569	2020-03-11 17:12:34.70569	7	142	f	0
154	2020-03-11 17:12:37.614574	2020-03-11 17:12:37.614574	7	143	f	0
155	2020-03-11 17:37:22.57375	2020-03-11 17:37:22.57375	8	144	f	0
156	2020-03-11 17:37:27.615335	2020-03-11 17:37:27.615335	8	145	f	0
157	2020-03-11 17:37:30.365388	2020-03-11 17:37:30.365388	8	146	f	0
158	2020-03-11 17:37:33.622597	2020-03-11 17:37:33.622597	8	147	f	0
159	2020-03-11 17:37:36.772721	2020-03-11 17:37:36.772721	8	148	f	0
160	2020-03-11 17:37:39.572876	2020-03-11 17:37:39.572876	8	149	f	0
161	2020-03-11 17:37:42.636984	2020-03-11 17:37:42.636984	8	150	f	0
162	2020-03-11 17:37:45.635768	2020-03-11 17:37:45.635768	8	151	f	0
163	2020-03-11 17:41:15.102822	2020-03-11 17:41:15.102822	8	152	f	0
164	2020-03-11 17:41:18.515892	2020-03-11 17:41:18.515892	8	153	f	0
165	2020-03-11 17:41:21.397594	2020-03-11 17:41:21.397594	8	154	f	0
166	2020-03-11 17:41:23.933651	2020-03-11 17:41:23.933651	8	155	f	0
167	2020-03-11 17:41:26.687211	2020-03-11 17:41:26.687211	8	156	f	0
168	2020-03-11 17:41:29.454122	2020-03-11 17:41:29.454122	8	157	f	0
169	2020-03-11 17:45:31.970715	2020-03-11 17:45:31.970715	8	158	f	0
170	2020-03-11 17:45:35.278979	2020-03-11 17:45:35.278979	8	159	f	0
171	2020-03-11 17:45:38.214082	2020-03-11 17:45:38.214082	8	160	f	0
172	2020-03-11 17:45:41.997826	2020-03-11 17:45:41.997826	8	161	f	0
173	2020-03-11 17:45:45.030593	2020-03-11 17:45:45.030593	8	162	f	0
174	2020-03-11 17:45:47.856261	2020-03-11 17:45:47.856261	8	163	f	0
175	2020-03-11 17:45:50.745173	2020-03-11 17:45:50.745173	8	164	f	0
176	2020-03-11 17:45:53.88061	2020-03-11 17:45:53.88061	8	165	f	0
177	2020-03-11 17:51:52.41774	2020-03-11 17:51:52.41774	8	166	f	0
178	2020-03-11 17:51:56.266315	2020-03-11 17:51:56.266315	8	167	f	0
179	2020-03-11 17:51:59.490353	2020-03-11 17:51:59.490353	8	168	f	0
180	2020-03-11 17:52:02.456714	2020-03-11 17:52:02.456714	8	169	f	0
181	2020-03-11 17:52:05.763678	2020-03-11 17:52:05.763678	8	170	f	0
182	2020-03-11 17:52:08.649932	2020-03-11 17:52:08.649932	8	171	f	0
183	2020-03-11 17:52:11.755723	2020-03-11 17:52:11.755723	8	172	f	0
184	2020-03-11 17:52:17.024273	2020-03-11 17:52:17.024273	8	173	f	0
185	2020-03-11 17:52:20.238923	2020-03-11 17:52:20.238923	8	174	f	0
186	2020-03-11 17:52:23.12761	2020-03-11 17:52:23.12761	8	175	f	0
187	2020-03-11 17:52:25.792655	2020-03-11 17:52:25.792655	8	176	f	0
188	2020-03-11 17:52:28.570608	2020-03-11 17:52:28.570608	8	177	f	0
189	2020-03-11 17:52:31.648151	2020-03-11 17:52:31.648151	8	178	f	0
190	2020-03-11 17:58:44.876202	2020-03-11 17:58:44.876202	8	180	f	0
191	2020-03-11 17:58:54.240914	2020-03-11 17:58:54.240914	8	181	f	0
192	2020-03-11 17:58:58.70612	2020-03-11 17:58:58.70612	8	182	f	0
193	2020-03-11 17:59:01.955463	2020-03-11 17:59:01.955463	8	183	f	0
194	2020-03-11 17:59:04.617558	2020-03-11 17:59:04.617558	8	184	f	0
195	2020-03-11 17:59:08.056646	2020-03-11 17:59:08.056646	8	185	f	0
196	2020-03-11 17:59:11.395737	2020-03-11 17:59:11.395737	8	186	f	0
197	2020-03-11 17:59:14.309535	2020-03-11 17:59:14.309535	8	187	f	0
198	2020-03-11 17:59:17.657219	2020-03-11 17:59:17.657219	8	188	f	0
199	2020-03-11 17:59:20.780484	2020-03-11 17:59:20.780484	8	189	f	0
200	2020-03-11 17:59:24.010623	2020-03-11 17:59:24.010623	8	190	f	0
216	2020-03-16 15:15:42.620956	2020-03-16 15:15:42.620956	9	217	f	0
217	2020-03-16 15:15:51.352163	2020-03-16 15:15:51.352163	9	220	f	0
218	2020-03-16 15:15:55.472861	2020-03-16 15:15:55.472861	9	219	f	0
220	2020-03-16 15:16:12.845529	2020-03-16 15:16:12.845529	9	221	f	0
221	2020-03-16 16:00:33.939963	2020-03-16 16:00:33.939963	9	222	f	0
226	2020-03-16 17:42:12.564881	2020-03-16 17:42:12.564881	9	227	f	0
222	2020-03-16 16:18:59.254574	2020-03-16 16:21:14.066564	9	223	f	0
223	2020-03-16 16:55:26.936314	2020-03-16 16:55:26.936314	9	224	f	0
224	2020-03-16 16:58:38.007076	2020-03-16 16:58:38.007076	9	225	f	0
227	2020-03-16 17:49:47.373087	2020-03-16 17:49:47.373087	9	228	f	0
228	2020-03-16 17:50:55.522567	2020-03-16 17:50:55.522567	9	229	f	0
229	2020-03-16 18:02:28.490724	2020-03-16 18:02:28.490724	9	230	f	0
230	2020-03-16 18:21:47.668714	2020-03-16 18:21:47.668714	9	231	f	0
243	2020-03-21 21:41:23.68489	2020-03-21 21:41:23.68489	10	247	f	0
244	2020-03-21 21:54:48.251155	2020-03-21 21:54:48.251155	9	248	f	0
245	2020-03-21 21:54:55.191855	2020-03-21 21:54:55.191855	10	248	f	0
246	2020-03-21 22:00:58.488103	2020-03-21 22:00:58.488103	10	249	f	0
247	2020-03-21 22:01:03.092703	2020-03-21 22:01:03.092703	9	249	f	0
54	2020-02-21 08:33:24.467577	2020-03-22 09:13:26.404302	3	62	f	0
249	2020-03-22 16:22:43.85643	2020-03-22 16:22:43.85643	8	142	f	0
250	2020-03-22 16:22:48.729595	2020-03-22 16:22:48.729595	8	141	f	0
251	2020-03-22 16:22:54.602329	2020-03-22 16:22:54.602329	8	140	f	0
256	2020-03-22 16:23:22.017216	2020-03-22 16:23:22.017216	8	135	f	0
257	2020-03-22 16:23:29.13227	2020-03-22 16:23:29.13227	8	134	f	0
258	2020-03-22 16:23:36.08217	2020-03-22 16:23:36.08217	8	133	f	0
259	2020-03-22 16:23:40.754357	2020-03-22 16:23:40.754357	8	132	f	0
260	2020-03-22 16:23:46.8985	2020-03-22 16:23:46.8985	8	131	f	0
261	2020-03-22 16:23:51.503691	2020-03-22 16:23:51.503691	8	130	f	0
262	2020-03-22 16:23:56.363539	2020-03-22 16:23:56.363539	8	129	f	0
263	2020-03-22 16:24:00.892095	2020-03-22 16:24:00.892095	8	128	f	0
264	2020-03-22 16:24:09.314599	2020-03-22 16:24:09.314599	8	127	f	0
265	2020-03-22 16:24:14.608041	2020-03-22 16:24:14.608041	8	126	f	0
266	2020-03-22 16:24:19.124386	2020-03-22 16:24:19.124386	8	125	f	0
267	2020-03-22 16:24:24.018027	2020-03-22 16:24:24.018027	8	124	f	0
268	2020-03-22 16:24:32.841538	2020-03-22 16:24:32.841538	8	123	f	0
269	2020-03-22 16:24:38.506593	2020-03-22 16:24:38.506593	8	122	f	0
270	2020-03-22 16:24:43.368614	2020-03-22 16:24:43.368614	8	121	f	0
271	2020-03-22 16:24:47.780499	2020-03-22 16:24:47.780499	8	120	f	0
272	2020-03-22 16:24:54.017074	2020-03-22 16:24:54.017074	8	119	f	0
273	2020-03-22 16:25:00.459232	2020-03-22 16:25:00.459232	8	118	f	0
274	2020-03-22 16:25:06.168739	2020-03-22 16:25:06.168739	8	117	f	0
275	2020-03-22 16:25:11.738252	2020-03-22 16:25:11.738252	8	116	f	0
276	2020-03-22 16:25:17.624929	2020-03-22 16:25:17.624929	8	115	f	0
277	2020-03-22 16:25:22.771216	2020-03-22 16:25:22.771216	8	114	f	0
278	2020-03-22 16:25:27.611115	2020-03-22 16:25:27.611115	8	113	f	0
279	2020-03-22 16:25:32.707019	2020-03-22 16:25:32.707019	8	112	f	0
280	2020-03-22 16:25:40.692295	2020-03-22 16:25:40.692295	8	111	f	0
281	2020-03-22 16:25:45.849512	2020-03-22 16:25:45.849512	8	110	f	0
282	2020-03-22 16:25:50.663968	2020-03-22 16:25:50.663968	8	109	f	0
283	2020-03-22 16:25:55.794218	2020-03-22 16:25:55.794218	8	108	f	0
284	2020-03-22 16:26:01.033554	2020-03-22 16:26:01.033554	8	107	f	0
285	2020-03-22 16:26:05.89862	2020-03-22 16:26:05.89862	8	106	f	0
286	2020-03-22 16:26:11.099629	2020-03-22 16:26:11.099629	8	105	f	0
287	2020-03-22 16:26:16.97783	2020-03-22 16:26:16.97783	8	104	f	0
288	2020-03-22 16:26:27.139941	2020-03-22 16:26:27.139941	8	103	f	0
289	2020-03-22 16:26:32.218032	2020-03-22 16:26:32.218032	8	102	f	0
290	2020-03-22 16:26:37.875866	2020-03-22 16:26:37.875866	8	101	f	0
291	2020-03-22 16:26:43.121885	2020-03-22 16:26:43.121885	8	100	f	0
292	2020-03-22 16:26:48.514425	2020-03-22 16:26:48.514425	8	99	f	0
293	2020-03-22 17:18:04.188673	2020-03-22 17:18:04.188673	8	45	f	0
294	2020-03-23 18:34:26.232365	2020-03-23 18:34:26.232365	5	250	f	0
295	2020-03-23 18:34:30.087036	2020-03-23 18:34:30.087036	6	250	f	0
296	2020-03-23 19:04:02.656323	2020-03-23 19:04:02.656323	11	252	f	0
297	2020-03-23 19:04:07.061286	2020-03-23 19:04:07.061286	11	253	f	0
298	2020-03-23 19:20:34.363864	2020-03-23 19:20:34.363864	11	254	f	0
299	2020-03-23 20:17:10.840439	2020-03-23 20:17:10.840439	11	256	f	0
302	2020-03-24 14:49:05.099562	2020-03-24 14:49:05.099562	4	256	f	0
303	2020-03-24 14:49:12.867077	2020-03-24 14:49:12.867077	4	254	f	0
304	2020-03-24 14:49:16.450461	2020-03-24 14:49:16.450461	4	253	f	0
305	2020-03-24 14:49:22.482986	2020-03-24 14:49:22.482986	4	252	f	0
306	2020-03-24 14:49:44.649722	2020-03-24 14:49:44.649722	4	211	f	0
307	2020-03-24 14:49:58.649612	2020-03-24 14:49:58.649612	4	210	f	0
88	2020-03-05 14:47:17.411431	2020-03-24 17:53:29.404541	5	84	f	0
308	2020-03-24 21:02:10.449999	2020-03-24 21:02:10.449999	10	257	f	0
309	2020-03-24 21:06:04.725332	2020-03-24 21:06:04.725332	10	258	f	0
310	2020-03-24 21:17:16.541142	2020-03-24 21:17:16.541142	9	259	f	0
311	2020-03-24 21:19:08.777377	2020-03-24 21:19:08.777377	9	260	f	0
312	2020-03-24 21:28:20.049557	2020-03-24 21:28:20.049557	9	261	f	0
313	2020-03-24 21:28:26.348458	2020-03-24 21:28:26.348458	10	261	f	0
314	2020-04-01 19:42:05.152437	2020-04-01 19:42:05.152437	5	262	f	0
315	2020-04-01 20:17:00.751305	2020-04-01 20:17:00.751305	5	263	f	0
316	2020-04-01 20:21:58.514976	2020-04-01 20:21:58.514976	5	264	f	0
317	2020-04-01 20:23:25.685291	2020-04-01 20:23:25.685291	5	265	f	0
318	2020-04-01 20:26:05.296694	2020-04-01 20:26:05.296694	5	266	f	0
319	2020-04-06 12:58:59.129954	2020-04-06 12:58:59.129954	12	267	f	0
320	2020-04-06 12:59:02.988023	2020-04-06 12:59:02.988023	12	268	f	0
321	2020-04-06 13:03:11.407306	2020-04-06 13:03:11.407306	12	269	f	0
322	2020-04-06 13:44:05.181161	2020-04-06 13:44:05.181161	12	270	f	0
323	2020-04-06 14:25:38.195269	2020-04-06 14:25:38.195269	12	273	f	0
324	2020-04-06 14:25:46.204217	2020-04-06 14:25:46.204217	12	272	f	0
325	2020-04-06 14:26:49.218888	2020-04-06 14:26:49.218888	12	271	f	0
326	2020-04-06 17:02:02.301624	2020-04-06 17:02:02.301624	12	274	f	0
327	2020-04-06 17:02:40.154967	2020-04-06 17:02:40.154967	12	275	f	0
328	2020-04-06 17:14:12.034514	2020-04-06 17:14:12.034514	12	276	f	0
329	2020-04-06 17:18:32.381472	2020-04-06 17:18:32.381472	12	277	f	0
330	2020-04-06 17:38:44.365498	2020-04-06 17:38:44.365498	12	278	f	0
331	2020-04-06 17:40:28.706691	2020-04-06 17:40:28.706691	12	279	f	0
332	2020-04-06 18:30:42.6565	2020-04-06 18:30:42.6565	12	280	f	0
333	2020-04-06 18:32:08.533848	2020-04-06 18:32:08.533848	12	281	f	0
334	2020-04-07 19:59:42.778748	2020-04-07 19:59:42.778748	12	282	f	0
335	2020-04-07 20:33:16.672595	2020-04-07 20:33:16.672595	12	284	f	0
336	2020-04-07 20:39:57.854513	2020-04-07 20:39:57.854513	12	285	f	0
337	2020-04-07 20:52:13.365526	2020-04-07 20:52:13.365526	12	286	f	0
338	2020-04-08 16:36:25.978046	2020-04-08 16:36:25.978046	13	287	f	0
339	2020-04-08 17:01:09.548195	2020-04-08 17:01:09.548195	13	290	f	0
342	2020-04-08 17:09:06.722367	2020-04-08 17:09:06.722367	13	291	f	0
343	2020-04-08 17:11:37.628777	2020-04-08 17:11:37.628777	13	292	f	0
344	2020-04-08 20:16:46.294837	2020-04-08 20:16:46.294837	10	293	f	0
345	2020-04-08 20:39:16.414556	2020-04-08 20:39:16.414556	10	294	f	0
346	2020-04-08 20:43:07.340552	2020-04-08 20:43:07.340552	10	295	f	0
347	2020-04-08 20:44:11.240233	2020-04-08 20:44:11.240233	10	296	f	0
348	2020-04-08 20:48:55.351332	2020-04-08 20:48:55.351332	10	80	f	0
352	2020-04-08 21:16:50.480325	2020-04-08 21:16:50.480325	10	298	f	0
353	2020-04-08 21:25:31.50016	2020-04-08 21:25:31.50016	10	299	f	0
354	2020-04-08 21:43:17.584033	2020-04-08 21:43:17.584033	10	300	f	0
355	2020-04-08 21:50:56.456919	2020-04-08 21:50:56.456919	9	300	f	0
356	2020-04-08 22:00:45.132265	2020-04-08 22:00:45.132265	10	301	f	0
357	2020-04-08 22:10:24.644654	2020-04-08 22:10:24.644654	10	302	f	0
358	2020-04-09 18:03:54.972022	2020-04-09 18:03:54.972022	13	303	f	0
359	2020-04-09 18:04:28.633383	2020-04-09 18:04:28.633383	13	304	f	0
360	2020-04-09 18:34:50.153559	2020-04-09 18:34:50.153559	13	305	f	0
361	2020-04-09 19:50:57.121093	2020-04-09 19:50:57.121093	12	306	f	0
362	2020-04-11 17:37:45.692671	2020-04-11 17:37:45.692671	12	307	f	0
363	2020-04-11 19:15:25.681832	2020-04-11 19:15:25.681832	12	308	f	0
364	2020-04-11 19:21:37.990331	2020-04-11 19:21:37.990331	12	309	f	0
365	2020-04-11 19:33:57.000811	2020-04-11 19:33:57.000811	12	310	f	0
366	2020-04-11 19:47:26.650873	2020-04-11 19:47:26.650873	12	311	f	0
367	2020-04-11 19:48:13.063357	2020-04-11 19:48:13.063357	12	312	f	0
368	2020-04-11 19:48:54.20017	2020-04-11 19:48:54.20017	12	313	f	0
369	2020-04-11 19:51:10.537251	2020-04-11 19:51:10.537251	12	314	f	0
370	2020-04-11 19:54:43.43953	2020-04-11 19:54:43.43953	12	315	f	0
371	2020-04-11 20:02:13.431887	2020-04-11 20:02:13.431887	12	316	f	0
372	2020-04-11 20:04:33.923073	2020-04-11 20:04:33.923073	12	317	f	0
373	2020-04-11 20:06:46.41454	2020-04-11 20:06:46.41454	12	318	f	0
374	2020-04-11 20:13:16.908125	2020-04-11 20:13:16.908125	12	319	f	0
375	2020-04-11 20:15:12.103578	2020-04-11 20:15:12.103578	12	320	f	0
376	2020-04-11 20:25:26.188556	2020-04-11 20:25:26.188556	12	321	f	0
377	2020-04-11 20:28:32.103905	2020-04-11 20:28:32.103905	12	322	f	0
379	2020-04-12 13:50:02.152252	2020-04-12 13:50:02.152252	12	323	f	0
383	2020-04-23 16:38:28.822217	2020-04-23 16:38:28.822217	12	329	f	0
384	2020-04-23 17:41:13.431695	2020-04-23 17:41:13.431695	12	330	f	0
385	2020-04-23 18:27:28.75238	2020-04-23 18:27:28.75238	12	331	f	0
386	2020-04-23 18:31:10.637148	2020-04-23 18:31:10.637148	12	332	f	0
387	2020-04-23 18:46:16.80767	2020-04-23 18:46:16.80767	12	333	f	0
388	2020-04-23 18:57:57.298581	2020-04-23 18:57:57.298581	12	334	f	0
389	2020-04-23 19:39:17.284072	2020-04-23 19:39:17.284072	12	335	f	0
390	2020-04-23 19:50:05.204678	2020-04-23 19:50:05.204678	12	336	f	0
391	2020-04-23 19:53:01.054109	2020-04-23 19:53:01.054109	12	337	f	0
392	2020-04-24 08:08:31.153766	2020-04-24 08:08:31.153766	12	338	f	0
393	2020-04-24 08:11:38.709414	2020-04-24 08:11:38.709414	12	339	f	0
394	2020-04-24 08:20:08.53031	2020-04-24 08:20:08.53031	12	340	f	0
395	2020-04-24 12:27:48.154756	2020-04-24 12:27:48.154756	12	341	f	0
396	2020-04-24 12:28:58.582947	2020-04-24 12:28:58.582947	12	342	f	0
397	2020-04-24 12:32:46.479817	2020-04-24 12:32:46.479817	12	343	f	0
398	2020-04-24 12:38:50.351307	2020-04-24 12:38:50.351307	12	344	f	0
399	2020-04-24 12:41:14.518842	2020-04-24 12:41:14.518842	12	345	f	0
400	2020-04-24 12:43:25.125277	2020-04-24 12:43:25.125277	12	346	f	0
401	2020-04-25 17:30:43.591272	2020-04-25 17:30:43.591272	12	347	f	0
402	2020-04-25 18:06:01.310623	2020-04-25 18:06:01.310623	12	348	f	0
403	2020-04-25 18:29:52.019454	2020-04-25 18:29:52.019454	12	349	f	0
404	2020-04-25 18:35:17.993558	2020-04-25 18:35:17.993558	12	350	f	0
405	2020-04-25 18:37:29.37391	2020-04-25 18:37:29.37391	12	351	f	0
406	2020-04-25 19:05:59.153704	2020-04-25 19:05:59.153704	12	352	f	0
407	2020-04-25 19:22:12.412603	2020-04-25 19:22:12.412603	12	353	f	0
408	2020-04-25 19:38:14.825561	2020-04-25 19:38:14.825561	12	354	f	0
409	2020-04-25 19:41:55.993582	2020-04-25 19:41:55.993582	12	355	f	0
411	2020-04-25 20:35:58.30004	2020-04-25 20:35:58.30004	12	356	f	0
412	2020-04-25 20:50:57.251969	2020-04-25 20:50:57.251969	12	357	f	0
413	2020-04-28 07:20:01.378802	2020-04-28 07:20:01.378802	12	358	f	0
414	2020-05-18 22:13:34.804888	2020-05-18 22:13:34.804888	14	360	f	0
416	2020-05-18 22:30:00.207425	2020-05-18 22:30:00.207425	14	362	f	0
417	2020-05-18 22:32:02.260418	2020-05-18 22:32:02.260418	14	363	f	0
419	2020-05-19 22:43:13.637333	2020-05-19 22:43:13.637333	15	364	f	0
420	2020-05-19 22:43:19.079857	2020-05-19 22:43:19.079857	15	365	f	0
421	2020-05-19 22:44:20.241396	2020-05-19 22:44:20.241396	15	366	f	0
422	2020-05-19 22:46:19.255096	2020-05-19 22:46:19.255096	15	367	f	0
423	2020-05-25 21:54:31.663426	2020-05-25 21:57:17.157957	14	223	t	0
425	2020-05-25 22:02:15.112088	2020-05-25 22:02:15.112088	10	362	f	0
426	2020-05-25 22:07:16.348045	2020-05-25 22:07:16.348045	14	368	f	0
427	2020-05-25 22:30:54.253273	2020-05-25 22:30:54.253273	14	369	f	0
428	2020-06-06 16:16:38.874387	2020-06-06 16:16:38.874387	14	370	f	0
429	2020-06-06 16:40:01.319558	2020-06-06 16:40:01.319558	14	371	f	0
430	2020-06-06 16:41:33.063092	2020-06-06 16:41:33.063092	14	258	f	0
431	2020-06-06 16:41:42.000923	2020-06-06 16:41:42.000923	14	257	f	0
432	2020-06-06 16:51:49.683769	2020-06-06 16:51:49.683769	14	372	f	0
433	2020-06-06 20:12:56.733656	2020-06-06 20:12:56.733656	14	373	f	0
434	2020-06-06 20:32:32.115986	2020-06-06 20:32:32.115986	14	374	f	0
435	2020-06-07 09:25:39.183758	2020-06-07 09:25:39.183758	14	375	f	0
436	2020-06-07 09:26:36.605091	2020-06-07 09:26:36.605091	14	242	f	0
437	2020-06-07 09:34:46.537053	2020-06-07 09:34:46.537053	14	376	f	0
438	2020-06-07 09:58:48.781656	2020-06-07 09:58:48.781656	14	377	f	0
439	2020-06-07 10:24:19.972732	2020-06-07 10:24:19.972732	14	378	f	0
440	2020-06-07 10:33:22.228579	2020-06-07 10:33:22.228579	14	379	f	0
441	2020-06-07 10:42:14.494972	2020-06-07 10:42:14.494972	14	380	f	0
442	2020-06-07 11:14:03.921096	2020-06-07 11:14:03.921096	14	381	f	0
443	2020-06-07 11:16:17.624979	2020-06-07 11:16:17.624979	14	382	f	0
444	2020-06-07 11:59:57.235179	2020-06-07 11:59:57.235179	14	383	f	0
446	2020-06-29 20:01:29.24723	2020-06-29 20:01:29.24723	16	385	f	0
448	2020-06-29 20:06:06.857125	2020-06-29 20:06:06.857125	16	268	f	0
449	2020-06-29 20:10:08.474859	2020-06-29 20:10:08.474859	16	318	f	0
454	2020-07-03 22:05:36.541089	2020-07-03 22:05:36.541089	17	387	f	0
455	2020-07-03 22:06:26.775546	2020-07-03 22:06:26.775546	17	367	f	0
456	2020-07-03 22:12:59.112297	2020-07-03 22:12:59.112297	17	366	f	0
\.


--
-- Name: timeline_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.timeline_event_id_seq', 456, true);


--
-- Name: timeline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.timeline_id_seq', 17, true);


--
-- Data for Name: timeline_person; Type: TABLE DATA; Schema: public; Owner: anderauser
--

COPY public.timeline_person (id, created, modified, timeline_fk, person_fk) FROM stdin;
4	2020-03-06 08:53:30.151404	2020-03-06 08:53:30.151404	5	36
5	2020-03-06 10:28:45.794155	2020-03-06 10:28:45.794155	5	37
6	2020-03-06 10:54:45.939188	2020-03-06 10:54:45.939188	5	39
10	2020-03-07 07:54:25.48627	2020-03-07 07:54:25.48627	3	35
11	2020-03-11 17:16:41.839615	2020-03-11 17:16:41.839615	7	41
12	2020-03-16 15:16:35.685416	2020-03-16 15:16:35.685416	9	48
13	2020-03-16 15:21:20.208728	2020-03-16 15:21:20.208728	9	49
14	2020-03-16 15:21:34.284535	2020-03-16 15:21:34.284535	9	50
15	2020-03-16 16:42:00.893295	2020-03-16 16:42:00.893295	9	51
16	2020-03-16 17:36:31.174465	2020-03-16 17:36:31.174465	9	52
17	2020-03-22 17:22:48.405871	2020-03-22 17:22:48.405871	7	53
18	2020-03-22 17:25:00.759117	2020-03-22 17:25:00.759117	7	56
19	2020-03-22 17:25:07.513239	2020-03-22 17:25:07.513239	7	55
20	2020-03-22 17:25:14.296374	2020-03-22 17:25:14.296374	7	54
21	2020-03-23 18:40:32.073716	2020-03-23 18:40:32.073716	5	57
22	2020-03-23 18:40:37.67371	2020-03-23 18:40:37.67371	6	57
23	2020-03-23 18:43:02.345955	2020-03-23 18:43:02.345955	6	58
24	2020-03-23 18:43:06.19217	2020-03-23 18:43:06.19217	5	58
25	2020-03-23 18:45:41.306788	2020-03-23 18:45:41.306788	5	59
26	2020-03-23 18:45:45.249506	2020-03-23 18:45:45.249506	6	59
27	2020-03-23 19:04:21.27232	2020-03-23 19:04:21.27232	11	40
28	2020-03-23 19:15:49.980583	2020-03-23 19:15:49.980583	11	60
29	2020-03-24 20:01:31.434449	2020-03-24 20:01:31.434449	10	61
30	2020-03-24 20:09:41.038771	2020-03-24 20:09:41.038771	10	62
31	2020-03-24 20:40:43.809297	2020-03-24 20:40:43.809297	10	63
32	2020-03-24 20:44:39.007259	2020-03-24 20:44:39.007259	10	64
33	2020-03-24 20:47:31.783965	2020-03-24 20:47:31.783965	10	65
34	2020-03-24 20:50:57.084923	2020-03-24 20:50:57.084923	10	66
35	2020-03-24 21:28:51.382742	2020-03-24 21:28:51.382742	10	50
36	2020-04-01 20:14:07.371144	2020-04-01 20:14:07.371144	5	67
37	2020-04-06 17:47:51.286635	2020-04-06 17:47:51.286635	12	68
38	2020-04-06 18:31:36.378054	2020-04-06 18:31:36.378054	12	69
39	2020-04-08 16:33:37.582558	2020-04-08 16:33:37.582558	13	70
40	2020-04-08 20:37:17.084085	2020-04-08 20:37:17.084085	10	71
41	2020-04-11 20:21:49.728717	2020-04-11 20:21:49.728717	12	72
42	2020-04-23 18:32:18.733083	2020-04-23 18:32:18.733083	12	73
43	2020-04-28 09:19:23.662401	2020-04-28 09:19:23.662401	12	74
44	2020-04-28 09:22:51.526133	2020-04-28 09:22:51.526133	12	75
45	2020-04-28 09:23:48.255864	2020-04-28 09:23:48.255864	12	76
46	2020-04-28 09:24:25.315017	2020-04-28 09:24:25.315017	12	77
47	2020-04-28 09:26:01.186848	2020-04-28 09:26:01.186848	12	30
48	2020-05-18 22:32:26.532813	2020-05-18 22:32:26.532813	14	82
49	2020-05-19 22:37:26.395482	2020-05-19 22:37:26.395482	15	84
50	2020-05-19 22:37:30.726205	2020-05-19 22:37:30.726205	15	83
51	2020-05-19 22:37:35.036259	2020-05-19 22:37:35.036259	15	81
52	2020-05-19 23:00:40.278475	2020-05-19 23:00:40.278475	15	87
53	2020-05-19 23:00:45.034168	2020-05-19 23:00:45.034168	15	86
54	2020-05-19 23:00:48.974313	2020-05-19 23:00:48.974313	15	85
55	2020-05-22 21:51:31.718996	2020-05-22 21:51:31.718996	15	88
56	2020-05-22 21:54:37.468813	2020-05-22 21:54:37.468813	15	89
57	2020-06-07 09:23:42.805278	2020-06-07 09:23:42.805278	14	90
58	2020-06-07 09:33:11.472196	2020-06-07 09:33:11.472196	14	91
59	2020-06-07 09:33:37.82906	2020-06-07 09:33:37.82906	14	71
60	2020-06-22 22:11:40.790299	2020-06-22 22:11:40.790299	15	92
61	2020-06-25 22:15:54.523661	2020-06-25 22:15:54.523661	15	93
\.


--
-- Name: timeline_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: anderauser
--

SELECT pg_catalog.setval('public.timeline_person_id_seq', 61, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- Name: brainstorm brainstorm_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm
    ADD CONSTRAINT brainstorm_pkey PRIMARY KEY (id);


--
-- Name: brainstorm_thought brainstorm_thought_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_thought
    ADD CONSTRAINT brainstorm_thought_pkey PRIMARY KEY (id);


--
-- Name: brainstorm_topic brainstorm_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_topic
    ADD CONSTRAINT brainstorm_topic_pkey PRIMARY KEY (id);


--
-- Name: brainstorm_topic_thought brainstorm_topic_thought_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_topic_thought
    ADD CONSTRAINT brainstorm_topic_thought_pkey PRIMARY KEY (id);


--
-- Name: chart_dataset_data chart_dataset_data_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_dataset_data
    ADD CONSTRAINT chart_dataset_data_pkey PRIMARY KEY (id);


--
-- Name: chart_dataset chart_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_dataset
    ADD CONSTRAINT chart_dataset_pkey PRIMARY KEY (id);


--
-- Name: chart_label chart_label_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_label
    ADD CONSTRAINT chart_label_pkey PRIMARY KEY (id);


--
-- Name: chart_legend_label_options chart_legend_label_options_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_legend_label_options
    ADD CONSTRAINT chart_legend_label_options_pkey PRIMARY KEY (id);


--
-- Name: chart_legend_options chart_legend_options_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_legend_options
    ADD CONSTRAINT chart_legend_options_pkey PRIMARY KEY (id);


--
-- Name: chart_options chart_options_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_options
    ADD CONSTRAINT chart_options_pkey PRIMARY KEY (id);


--
-- Name: chart chart_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart
    ADD CONSTRAINT chart_pkey PRIMARY KEY (id);


--
-- Name: chart_title_options chart_title_options_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_title_options
    ADD CONSTRAINT chart_title_options_pkey PRIMARY KEY (id);


--
-- Name: chart_tooltip_options chart_tooltip_options_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_tooltip_options
    ADD CONSTRAINT chart_tooltip_options_pkey PRIMARY KEY (id);


--
-- Name: era era_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.era
    ADD CONSTRAINT era_pkey PRIMARY KEY (id);


--
-- Name: essay_event essay_event_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_event
    ADD CONSTRAINT essay_event_pkey PRIMARY KEY (id);


--
-- Name: essay_note essay_note_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_note
    ADD CONSTRAINT essay_note_pkey PRIMARY KEY (id);


--
-- Name: essay_person essay_person_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_person
    ADD CONSTRAINT essay_person_pkey PRIMARY KEY (id);


--
-- Name: essay essay_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay
    ADD CONSTRAINT essay_pkey PRIMARY KEY (id);


--
-- Name: essay_reference essay_reference_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_reference
    ADD CONSTRAINT essay_reference_pkey PRIMARY KEY (id);


--
-- Name: essay_timeline essay_timeline_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_timeline
    ADD CONSTRAINT essay_timeline_pkey PRIMARY KEY (id);


--
-- Name: event_note event_note_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event_note
    ADD CONSTRAINT event_note_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: event_tag event_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_pkey PRIMARY KEY (id);


--
-- Name: month month_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.month
    ADD CONSTRAINT month_pkey PRIMARY KEY (id);


--
-- Name: person_note person_note_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person_note
    ADD CONSTRAINT person_note_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: person_tag person_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person_tag
    ADD CONSTRAINT person_tag_pkey PRIMARY KEY (id);


--
-- Name: reference_author reference_author_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference_author
    ADD CONSTRAINT reference_author_pkey PRIMARY KEY (id);


--
-- Name: reference_note reference_note_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference_note
    ADD CONSTRAINT reference_note_pkey PRIMARY KEY (id);


--
-- Name: reference reference_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_pkey PRIMARY KEY (id);


--
-- Name: tag tag_label_key; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_label_key UNIQUE (label);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: timeline_category_event timeline_category_event_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category_event
    ADD CONSTRAINT timeline_category_event_pkey PRIMARY KEY (id);


--
-- Name: timeline_category_person timeline_category_person_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category_person
    ADD CONSTRAINT timeline_category_person_pkey PRIMARY KEY (id);


--
-- Name: timeline_category timeline_category_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category
    ADD CONSTRAINT timeline_category_pkey PRIMARY KEY (id);


--
-- Name: timeline_event timeline_event_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_event
    ADD CONSTRAINT timeline_event_pkey PRIMARY KEY (id);


--
-- Name: timeline_person timeline_person_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_person
    ADD CONSTRAINT timeline_person_pkey PRIMARY KEY (id);


--
-- Name: timeline timeline_pkey; Type: CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline
    ADD CONSTRAINT timeline_pkey PRIMARY KEY (id);


--
-- Name: brainstorm_thought brainstorm_thought_brainstorm_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_thought
    ADD CONSTRAINT brainstorm_thought_brainstorm_fk_fkey FOREIGN KEY (brainstorm_fk) REFERENCES public.brainstorm(id);


--
-- Name: brainstorm_thought brainstorm_thought_reference_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_thought
    ADD CONSTRAINT brainstorm_thought_reference_fk_fkey FOREIGN KEY (reference_fk) REFERENCES public.reference(id);


--
-- Name: brainstorm_topic brainstorm_topic_brainstorm_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_topic
    ADD CONSTRAINT brainstorm_topic_brainstorm_fk_fkey FOREIGN KEY (brainstorm_fk) REFERENCES public.brainstorm(id);


--
-- Name: brainstorm_topic_thought brainstorm_topic_thought_brainstorm_topic_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_topic_thought
    ADD CONSTRAINT brainstorm_topic_thought_brainstorm_topic_fk_fkey FOREIGN KEY (brainstorm_topic_fk) REFERENCES public.brainstorm_topic(id);


--
-- Name: brainstorm_topic_thought brainstorm_topic_thought_reference_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.brainstorm_topic_thought
    ADD CONSTRAINT brainstorm_topic_thought_reference_fk_fkey FOREIGN KEY (reference_fk) REFERENCES public.reference(id);


--
-- Name: chart_dataset chart_dataset_chart_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_dataset
    ADD CONSTRAINT chart_dataset_chart_fk_fkey FOREIGN KEY (chart_fk) REFERENCES public.chart(id);


--
-- Name: chart_dataset_data chart_dataset_data_chart_dataset_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_dataset_data
    ADD CONSTRAINT chart_dataset_data_chart_dataset_fk_fkey FOREIGN KEY (chart_dataset_fk) REFERENCES public.chart_dataset(id);


--
-- Name: chart_label chart_label_chart_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_label
    ADD CONSTRAINT chart_label_chart_fk_fkey FOREIGN KEY (chart_fk) REFERENCES public.chart(id);


--
-- Name: chart_legend_label_options chart_legend_label_options_chart_legend_options_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_legend_label_options
    ADD CONSTRAINT chart_legend_label_options_chart_legend_options_fk_fkey FOREIGN KEY (chart_legend_options_fk) REFERENCES public.chart_legend_options(id);


--
-- Name: chart_legend_options chart_legend_options_chart_options_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_legend_options
    ADD CONSTRAINT chart_legend_options_chart_options_fk_fkey FOREIGN KEY (chart_options_fk) REFERENCES public.chart_options(id);


--
-- Name: chart_options chart_options_chart_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_options
    ADD CONSTRAINT chart_options_chart_fk_fkey FOREIGN KEY (chart_fk) REFERENCES public.chart(id);


--
-- Name: chart_title_options chart_title_options_chart_options_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_title_options
    ADD CONSTRAINT chart_title_options_chart_options_fk_fkey FOREIGN KEY (chart_options_fk) REFERENCES public.chart_options(id);


--
-- Name: chart_tooltip_options chart_tooltip_options_chart_options_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.chart_tooltip_options
    ADD CONSTRAINT chart_tooltip_options_chart_options_fk_fkey FOREIGN KEY (chart_options_fk) REFERENCES public.chart_options(id);


--
-- Name: essay_event essay_event_essay_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_event
    ADD CONSTRAINT essay_event_essay_fk_fkey FOREIGN KEY (essay_fk) REFERENCES public.essay(id);


--
-- Name: essay_event essay_event_event_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_event
    ADD CONSTRAINT essay_event_event_fk_fkey FOREIGN KEY (event_fk) REFERENCES public.event(id);


--
-- Name: essay_note essay_note_essay_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_note
    ADD CONSTRAINT essay_note_essay_fk_fkey FOREIGN KEY (essay_fk) REFERENCES public.essay(id);


--
-- Name: essay_note essay_note_reference_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_note
    ADD CONSTRAINT essay_note_reference_fk_fkey FOREIGN KEY (reference_fk) REFERENCES public.reference(id);


--
-- Name: essay_person essay_person_essay_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_person
    ADD CONSTRAINT essay_person_essay_fk_fkey FOREIGN KEY (essay_fk) REFERENCES public.essay(id);


--
-- Name: essay_person essay_person_person_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_person
    ADD CONSTRAINT essay_person_person_fk_fkey FOREIGN KEY (person_fk) REFERENCES public.person(id);


--
-- Name: essay_reference essay_reference_essay_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_reference
    ADD CONSTRAINT essay_reference_essay_fk_fkey FOREIGN KEY (essay_fk) REFERENCES public.essay(id);


--
-- Name: essay_reference essay_reference_reference_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_reference
    ADD CONSTRAINT essay_reference_reference_fk_fkey FOREIGN KEY (reference_fk) REFERENCES public.reference(id);


--
-- Name: essay_timeline essay_timeline_essay_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_timeline
    ADD CONSTRAINT essay_timeline_essay_fk_fkey FOREIGN KEY (essay_fk) REFERENCES public.essay(id);


--
-- Name: essay_timeline essay_timeline_timeline_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.essay_timeline
    ADD CONSTRAINT essay_timeline_timeline_fk_fkey FOREIGN KEY (timeline_fk) REFERENCES public.timeline(id);


--
-- Name: event event_event_end_era_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_event_end_era_fk_fkey FOREIGN KEY (event_end_era_fk) REFERENCES public.era(id);


--
-- Name: event event_event_end_month_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_event_end_month_fk_fkey FOREIGN KEY (event_end_month_fk) REFERENCES public.month(id);


--
-- Name: event event_event_start_era_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_event_start_era_fk_fkey FOREIGN KEY (event_start_era_fk) REFERENCES public.era(id);


--
-- Name: event event_event_start_month_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_event_start_month_fk_fkey FOREIGN KEY (event_start_month_fk) REFERENCES public.month(id);


--
-- Name: event_note event_note_event_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event_note
    ADD CONSTRAINT event_note_event_fk_fkey FOREIGN KEY (event_fk) REFERENCES public.event(id);


--
-- Name: event event_reference_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_reference_fk_fkey FOREIGN KEY (reference_fk) REFERENCES public.reference(id);


--
-- Name: event_tag event_tag_event_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_event_fk_fkey FOREIGN KEY (event_fk) REFERENCES public.event(id);


--
-- Name: event_tag event_tag_tag_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_tag_fk_fkey FOREIGN KEY (tag_fk) REFERENCES public.tag(id);


--
-- Name: person person_birth_era_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_birth_era_fk_fkey FOREIGN KEY (birth_era_fk) REFERENCES public.era(id);


--
-- Name: person person_birth_month_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_birth_month_fk_fkey FOREIGN KEY (birth_month_fk) REFERENCES public.month(id);


--
-- Name: person person_death_era_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_death_era_fk_fkey FOREIGN KEY (death_era_fk) REFERENCES public.era(id);


--
-- Name: person person_death_month_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_death_month_fk_fkey FOREIGN KEY (death_month_fk) REFERENCES public.month(id);


--
-- Name: person_note person_note_person_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person_note
    ADD CONSTRAINT person_note_person_fk_fkey FOREIGN KEY (person_fk) REFERENCES public.person(id);


--
-- Name: person person_reference_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_reference_fk_fkey FOREIGN KEY (reference_fk) REFERENCES public.reference(id);


--
-- Name: person_tag person_tag_person_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person_tag
    ADD CONSTRAINT person_tag_person_fk_fkey FOREIGN KEY (person_fk) REFERENCES public.person(id);


--
-- Name: person_tag person_tag_tag_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.person_tag
    ADD CONSTRAINT person_tag_tag_fk_fkey FOREIGN KEY (tag_fk) REFERENCES public.tag(id);


--
-- Name: reference_author reference_author_author_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference_author
    ADD CONSTRAINT reference_author_author_fk_fkey FOREIGN KEY (author_fk) REFERENCES public.author(id);


--
-- Name: reference_author reference_author_reference_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference_author
    ADD CONSTRAINT reference_author_reference_fk_fkey FOREIGN KEY (reference_fk) REFERENCES public.reference(id);


--
-- Name: reference_note reference_note_reference_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference_note
    ADD CONSTRAINT reference_note_reference_fk_fkey FOREIGN KEY (reference_fk) REFERENCES public.reference(id);


--
-- Name: reference reference_published_era_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_published_era_fk_fkey FOREIGN KEY (published_era_fk) REFERENCES public.era(id);


--
-- Name: reference reference_published_month_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_published_month_fk_fkey FOREIGN KEY (published_month_fk) REFERENCES public.month(id);


--
-- Name: timeline_category_event timeline_category_event_event_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category_event
    ADD CONSTRAINT timeline_category_event_event_fk_fkey FOREIGN KEY (event_fk) REFERENCES public.event(id);


--
-- Name: timeline_category_event timeline_category_event_timeline_category_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category_event
    ADD CONSTRAINT timeline_category_event_timeline_category_fk_fkey FOREIGN KEY (timeline_category_fk) REFERENCES public.timeline_category(id);


--
-- Name: timeline_category_person timeline_category_person_person_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category_person
    ADD CONSTRAINT timeline_category_person_person_fk_fkey FOREIGN KEY (person_fk) REFERENCES public.person(id);


--
-- Name: timeline_category_person timeline_category_person_timeline_category_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category_person
    ADD CONSTRAINT timeline_category_person_timeline_category_fk_fkey FOREIGN KEY (timeline_category_fk) REFERENCES public.timeline_category(id);


--
-- Name: timeline_category timeline_category_timeline_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_category
    ADD CONSTRAINT timeline_category_timeline_fk_fkey FOREIGN KEY (timeline_fk) REFERENCES public.timeline(id);


--
-- Name: timeline_event timeline_event_event_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_event
    ADD CONSTRAINT timeline_event_event_fk_fkey FOREIGN KEY (event_fk) REFERENCES public.event(id);


--
-- Name: timeline_event timeline_event_timeline_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_event
    ADD CONSTRAINT timeline_event_timeline_fk_fkey FOREIGN KEY (timeline_fk) REFERENCES public.timeline(id);


--
-- Name: timeline_person timeline_person_person_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_person
    ADD CONSTRAINT timeline_person_person_fk_fkey FOREIGN KEY (person_fk) REFERENCES public.person(id);


--
-- Name: timeline_person timeline_person_timeline_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: anderauser
--

ALTER TABLE ONLY public.timeline_person
    ADD CONSTRAINT timeline_person_timeline_fk_fkey FOREIGN KEY (timeline_fk) REFERENCES public.timeline(id);


--
-- Name: TABLE alembic_version; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.alembic_version TO adri;


--
-- Name: TABLE author; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.author TO adri;


--
-- Name: TABLE era; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.era TO adri;


--
-- Name: TABLE essay; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.essay TO adri;


--
-- Name: TABLE essay_event; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.essay_event TO adri;


--
-- Name: TABLE essay_note; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.essay_note TO adri;


--
-- Name: TABLE essay_person; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.essay_person TO adri;


--
-- Name: TABLE essay_reference; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.essay_reference TO adri;


--
-- Name: TABLE essay_timeline; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.essay_timeline TO adri;


--
-- Name: TABLE event; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.event TO adri;


--
-- Name: TABLE event_note; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.event_note TO adri;


--
-- Name: TABLE event_tag; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.event_tag TO adri;


--
-- Name: TABLE month; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.month TO adri;


--
-- Name: TABLE person; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.person TO adri;


--
-- Name: TABLE person_note; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.person_note TO adri;


--
-- Name: TABLE person_tag; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.person_tag TO adri;


--
-- Name: TABLE reference; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.reference TO adri;


--
-- Name: TABLE reference_author; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.reference_author TO adri;


--
-- Name: TABLE reference_note; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.reference_note TO adri;


--
-- Name: TABLE tag; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.tag TO adri;


--
-- Name: TABLE timeline; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.timeline TO adri;


--
-- Name: TABLE timeline_category; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.timeline_category TO adri;


--
-- Name: TABLE timeline_category_event; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.timeline_category_event TO adri;


--
-- Name: TABLE timeline_category_person; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.timeline_category_person TO adri;


--
-- Name: TABLE timeline_event; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.timeline_event TO adri;


--
-- Name: TABLE timeline_person; Type: ACL; Schema: public; Owner: anderauser
--

GRANT ALL ON TABLE public.timeline_person TO adri;


--
-- PostgreSQL database dump complete
--

