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
    distance_from_earth numeric,
    description text,
    has_life boolean NOT NULL,
    life_forms_num integer,
    age_in_millions_of_years integer,
    is_spherical boolean
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
-- Name: galaxy_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    galaxy_star_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.galaxy_star OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_galaxy_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_galaxy_star_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_galaxy_star_id_seq OWNED BY public.galaxy_star.galaxy_star_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    description text,
    has_life boolean NOT NULL,
    life_forms_num integer,
    age_in_millions_of_years integer,
    is_spherical boolean,
    planet_id integer
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
    distance_from_earth numeric,
    description text,
    has_life boolean NOT NULL,
    life_forms_num integer,
    age_in_millions_of_years integer,
    is_spherical boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    description text,
    has_life boolean NOT NULL,
    life_forms_num integer,
    age_in_millions_of_years integer,
    is_spherical boolean,
    galaxy_id integer
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
-- Name: galaxy_star galaxy_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star ALTER COLUMN galaxy_star_id SET DEFAULT nextval('public.galaxy_star_galaxy_star_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 25300000, 'Spiral galaxy located 2.5 million light-years away from Earth.', true, 5000, 6000, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 0, 'Barred spiral galaxy containing our solar system', false, 0, 13000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 'Spiral galaxy found 3 million light-years away from Earth.', false, 0, 5000, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 29000000, 'Unbarred spiral galaxy with a prominent dust lane.', false, 0, 9000, true);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 11000000, 'Elliptical galaxy located in the constellation Centaurus.', false, 0, 12000, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 23000000, 'Spiral galaxy known for its striking appearance and interacting companion.', false, 0, 5500, true);


--
-- Data for Name: galaxy_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star VALUES (1, 2, 1, NULL);
INSERT INTO public.galaxy_star VALUES (5, 6, 2, NULL);
INSERT INTO public.galaxy_star VALUES (2, 1, 3, NULL);
INSERT INTO public.galaxy_star VALUES (2, 3, 4, NULL);
INSERT INTO public.galaxy_star VALUES (4, 5, 5, NULL);
INSERT INTO public.galaxy_star VALUES (3, 4, 6, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 384400, 'The Earth''s natural satellite.', false, 0, 4500, true, NULL);
INSERT INTO public.moon VALUES (2, 'Moon 2', 238900, 'The second moon of a gas giant planet.', false, 0, 3000, false, NULL);
INSERT INTO public.moon VALUES (3, 'Moon 3', 543200, 'A rocky moon with ancient ruins.', false, 0, 6000, true, NULL);
INSERT INTO public.moon VALUES (4, 'Moon 4', 768500, 'A frozen moon with vast ice caps.', false, 0, 4000, true, NULL);
INSERT INTO public.moon VALUES (5, 'Moon 5', 213000, 'A moon with a dense atmosphere and active volcanoes.', false, 0, 3500, true, NULL);
INSERT INTO public.moon VALUES (6, 'Moon 6', 981200, 'A moon known for its unique magnetic field.', false, 0, 5500, true, NULL);
INSERT INTO public.moon VALUES (7, 'Moon 7', 632100, 'A moon with a thin atmosphere and harsh surface conditions.', false, 0, 5000, true, NULL);
INSERT INTO public.moon VALUES (8, 'Moon 8', 176400, 'A moon with a mysterious dark side.', false, 0, 4000, true, NULL);
INSERT INTO public.moon VALUES (9, 'Moon 9', 420300, 'A moon with extensive underground cave systems.', false, 0, 4500, true, NULL);
INSERT INTO public.moon VALUES (10, 'Moon 10', 529800, 'A moon with vast oceans and diverse marine life.', false, 0, 6000, true, NULL);
INSERT INTO public.moon VALUES (11, 'Moon 11', 298700, 'A small moon with a rocky surface and crater formations.', false, 0, 3000, true, NULL);
INSERT INTO public.moon VALUES (12, 'Moon 12', 870100, 'A moon with a rare phenomenon of floating islands.', false, 0, 5000, true, NULL);
INSERT INTO public.moon VALUES (13, 'Moon 13', 173600, 'A moon with ancient ruins and mysterious artifacts.', false, 0, 4000, true, NULL);
INSERT INTO public.moon VALUES (14, 'Moon 14', 625900, 'A moon with complex geological formations.', false, 0, 5500, true, NULL);
INSERT INTO public.moon VALUES (15, 'Moon 15', 438200, 'A moon with a unique ring system.', false, 0, 5000, true, NULL);
INSERT INTO public.moon VALUES (16, 'Moon 16', 129300, 'A moon with extreme temperatures and strong winds.', false, 0, 3500, true, NULL);
INSERT INTO public.moon VALUES (17, 'Moon 17', 769800, 'A moon with vast underground ice caves.', false, 0, 4500, true, NULL);
INSERT INTO public.moon VALUES (18, 'Moon 18', 297100, 'A moon with an unusually high concentration of rare minerals.', false, 0, 4000, true, NULL);
INSERT INTO public.moon VALUES (19, 'Moon 19', 527600, 'A moon with towering mountain ranges and deep canyons.', false, 0, 6000, true, NULL);
INSERT INTO public.moon VALUES (20, 'Moon 20', 627400, 'A moon with a dense forest covering its surface.', false, 0, 5500, true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Andromeda Planet 1', 2530000, 'This is the first planet from the Andromeda galaxy.', false, 0, 4500, true, 2);
INSERT INTO public.planet VALUES (2, 'Andromeda Planet 2', 2530000, 'This is the second planet from the Andromeda galaxy.', false, 0, 5000, true, 2);
INSERT INTO public.planet VALUES (3, 'Andromeda Planet 3', 2530000, 'This is the third planet from the Andromeda galaxy.', false, 0, 4000, true, 2);
INSERT INTO public.planet VALUES (4, 'Milky Way Planet 1', 0, 'This is the first planet from the Milky Way galaxy.', false, 0, 4600, true, 1);
INSERT INTO public.planet VALUES (5, 'Milky Way Planet 2', 0, 'This is the second planet from the Milky Way galaxy.', true, 5000000, 4500, true, 1);
INSERT INTO public.planet VALUES (6, 'Milky Way Planet 3', 0, 'This is the third planet from the Milky Way galaxy.', false, 0, 4800, true, 1);
INSERT INTO public.planet VALUES (7, 'Centaurus A Planet 1', 11000000, 'This is the first planet from the Centaurus A galaxy.', false, 0, 4900, true, 6);
INSERT INTO public.planet VALUES (8, 'Centaurus A Planet 2', 11000000, 'This is the second planet from the Centaurus A galaxy.', false, 0, 4700, true, 6);
INSERT INTO public.planet VALUES (9, 'Centaurus A Planet 3', 11000000, 'This is the third planet from the Centaurus A galaxy.', true, 100000, 5000, true, 6);
INSERT INTO public.planet VALUES (10, 'Triangulum Planet 1', 3000000, 'This is the first planet from the Triangulum galaxy.', false, 0, 4500, true, 4);
INSERT INTO public.planet VALUES (11, 'Triangulum Planet 2', 3000000, 'This is the second planet from the Triangulum galaxy.', false, 0, 4700, true, 4);
INSERT INTO public.planet VALUES (12, 'Triangulum Planet 3', 3000000, 'This is the third planet from the Triangulum galaxy.', false, 0, 4600, true, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius', 8.6, 'The brightest star in the night sky.', false, 0, 250, false, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 434.8, 'A yellow supergiant star commonly known as the North Star.', false, 0, 7000, false, 5);
INSERT INTO public.star VALUES (1, 'Sun', 0, 'The star at the center of our solar system.', false, 0, 4600, true, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 4.37, 'A triple star system nearest to our solar system.', false, 0, 6000, false, 2);
INSERT INTO public.star VALUES (5, 'Vega', 25.05, 'One of the brightest stars in the northern sky.', false, 0, 455, true, 4);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 643, 'A red supergiant star in the constellation Orion.', false, 0, 8000, true, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_galaxy_star_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star galaxy_star_galaxy_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_galaxy_star_id_key UNIQUE (galaxy_star_id);


--
-- Name: galaxy_star galaxy_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_pkey PRIMARY KEY (galaxy_star_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy_star galaxy_star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star galaxy_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
