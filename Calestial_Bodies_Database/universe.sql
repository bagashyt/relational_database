--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    has_life boolean,
    area integer,
    volume integer
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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    has_life boolean,
    area integer,
    volume integer,
    planet_id integer NOT NULL
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    has_life boolean,
    area integer,
    volume integer,
    moon_id integer NOT NULL,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    has_life boolean,
    area integer,
    volume integer,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL
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
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (8, 'galaxy1', 'its galaxy1', 1000, false, false, 1, 100);
INSERT INTO public.galaxy VALUES (9, 'galaxy2', 'its galaxy2', 1000, false, false, 1, 100);
INSERT INTO public.galaxy VALUES (10, 'galaxy3', 'its galaxy3', 1000, false, false, 1, 100);
INSERT INTO public.galaxy VALUES (11, 'galaxy4', 'its galaxy4', 1000, false, false, 1, 100);
INSERT INTO public.galaxy VALUES (12, 'galaxy5', 'its galaxy5', 1000, false, false, 1, 100);
INSERT INTO public.galaxy VALUES (13, 'galaxy6', 'its galaxy1', 1000, false, false, 1, 100);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 'its moon1', 1000, false, false, 1, 100, 1);
INSERT INTO public.moon VALUES (2, 'moon2', 'its moon2', 1000, false, false, 1, 100, 2);
INSERT INTO public.moon VALUES (3, 'moon3', 'its moon3', 1000, false, false, 1, 100, 3);
INSERT INTO public.moon VALUES (4, 'moon4', 'its moon4', 1000, false, false, 1, 100, 4);
INSERT INTO public.moon VALUES (5, 'moon5', 'its moon5', 1000, false, false, 1, 100, 5);
INSERT INTO public.moon VALUES (6, 'moon6', 'its moon6', 1000, false, false, 1, 100, 6);
INSERT INTO public.moon VALUES (7, 'moon7', 'its moon7', 1000, false, false, 1, 100, 1);
INSERT INTO public.moon VALUES (8, 'moon8', 'its moon8', 1000, false, false, 1, 100, 2);
INSERT INTO public.moon VALUES (9, 'moon9', 'its moon9', 1000, false, false, 1, 100, 3);
INSERT INTO public.moon VALUES (10, 'moon10', 'its moon10', 1000, false, false, 1, 100, 4);
INSERT INTO public.moon VALUES (11, 'moon11', 'its moon11', 1000, false, false, 1, 100, 5);
INSERT INTO public.moon VALUES (12, 'moon12', 'its moon12', 1000, false, false, 1, 100, 6);
INSERT INTO public.moon VALUES (13, 'moon13', 'its moon13', 1000, false, false, 1, 100, 1);
INSERT INTO public.moon VALUES (14, 'moon14', 'its moon14', 1000, false, false, 1, 100, 2);
INSERT INTO public.moon VALUES (15, 'moon15', 'its moon15', 1000, false, false, 1, 100, 3);
INSERT INTO public.moon VALUES (16, 'moon16', 'its moon16', 1000, false, false, 1, 100, 4);
INSERT INTO public.moon VALUES (17, 'moon17', 'its moon17', 1000, false, false, 1, 100, 5);
INSERT INTO public.moon VALUES (18, 'moon18', 'its moon18', 1000, false, false, 1, 100, 6);
INSERT INTO public.moon VALUES (19, 'moon19', 'its moon19', 1000, false, false, 1, 100, 5);
INSERT INTO public.moon VALUES (20, 'moon20', 'its moon20', 1000, false, false, 1, 100, 6);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'galaxy', 'info galaxy');
INSERT INTO public.more_info VALUES (2, 'star', 'info star');
INSERT INTO public.more_info VALUES (3, 'planet', 'info planet');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', 'its planet1', 1000, false, false, 1, 100, 1, 1);
INSERT INTO public.planet VALUES (2, 'planet2', 'its planet2', 1000, false, false, 1, 100, 2, 2);
INSERT INTO public.planet VALUES (3, 'planet3', 'its planet3', 1000, false, false, 1, 100, 3, 3);
INSERT INTO public.planet VALUES (4, 'planet4', 'its planet4', 1000, false, false, 1, 100, 4, 4);
INSERT INTO public.planet VALUES (5, 'planet5', 'its planet5', 1000, false, false, 1, 100, 5, 5);
INSERT INTO public.planet VALUES (6, 'planet6', 'its planet6', 1000, false, false, 1, 100, 6, 6);
INSERT INTO public.planet VALUES (7, 'planet7', 'its planet7', 1000, false, false, 1, 100, 1, 1);
INSERT INTO public.planet VALUES (8, 'planet8', 'its planet8', 1000, false, false, 1, 100, 2, 2);
INSERT INTO public.planet VALUES (9, 'planet9', 'its planet9', 1000, false, false, 1, 100, 3, 3);
INSERT INTO public.planet VALUES (10, 'planet10', 'its planet10', 1000, false, false, 1, 100, 4, 4);
INSERT INTO public.planet VALUES (11, 'planet11', 'its planet11', 1000, false, false, 1, 100, 5, 5);
INSERT INTO public.planet VALUES (12, 'planet12', 'its planet12', 1000, false, false, 1, 100, 6, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 'its star1', 1000, false, false, 1, 100, 8, 1);
INSERT INTO public.star VALUES (2, 'star2', 'its star2', 1000, false, false, 1, 100, 9, 2);
INSERT INTO public.star VALUES (3, 'star3', 'its star3', 1000, false, false, 1, 100, 10, 3);
INSERT INTO public.star VALUES (4, 'star4', 'its star4', 1000, false, false, 1, 100, 11, 4);
INSERT INTO public.star VALUES (5, 'star5', 'its star5', 1000, false, false, 1, 100, 12, 5);
INSERT INTO public.star VALUES (6, 'star6', 'its star6', 1000, false, false, 1, 100, 13, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

