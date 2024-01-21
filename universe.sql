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
    name character varying,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    number_of_planet numeric NOT NULL
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
    name character varying,
    distance_from_planet integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    number_of_sister_moons integer,
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
    name character varying,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    description text,
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
    name character varying,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    number_of_planets integer,
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
-- Name: stars_in_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stars_in_galaxy (
    name character varying NOT NULL,
    number_of_planets integer,
    galaxy_id integer NOT NULL,
    stars_in_galaxy_id integer NOT NULL,
    description character varying
);


ALTER TABLE public.stars_in_galaxy OWNER TO freecodecamp;

--
-- Name: stars_in_galaxy_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_in_galaxy_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_in_galaxy_groups_id_seq OWNER TO freecodecamp;

--
-- Name: stars_in_galaxy_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_in_galaxy_groups_id_seq OWNED BY public.stars_in_galaxy.stars_in_galaxy_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: stars_in_galaxy stars_in_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_in_galaxy ALTER COLUMN stars_in_galaxy_id SET DEFAULT nextval('public.stars_in_galaxy_groups_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 2500000, 1000, 400);
INSERT INTO public.galaxy VALUES (2, 'Backward Galaxy', 3500, 2000, 3000);
INSERT INTO public.galaxy VALUES (3, 'Bear Paw Galaxy', 40000, 30000, 200);
INSERT INTO public.galaxy VALUES (4, 'Lumivex', 213214, 32423, 43);
INSERT INTO public.galaxy VALUES (5, 'Veridian', 2342422, 343, 3242);
INSERT INTO public.galaxy VALUES (6, 'Celestrix', 32452355, 4432222, 342);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Belinda', 32423, 3455, 3, 1);
INSERT INTO public.moon VALUES (2, 'Polydeuces', 423, 55, 2, 2);
INSERT INTO public.moon VALUES (3, 'Fenir', 3423, 355, 6, 3);
INSERT INTO public.moon VALUES (4, 'Thalassa', 323, 55, 8, 4);
INSERT INTO public.moon VALUES (5, 'Narvi', 423, 455, 4, 5);
INSERT INTO public.moon VALUES (6, 'Perdita', 23, 55, 9, 6);
INSERT INTO public.moon VALUES (7, 'Ferdinand', 2423, 455, 4, 7);
INSERT INTO public.moon VALUES (8, 'Iapetus', 23, 34, 7, 8);
INSERT INTO public.moon VALUES (9, 'Sycorax', 33223, 445, 2, 9);
INSERT INTO public.moon VALUES (10, 'Aegaeon', 22423, 155, 2, 10);
INSERT INTO public.moon VALUES (31, 'Titania', 76423, 755, 4, 11);
INSERT INTO public.moon VALUES (32, 'Greip', 48823, 5588, 9, 12);
INSERT INTO public.moon VALUES (33, 'Erinome', 31223, 955, 3, 3);
INSERT INTO public.moon VALUES (34, 'Moon VI', 3223, 155, 18, 4);
INSERT INTO public.moon VALUES (35, 'Iocaste', 488723, 4755, 74, 12);
INSERT INTO public.moon VALUES (36, 'Kore', 26573, 555, 6, 11);
INSERT INTO public.moon VALUES (37, 'Hati', 9923, 475, 4, 7);
INSERT INTO public.moon VALUES (38, 'Sao', 211323, 324, 7, 8);
INSERT INTO public.moon VALUES (39, 'Rhea', 337223, 4545, 2, 1);
INSERT INTO public.moon VALUES (40, 'Aegir', 2423, 55, 2, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jinkininki Beta', 245133214, 324, true, true, 'gaseous', 2);
INSERT INTO public.planet VALUES (2, 'Vili IV', 2542422, 335, true, true, 'terrestrial', 3);
INSERT INTO public.planet VALUES (3, 'Bushyasta Rising', 434525, 222, true, true, 'terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Mutius', 233423, 323, true, true, 'dwarf-terrestrial', 4);
INSERT INTO public.planet VALUES (5, 'Mimir', 423323, 43, true, true, 'gaseous', 5);
INSERT INTO public.planet VALUES (6, 'Lucullus', 3424235, 43245, true, true, 'terrestrial', 6);
INSERT INTO public.planet VALUES (7, 'Legates Planet', 3456345, 345, false, true, 'terrestrial', 4);
INSERT INTO public.planet VALUES (8, 'Hotspur', 34563435, 3454, false, true, 'gaseous', 2);
INSERT INTO public.planet VALUES (9, 'Sabnock', 34565, 35, false, true, 'terrestrial', 3);
INSERT INTO public.planet VALUES (10, 'Vanth Delta', 345634555, 34545, false, true, 'gaseous', 6);
INSERT INTO public.planet VALUES (11, 'Dellingr', 3445, 5, false, true, 'terrestrial', 1);
INSERT INTO public.planet VALUES (12, 'Dorcas', 345364345, 34435, true, true, 'terrestrial', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Clerokos', 2133214, 2423, 2, 4);
INSERT INTO public.star VALUES (2, 'Yoca', 254342422, 33, 42, 3);
INSERT INTO public.star VALUES (3, 'Berdis', 33434525, 2222, 32, 1);
INSERT INTO public.star VALUES (4, 'Anana', 23423, 3423, 43, 2);
INSERT INTO public.star VALUES (5, 'Kolides', 23423323, 343, 12, 6);
INSERT INTO public.star VALUES (6, 'Thoral', 324235, 3245, 3, 5);


--
-- Data for Name: stars_in_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stars_in_galaxy VALUES ('Berdis', 32, 1, 1, NULL);
INSERT INTO public.stars_in_galaxy VALUES ('Anana', 43, 2, 2, NULL);
INSERT INTO public.stars_in_galaxy VALUES ('Yoca', 42, 3, 3, NULL);
INSERT INTO public.stars_in_galaxy VALUES ('Clerokos', 2, 4, 4, NULL);
INSERT INTO public.stars_in_galaxy VALUES ('Thoral', 3, 5, 5, NULL);
INSERT INTO public.stars_in_galaxy VALUES ('Kolides', 12, 6, 6, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: stars_in_galaxy_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_in_galaxy_groups_id_seq', 6, true);


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
-- Name: stars_in_galaxy stars_in_galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_in_galaxy
    ADD CONSTRAINT stars_in_galaxy_description_key UNIQUE (description);


--
-- Name: stars_in_galaxy stars_in_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_in_galaxy
    ADD CONSTRAINT stars_in_galaxy_pkey PRIMARY KEY (stars_in_galaxy_id);


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
-- PostgreSQL database dump complete
--

