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
    name character varying(100) NOT NULL,
    distance_from_earth_in_million_light_years integer,
    type text,
    constellation character varying(30),
    description text,
    has_life boolean DEFAULT false
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
-- Name: junction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction (
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    junction_id integer NOT NULL,
    name character varying(30) DEFAULT 'nothing'::character varying
);


ALTER TABLE public.junction OWNER TO freecodecamp;

--
-- Name: junction_junction_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.junction_junction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_junction_id_seq OWNER TO freecodecamp;

--
-- Name: junction_junction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.junction_junction_id_seq OWNED BY public.junction.junction_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    age_in_billion_yrs numeric(4,3),
    orbital_period numeric(5,2),
    planet_id integer,
    distance_to_earth_in_million_kms numeric(6,2)
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
    has_life boolean,
    age_in_billion_years numeric(4,3),
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    color character varying(20),
    distance_to_earth_in_light_years integer,
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
-- Name: junction junction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction ALTER COLUMN junction_id SET DEFAULT nextval('public.junction_junction_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 3, 'spiral', 'Andromeda', 'its name sterns from the area of thee sky in which it appears the constellation of Andromeda.', false);
INSERT INTO public.galaxy VALUES (2, 'Black Eye galaxy', 17, 'spiral', 'Coma Berenices', 'It has a spectacular dark band of absorbing dust in front of he galaxys bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false);
INSERT INTO public.galaxy VALUES (3, 'Bodes Galaxy', 12, 'spiral', 'Ursa Major', 'It was discovered by Johann Elert Bode on December 31, 1774', false);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel galaxy', 500, 'lenticular and ring', 'Sculptor', 'It looks like a cartwheel thats why astronomers called it a cartwheel', false);
INSERT INTO public.galaxy VALUES (5, 'cigar galaxy', 12, 'starbust', 'Ursa Major', NULL, false);
INSERT INTO public.galaxy VALUES (6, 'comet galaxy', 3200, 'spiral', 'Sculptor', 'It is a spiral galaxy located 3.2 billion light-years from earth, in the galaxy clusters Abell 267, which was found with the Hubble Space Telescope.', false);
INSERT INTO public.galaxy VALUES (7, 'milky way', 1, 'spiral', 'sagittarius', 'The milky way is the galaxy that includes our solar system, with the name describing the galays appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannothazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', true);


--
-- Data for Name: junction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction VALUES (7, 1, 1, 'nothing');
INSERT INTO public.junction VALUES (7, 2, 2, 'nothing');
INSERT INTO public.junction VALUES (7, 3, 3, 'nothing');
INSERT INTO public.junction VALUES (7, 4, 4, 'nothing');
INSERT INTO public.junction VALUES (7, 5, 5, 'nothing');
INSERT INTO public.junction VALUES (7, 6, 6, 'nothing');
INSERT INTO public.junction VALUES (7, 7, 7, 'nothing');
INSERT INTO public.junction VALUES (7, 8, 8, 'nothing');
INSERT INTO public.junction VALUES (7, 9, 9, 'nothing');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon', 1, 4.530, 27.00, 2, 0.38);
INSERT INTO public.moon VALUES ('phobos', 2, 4.530, 27.00, 4, 77.79);
INSERT INTO public.moon VALUES ('deimos', 3, 4.503, 1.30, 4, 77.79);
INSERT INTO public.moon VALUES ('europa', 4, 4.603, 3.50, 5, 628.30);
INSERT INTO public.moon VALUES ('lo', 5, 4.603, 3.50, 5, 628.30);
INSERT INTO public.moon VALUES ('ganymede', 6, 4.503, 7.16, 5, 628.30);
INSERT INTO public.moon VALUES ('callisto', 7, 4.503, 17.00, 5, 628.30);
INSERT INTO public.moon VALUES ('amalthea', 8, 4.503, 0.50, 5, 628.30);
INSERT INTO public.moon VALUES ('adrastea', 9, 4.503, 0.70, 5, 628.30);
INSERT INTO public.moon VALUES ('cyllene', 11, 4.503, 731.00, 5, 628.30);
INSERT INTO public.moon VALUES ('hermipe', 12, 4.503, 632.00, 5, 628.30);
INSERT INTO public.moon VALUES ('thelxinoe', 13, 4.503, 628.00, 5, 628.30);
INSERT INTO public.moon VALUES ('Philophrosyne', 14, 4.503, 690.00, 5, 628.30);
INSERT INTO public.moon VALUES ('herse', 15, 4.503, 715.00, 5, 628.30);
INSERT INTO public.moon VALUES ('titan', 16, 4.003, 16.00, 6, 1270.00);
INSERT INTO public.moon VALUES ('Enceladus', 17, 4.003, 1.30, 6, 1270.00);
INSERT INTO public.moon VALUES ('memas', 18, 4.003, 0.91, 6, 1270.00);
INSERT INTO public.moon VALUES ('dione', 19, 4.003, 2.70, 6, 1270.00);
INSERT INTO public.moon VALUES ('methone', 20, 4.003, 1.00, 6, 1270.00);
INSERT INTO public.moon VALUES ('jupiter lxi', 10, 4.503, 701.00, 5, 628.30);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', false, 4.503, 7);
INSERT INTO public.planet VALUES (2, 'venus', false, 4.503, 7);
INSERT INTO public.planet VALUES (3, 'earth', true, 4.503, 7);
INSERT INTO public.planet VALUES (4, 'mars', false, 4.603, 7);
INSERT INTO public.planet VALUES (5, 'jupiter', false, 4.603, 7);
INSERT INTO public.planet VALUES (6, 'saturn', false, 4.503, 7);
INSERT INTO public.planet VALUES (7, 'uranus', false, 4.503, 7);
INSERT INTO public.planet VALUES (8, 'pluto', false, 4.600, 7);
INSERT INTO public.planet VALUES (9, 'kepler-b', false, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'kepler-c', false, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'kepler-d', false, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'neptune', false, 4.503, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('alpha andromedae', 1, 'blue', 97, 1);
INSERT INTO public.star VALUES ('beta andromedae', 2, 'red', 199, 1);
INSERT INTO public.star VALUES ('Upsilon andromedae', 3, 'yellow white', 44, 1);
INSERT INTO public.star VALUES ('UY scuti', 4, 'red', 5219, 7);
INSERT INTO public.star VALUES ('VY Canis Majoris', 5, 'red', 3900, 7);
INSERT INTO public.star VALUES ('RW Cephei', 6, 'yellow', 3500, 7);
INSERT INTO public.star VALUES ('sun', 7, 'white', 0, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: junction_junction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junction_junction_id_seq', 9, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: junction junction_junction_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_junction_id_key UNIQUE (junction_id);


--
-- Name: junction junction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_pkey PRIMARY KEY (junction_id);


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
-- Name: junction junction_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: junction junction_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

