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
    description text,
    galaxy_type character varying(50) NOT NULL,
    no_of_stars_in_millions character varying(20),
    major_axis_dia_in_ly character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km numeric(5,1) NOT NULL,
    discovery_year character varying(11) NOT NULL,
    is_spherical boolean,
    is_the_moon_of character varying(20),
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
    number_of_moons integer,
    is_spherical boolean,
    distance_from_earth_in_million_km integer NOT NULL,
    planet_type character varying(30),
    is_the_planet_of character varying(30),
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
    description_of_star text,
    is_the_star_of character varying(30),
    galaxy_id integer,
    color character varying(20),
    surface_temp_in_kelvin integer
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
-- Name: supercluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supercluster (
    supercluster_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description_of_supercluster text NOT NULL
);


ALTER TABLE public.supercluster OWNER TO freecodecamp;

--
-- Name: supercluster_supercluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.supercluster_supercluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supercluster_supercluster_id_seq OWNER TO freecodecamp;

--
-- Name: supercluster_supercluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.supercluster_supercluster_id_seq OWNED BY public.supercluster.supercluster_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galxy_galaxy_id_seq'::regclass);


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
-- Name: supercluster supercluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster ALTER COLUMN supercluster_id SET DEFAULT nextval('public.supercluster_supercluster_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MilkyWay', 'The galaxy containing the Sun and the solar system, therefore the Earth', 'Spiral Galaxy', '100', '87400');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda is the closest big galxy to the Milkyway and is expected to collide with the Milkyway around 4.5 billion years from now. The two will eventually merged into a single galaxy called Milkdromeda', 'Spiral Galaxy', '1000000', '152300');
INSERT INTO public.galaxy VALUES (3, 'Condor Galaxy', 'The largest known spiral galaxy , it has a diameter of over 665,300 light-years.It is tidally disturbed by a small lenticular galaxy IC4970', 'Spiral Galaxy', '2000000', '7171000');
INSERT INTO public.galaxy VALUES (4, 'Cosmos RedShift 7', 'Galaxy Cosmos RedShift 7 is reported to be the brightest of distant galaxies and to contains some of the earliest first stars that produced the chemical elements needed for the later formation of planets and life as weknow it', 'Lyman-alpha Emitter Galaxy', 'N/A', 'N/A');
INSERT INTO public.galaxy VALUES (5, 'Peekaboo Galaxy', 'Galaxy relatively nearbyis considered one of the most "metal-poor",least chemically eniriched,and seemigly primordial, galaxies known', 'Irregular Compact Blue Dwarf Galaxy', '60', 'N/A');
INSERT INTO public.galaxy VALUES (6, 'Tadpole Galaxy', 'This shape resulted from tidal interaction that drew out of a long tidal tail', 'Spiral Galaxy', '100000', 'N/A');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3476.0, 'Prehistoric', true, 'Earth', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.0, '1877', false, 'Mars', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.0, '1877', false, 'Mars', 4);
INSERT INTO public.moon VALUES (4, 'Io', 3643.0, '1610', true, 'Jupiter', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3122.0, '1610', true, 'Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268.0, '1610', true, 'Jupiter', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821.0, '1610', true, 'Jupiter', 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 167.0, '1892', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 140.0, '1904', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (10, 'Elara', 86.0, '1905', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (11, 'Pasiphea', 60.0, '1908', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (12, 'Sinope', 38.0, '1914', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (13, 'Lysithea', 36.0, '1938', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (14, 'Carme', 46.0, '1938', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (15, 'Ananke', 28.0, '1951', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (16, 'Leda', 20.0, '1974', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (17, 'Thebe', 99.0, '1979', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (18, 'Adrastea', 16.0, '1979', false, 'Jupiter', 5);
INSERT INTO public.moon VALUES (19, 'Mimas', 396.0, '1789', true, 'Saturn', 6);
INSERT INTO public.moon VALUES (20, 'Enceladus', 504.0, '1789', true, 'Saturn', 6);
INSERT INTO public.moon VALUES (21, 'Tethys', 1066.0, '1684', true, 'Saturn', 6);
INSERT INTO public.moon VALUES (22, 'Dione', 1123.0, '1684', true, 'Saturn', 6);
INSERT INTO public.moon VALUES (23, 'Rhea', 1528.0, '1672', true, 'Saturn', 6);
INSERT INTO public.moon VALUES (24, 'Ariel', 1158.0, '1851', false, 'Uranus', 7);
INSERT INTO public.moon VALUES (25, 'Umbriel', 1169.0, '1851', false, 'Uranus', 7);
INSERT INTO public.moon VALUES (26, 'Titania', 1578.0, '1789', false, 'Uranus', 7);
INSERT INTO public.moon VALUES (27, 'Triton', 2707.0, '1846', false, 'Neptune', 8);
INSERT INTO public.moon VALUES (28, 'Thalassa', 82.0, '1989', false, 'Neptune', 8);
INSERT INTO public.moon VALUES (29, 'Despina', 156.0, '1989', false, 'Neptune', 8);
INSERT INTO public.moon VALUES (30, 'Naiad', 66.0, '1989', false, 'Neptune', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, true, 189, 'Rocky Planet', 'Sun', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, true, 184, 'Terrestrial Planet', 'Sun', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 0, 'Terrestrial Planet', 'Sun', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, true, 210, 'Rocky Planet', 'Sun', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, true, 886, 'Gas Giant Planet', 'Sun', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, true, 1589, 'Gas Giant Planet', 'Sun', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, true, 3050, 'Ice Giant Planet', 'Sun', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 16, true, 4620, 'Ice Giant Planet', 'Sun', 1);
INSERT INTO public.planet VALUES (11, 'Bernads Star b', 0, true, 56381600, 'Super Earth Exoplanet', 'Bernads Star', 3);
INSERT INTO public.planet VALUES (12, 'Pollux b', 0, true, 318991200, 'Gas Gaint Exoplanet', 'Pollux', 4);
INSERT INTO public.planet VALUES (9, 'Proxima Centuari b', 0, true, 4020800, 'Super Earth Exoplanet', 'Proxima Centuari', 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centuari c', 0, true, 40000000, 'Super Earth Exoplanet', 'Proxima Centuari', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'THe sun is the star at the center of the Solar System', 'Milkyway', 1, 'White', 5778);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Proxima Centauri is a small, low-mass star located 4.2465 lightyears away from Sun in the southern constellation of Centaurus', 'Milkyway', 1, 'Red', 3942);
INSERT INTO public.star VALUES (3, 'Barnads Star', 'The Barnads Star is a red dwarf of the dim spectral type of M4, and it is too faint to see without a telescope', 'Milkyway', 1, 'Red', 3134);
INSERT INTO public.star VALUES (4, 'Pollux', 'Pollux is te brightest star in the constellation of Gemini. This is a orange hued evolved Gaint star located at a distance of 34 light-years making it the closest Giant to the sun', 'Milkyway', 1, 'Orange', 4865);
INSERT INTO public.star VALUES (5, 'Rigel', 'Rigel, the seventh brightest star in the night sky, is located in the Milkyway galaxy. It is located only 860 light years away from the earth', 'Milkyway', 1, 'Blue-White', 11000);
INSERT INTO public.star VALUES (6, 'Canopus', 'Canopus is the brightest star in the southern constellation of Carina and the second brightest star in the night sky', 'Milkyway', 1, 'White', 7350);


--
-- Data for Name: supercluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supercluster VALUES (1, 'Hercules-Corona Borealis Great Wall', 'The Hercules-Corona Borealis Great Wall or simply the Great Wall is the largest known structure in the observable universe.');
INSERT INTO public.supercluster VALUES (2, 'Giant GRB Ring', 'The Giant GRB Ring is a ring of 9 Gamma ray bursts(GRBs) that may be associated with one of the largest known cosmic structures.It was discovered in July 2015 by a team of Hungarian and American Astronomers while analyzing data from different Gamma ray and X-ray telescopes');
INSERT INTO public.supercluster VALUES (3, 'Sloan Great Wall', 'The Sloan Great Wall(SGW) is a cosmic structure formed by giant walll of galxies.Its discovery was announced from Princeton University on October 20 2023.');
INSERT INTO public.supercluster VALUES (4, 'Pisces-Cetus SuperCluster Complex', 'The Pisces-Cetus SuperClusture Complex is a galxy filament, hich includes Laniakea SuperCluster which contains the Virgo supercluster lobe which inturn contains the Local Group, the galaxy cluster that includes Milkyway. The filament is adjacent to the Perseus-Pegasus Filament');
INSERT INTO public.supercluster VALUES (5, 'Saraswati SuperCluster', 'The Saraswati Supercluster is a massive galaxy supercluster about 1.2 GigaParsec away within the strip 82 region of SDSS, in the direction of constellation Pisces.It is one of the largest structures found in the universe. It consists of atleast 43 galaxy clusters.');


--
-- Name: galxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: supercluster_supercluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supercluster_supercluster_id_seq', 5, true);


--
-- Name: galaxy galxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galxy_name_key UNIQUE (name);


--
-- Name: galaxy galxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: supercluster supercluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster
    ADD CONSTRAINT supercluster_name_key UNIQUE (name);


--
-- Name: supercluster supercluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supercluster
    ADD CONSTRAINT supercluster_pkey PRIMARY KEY (supercluster_id);


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

