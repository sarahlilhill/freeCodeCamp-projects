--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: guesser; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesser (
    guesser_id integer NOT NULL,
    username character varying(22),
    games_played integer DEFAULT 0,
    best_score integer
);


ALTER TABLE public.guesser OWNER TO freecodecamp;

--
-- Name: guesser_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guesser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guesser_id_seq OWNER TO freecodecamp;

--
-- Name: guesser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guesser_id_seq OWNED BY public.guesser.guesser_id;


--
-- Name: guesser guesser_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesser ALTER COLUMN guesser_id SET DEFAULT nextval('public.guesser_id_seq'::regclass);


--
-- Data for Name: guesser; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesser VALUES (1, 'Sarah', 16, 3);
INSERT INTO public.guesser VALUES (4, 'user_1676892842226', 14, 3);
INSERT INTO public.guesser VALUES (5, 'user_1676892842225', 12, 3);
INSERT INTO public.guesser VALUES (7, 'user_1676893321846', 5, 961);
INSERT INTO public.guesser VALUES (6, 'user_1676893321847', 7, 310);


--
-- Name: guesser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guesser_id_seq', 7, true);


--
-- Name: guesser guesser_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesser
    ADD CONSTRAINT guesser_pkey PRIMARY KEY (guesser_id);


--
-- Name: guesser guesser_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesser
    ADD CONSTRAINT guesser_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

