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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_billion_solar_masses numeric(4,0),
    type character varying(30),
    constellation character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    mass_in_lunar_masses numeric(5,4),
    year_of_discovery numeric(4,0)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    mass_in_earth_masses numeric(5,2),
    description text,
    moons integer,
    rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spaceport; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceport (
    spaceport_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    moon_id integer,
    freight_only boolean
);


ALTER TABLE public.spaceport OWNER TO freecodecamp;

--
-- Name: spaceport_spaceport_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spaceport_spaceport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spaceport_spaceport_id_seq OWNER TO freecodecamp;

--
-- Name: spaceport_spaceport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spaceport_spaceport_id_seq OWNED BY public.spaceport.spaceport_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    mass_in_solar_masses numeric(5,3),
    constellation character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spaceport spaceport_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceport ALTER COLUMN spaceport_id SET DEFAULT nextval('public.spaceport_spaceport_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 1540, 'SBbc', 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 1500, 'SA(s)b', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 50, 'SA(s)cd', 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 10, 'Irr/SB(s)m', 'Dorado');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 7, 'SB(s)m pec', 'Tucana');
INSERT INTO public.galaxy VALUES (6, 'Wolf-Lundmark-Melotte', 9, 'Ir+', 'Cetus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1.0000, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1.2170, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 0.6540, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2.0180, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1.4660, 1610);
INSERT INTO public.moon VALUES (8, 'Triton', 8, 0.2910, 1846);
INSERT INTO public.moon VALUES (9, 'Mimas', 6, 0.0005, 1789);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 0.0015, 1789);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 0.0084, 1684);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 0.0150, 1684);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 0.0310, 1672);
INSERT INTO public.moon VALUES (14, 'Titan', 6, 1.8320, 1655);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 0.0250, 1671);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 0.0170, 1851);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 0.0170, 1851);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 0.0450, 1787);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 0.0420, 1787);
INSERT INTO public.moon VALUES (20, 'Miranda', 7, 0.0009, 1948);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.06, 'Small hot rock', 0, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.81, 'Nasty Atmosphere', 0, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.00, 'Mostly Harmless', 1, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.11, 'Red Rock', 2, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 317.83, 'Stripey Gas Ball', 92, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95.16, 'Yellow Stripey Gas Ball', 83, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 14.54, 'White Ice Ball', 27, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 17.15, 'Blue Ice Ball', 14, true);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri d', 2, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 2, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Lalande 21185 b', 3, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Lalande 21185 c', 3, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Lacaille 9352 b', 4, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (14, 'Lacaille 9352 c', 4, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (15, 'Lutyen''s Star c', 5, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (16, 'Lutyen''s Star b', 5, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (17, 'Tau Ceti g', 6, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (18, 'Tau Ceti h', 6, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (19, 'Tau Ceti e', 6, NULL, 'Extrasolar', NULL, NULL);
INSERT INTO public.planet VALUES (20, 'Tau Ceti f', 6, NULL, 'Extrasolar', NULL, NULL);


--
-- Data for Name: spaceport; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceport VALUES (1, 'London', 3, NULL, false);
INSERT INTO public.spaceport VALUES (2, 'Olympus Mons', 4, NULL, true);
INSERT INTO public.spaceport VALUES (3, 'Moonbase Alpha', NULL, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.000, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.122, 'Centaurus');
INSERT INTO public.star VALUES (3, 'Lalande 21185', 1, 0.390, 'Ursa Major');
INSERT INTO public.star VALUES (4, 'Lacaille 9352', 1, 0.486, 'Piscis Austrinus');
INSERT INTO public.star VALUES (5, 'Luyten''s Star', 1, 0.260, 'Canis Minor');
INSERT INTO public.star VALUES (6, 'Tau Ceti', 1, 0.783, 'Cetus');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: spaceport_spaceport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceport_spaceport_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spaceport spaceport_location_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceport
    ADD CONSTRAINT spaceport_location_key UNIQUE (name);


--
-- Name: spaceport spaceport_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceport
    ADD CONSTRAINT spaceport_name_key UNIQUE (name);


--
-- Name: spaceport spaceport_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceport
    ADD CONSTRAINT spaceport_pkey PRIMARY KEY (spaceport_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: spaceport spaceport_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceport
    ADD CONSTRAINT spaceport_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: spaceport spaceport_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceport
    ADD CONSTRAINT spaceport_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

