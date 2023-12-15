--
-- PostgreSQL database dump
--

-- Dumped from database version 16rc1
-- Dumped by pg_dump version 16rc1

-- Started on 2023-12-14 22:01:35

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
-- TOC entry 11 (class 2615 OID 31020)
-- Name: projeto_final; Type: SCHEMA; Schema: -; Owner: jhonatanuff
--

CREATE SCHEMA projeto_final;


ALTER SCHEMA projeto_final OWNER TO jhonatanuff;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 282 (class 1259 OID 31117)
-- Name: batalha; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.batalha (
    batalha_id integer NOT NULL,
    ginasio_id integer,
    data date,
    vencedor_id integer NOT NULL
);


ALTER TABLE projeto_final.batalha OWNER TO jhonatanuff;

--
-- TOC entry 281 (class 1259 OID 31116)
-- Name: batalha_batalha_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.batalha_batalha_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.batalha_batalha_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6048 (class 0 OID 0)
-- Dependencies: 281
-- Name: batalha_batalha_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.batalha_batalha_id_seq OWNED BY projeto_final.batalha.batalha_id;


--
-- TOC entry 269 (class 1259 OID 31067)
-- Name: bolsa; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.bolsa (
    bolsa_id integer NOT NULL,
    cor character varying(20),
    modelo character(1)
);


ALTER TABLE projeto_final.bolsa OWNER TO jhonatanuff;

--
-- TOC entry 268 (class 1259 OID 31066)
-- Name: bolsa_bolsa_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.bolsa_bolsa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.bolsa_bolsa_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6049 (class 0 OID 0)
-- Dependencies: 268
-- Name: bolsa_bolsa_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.bolsa_bolsa_id_seq OWNED BY projeto_final.bolsa.bolsa_id;


--
-- TOC entry 280 (class 1259 OID 31110)
-- Name: ginasio; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.ginasio (
    ginasio_id integer NOT NULL,
    regiao_id integer NOT NULL,
    nome character varying(50)
);


ALTER TABLE projeto_final.ginasio OWNER TO jhonatanuff;

--
-- TOC entry 279 (class 1259 OID 31109)
-- Name: ginasio_ginasio_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.ginasio_ginasio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.ginasio_ginasio_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6050 (class 0 OID 0)
-- Dependencies: 279
-- Name: ginasio_ginasio_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.ginasio_ginasio_id_seq OWNED BY projeto_final.ginasio.ginasio_id;


--
-- TOC entry 271 (class 1259 OID 31074)
-- Name: item; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.item (
    item_id integer NOT NULL,
    bolsa_id integer NOT NULL,
    tipo_item character varying(20),
    descricao character varying(255),
    preco numeric(10,2) NOT NULL,
    nome character varying(60)
);


ALTER TABLE projeto_final.item OWNER TO jhonatanuff;

--
-- TOC entry 270 (class 1259 OID 31073)
-- Name: item_item_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.item_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.item_item_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6051 (class 0 OID 0)
-- Dependencies: 270
-- Name: item_item_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.item_item_id_seq OWNED BY projeto_final.item.item_id;


--
-- TOC entry 277 (class 1259 OID 31098)
-- Name: move; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.move (
    move_id integer NOT NULL,
    categoria character varying(20),
    descricao character varying(200),
    poder integer,
    precisao integer,
    nome character varying(50)
);


ALTER TABLE projeto_final.move OWNER TO jhonatanuff;

--
-- TOC entry 276 (class 1259 OID 31097)
-- Name: move_move_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.move_move_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.move_move_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6052 (class 0 OID 0)
-- Dependencies: 276
-- Name: move_move_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.move_move_id_seq OWNED BY projeto_final.move.move_id;


--
-- TOC entry 260 (class 1259 OID 31034)
-- Name: pokedex; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.pokedex (
    pokedex_id integer NOT NULL,
    descricao character varying(200)
);


ALTER TABLE projeto_final.pokedex OWNER TO jhonatanuff;

--
-- TOC entry 259 (class 1259 OID 31033)
-- Name: pokedex_pokedex_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.pokedex_pokedex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.pokedex_pokedex_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6053 (class 0 OID 0)
-- Dependencies: 259
-- Name: pokedex_pokedex_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.pokedex_pokedex_id_seq OWNED BY projeto_final.pokedex.pokedex_id;


--
-- TOC entry 262 (class 1259 OID 31041)
-- Name: pokemon; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.pokemon (
    pokemon_id integer NOT NULL,
    pokedex_id integer NOT NULL,
    nome character varying(60),
    lvl integer NOT NULL,
    atk integer NOT NULL,
    def integer NOT NULL,
    sp_def integer NOT NULL,
    sp_atk integer NOT NULL,
    vel integer NOT NULL,
    hp integer NOT NULL
);


ALTER TABLE projeto_final.pokemon OWNER TO jhonatanuff;

--
-- TOC entry 278 (class 1259 OID 31104)
-- Name: pokemon_move; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.pokemon_move (
    pokemon_id integer NOT NULL,
    move_id integer NOT NULL
);


ALTER TABLE projeto_final.pokemon_move OWNER TO jhonatanuff;

--
-- TOC entry 261 (class 1259 OID 31040)
-- Name: pokemon_pokemon_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.pokemon_pokemon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.pokemon_pokemon_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6054 (class 0 OID 0)
-- Dependencies: 261
-- Name: pokemon_pokemon_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.pokemon_pokemon_id_seq OWNED BY projeto_final.pokemon.pokemon_id;


--
-- TOC entry 256 (class 1259 OID 31021)
-- Name: pokemon_time; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.pokemon_time (
    pokemon_id integer NOT NULL,
    time_id integer NOT NULL
);


ALTER TABLE projeto_final.pokemon_time OWNER TO jhonatanuff;

--
-- TOC entry 275 (class 1259 OID 31092)
-- Name: pokemon_tipo_pokemon; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.pokemon_tipo_pokemon (
    pokemon_id integer NOT NULL,
    tipo_pokemon_id integer NOT NULL
);


ALTER TABLE projeto_final.pokemon_tipo_pokemon OWNER TO jhonatanuff;

--
-- TOC entry 265 (class 1259 OID 31053)
-- Name: regiao; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.regiao (
    regiao_id integer NOT NULL,
    nome character varying(100),
    descricao character varying(100)
);


ALTER TABLE projeto_final.regiao OWNER TO jhonatanuff;

--
-- TOC entry 264 (class 1259 OID 31052)
-- Name: regiao_regiao_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.regiao_regiao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.regiao_regiao_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6055 (class 0 OID 0)
-- Dependencies: 264
-- Name: regiao_regiao_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.regiao_regiao_id_seq OWNED BY projeto_final.regiao.regiao_id;


--
-- TOC entry 258 (class 1259 OID 31027)
-- Name: time; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final."time" (
    time_id integer NOT NULL
);


ALTER TABLE projeto_final."time" OWNER TO jhonatanuff;

--
-- TOC entry 257 (class 1259 OID 31026)
-- Name: time_time_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.time_time_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.time_time_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6056 (class 0 OID 0)
-- Dependencies: 257
-- Name: time_time_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.time_time_id_seq OWNED BY projeto_final."time".time_id;


--
-- TOC entry 274 (class 1259 OID 31086)
-- Name: tipo_pokemon; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.tipo_pokemon (
    tipo_pokemon_id integer NOT NULL,
    descricao character varying(255),
    nome_tipo character varying(30) NOT NULL
);


ALTER TABLE projeto_final.tipo_pokemon OWNER TO jhonatanuff;

--
-- TOC entry 273 (class 1259 OID 31085)
-- Name: tipo_pokemon_tipo_pokemon_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.tipo_pokemon_tipo_pokemon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.tipo_pokemon_tipo_pokemon_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6057 (class 0 OID 0)
-- Dependencies: 273
-- Name: tipo_pokemon_tipo_pokemon_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.tipo_pokemon_tipo_pokemon_id_seq OWNED BY projeto_final.tipo_pokemon.tipo_pokemon_id;


--
-- TOC entry 267 (class 1259 OID 31060)
-- Name: treinador; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.treinador (
    treinador_id integer NOT NULL,
    regiao_id integer NOT NULL,
    nome character varying(100),
    sexo character(1),
    idade integer
);


ALTER TABLE projeto_final.treinador OWNER TO jhonatanuff;

--
-- TOC entry 283 (class 1259 OID 31123)
-- Name: treinador_batalha; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.treinador_batalha (
    batalha_id integer NOT NULL,
    treinador_id integer NOT NULL
);


ALTER TABLE projeto_final.treinador_batalha OWNER TO jhonatanuff;

--
-- TOC entry 272 (class 1259 OID 31080)
-- Name: treinador_bolsa; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.treinador_bolsa (
    treinador_id integer NOT NULL,
    bolsa_id integer NOT NULL
);


ALTER TABLE projeto_final.treinador_bolsa OWNER TO jhonatanuff;

--
-- TOC entry 263 (class 1259 OID 31047)
-- Name: treinador_time; Type: TABLE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TABLE projeto_final.treinador_time (
    treinador_id integer NOT NULL,
    time_id integer NOT NULL
);


ALTER TABLE projeto_final.treinador_time OWNER TO jhonatanuff;

--
-- TOC entry 266 (class 1259 OID 31059)
-- Name: treinador_treinador_id_seq; Type: SEQUENCE; Schema: projeto_final; Owner: jhonatanuff
--

CREATE SEQUENCE projeto_final.treinador_treinador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE projeto_final.treinador_treinador_id_seq OWNER TO jhonatanuff;

--
-- TOC entry 6058 (class 0 OID 0)
-- Dependencies: 266
-- Name: treinador_treinador_id_seq; Type: SEQUENCE OWNED BY; Schema: projeto_final; Owner: jhonatanuff
--

ALTER SEQUENCE projeto_final.treinador_treinador_id_seq OWNED BY projeto_final.treinador.treinador_id;


--
-- TOC entry 284 (class 1259 OID 31225)
-- Name: view_all_pokemons; Type: VIEW; Schema: projeto_final; Owner: jhonatanuff
--

CREATE VIEW projeto_final.view_all_pokemons AS
 SELECT p.pokemon_id,
    p.nome,
    p.lvl,
    p.atk,
    p.def,
    p.sp_def,
    p.sp_atk,
    p.vel,
    p.hp,
    pd.descricao AS pokedex_descricao,
    tp.nome_tipo
   FROM (((projeto_final.pokemon p
     JOIN projeto_final.pokedex pd ON ((p.pokedex_id = pd.pokedex_id)))
     JOIN projeto_final.pokemon_tipo_pokemon ptp ON ((p.pokemon_id = ptp.pokemon_id)))
     JOIN projeto_final.tipo_pokemon tp ON ((ptp.tipo_pokemon_id = tp.tipo_pokemon_id)));


ALTER VIEW projeto_final.view_all_pokemons OWNER TO jhonatanuff;

--
-- TOC entry 286 (class 1259 OID 31234)
-- Name: view_media_atributos_tipo_pokemon; Type: VIEW; Schema: projeto_final; Owner: jhonatanuff
--

CREATE VIEW projeto_final.view_media_atributos_tipo_pokemon AS
 SELECT tp.nome_tipo,
    round(avg(p.hp), 0) AS media_hp,
    round(avg(p.atk), 0) AS media_atk,
    round(avg(p.def), 0) AS media_def,
    round(avg(p.sp_def), 0) AS media_sp_def,
    round(avg(p.sp_atk), 0) AS media_sp_atk,
    round(avg(p.vel), 0) AS media_vel
   FROM ((projeto_final.pokemon p
     JOIN projeto_final.pokemon_tipo_pokemon ptp ON ((p.pokemon_id = ptp.pokemon_id)))
     JOIN projeto_final.tipo_pokemon tp ON ((ptp.tipo_pokemon_id = tp.tipo_pokemon_id)))
  GROUP BY tp.nome_tipo;


ALTER VIEW projeto_final.view_media_atributos_tipo_pokemon OWNER TO jhonatanuff;

--
-- TOC entry 285 (class 1259 OID 31230)
-- Name: view_todas_as_vitorias; Type: VIEW; Schema: projeto_final; Owner: jhonatanuff
--

CREATE VIEW projeto_final.view_todas_as_vitorias AS
 SELECT t.nome AS treinador_nome,
    g.nome AS ginasio_nome,
    b.data AS data_batalha
   FROM (((projeto_final.treinador t
     LEFT JOIN projeto_final.treinador_batalha tb ON ((t.treinador_id = tb.treinador_id)))
     LEFT JOIN projeto_final.batalha b ON ((tb.batalha_id = b.batalha_id)))
     LEFT JOIN projeto_final.ginasio g ON ((b.ginasio_id = g.ginasio_id)))
  WHERE (tb.treinador_id = b.vencedor_id);


ALTER VIEW projeto_final.view_todas_as_vitorias OWNER TO jhonatanuff;

--
-- TOC entry 5786 (class 2604 OID 31120)
-- Name: batalha batalha_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.batalha ALTER COLUMN batalha_id SET DEFAULT nextval('projeto_final.batalha_batalha_id_seq'::regclass);


--
-- TOC entry 5781 (class 2604 OID 31070)
-- Name: bolsa bolsa_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.bolsa ALTER COLUMN bolsa_id SET DEFAULT nextval('projeto_final.bolsa_bolsa_id_seq'::regclass);


--
-- TOC entry 5785 (class 2604 OID 31113)
-- Name: ginasio ginasio_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.ginasio ALTER COLUMN ginasio_id SET DEFAULT nextval('projeto_final.ginasio_ginasio_id_seq'::regclass);


--
-- TOC entry 5782 (class 2604 OID 31077)
-- Name: item item_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.item ALTER COLUMN item_id SET DEFAULT nextval('projeto_final.item_item_id_seq'::regclass);


--
-- TOC entry 5784 (class 2604 OID 31101)
-- Name: move move_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.move ALTER COLUMN move_id SET DEFAULT nextval('projeto_final.move_move_id_seq'::regclass);


--
-- TOC entry 5777 (class 2604 OID 31037)
-- Name: pokedex pokedex_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokedex ALTER COLUMN pokedex_id SET DEFAULT nextval('projeto_final.pokedex_pokedex_id_seq'::regclass);


--
-- TOC entry 5778 (class 2604 OID 31044)
-- Name: pokemon pokemon_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon ALTER COLUMN pokemon_id SET DEFAULT nextval('projeto_final.pokemon_pokemon_id_seq'::regclass);


--
-- TOC entry 5779 (class 2604 OID 31056)
-- Name: regiao regiao_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.regiao ALTER COLUMN regiao_id SET DEFAULT nextval('projeto_final.regiao_regiao_id_seq'::regclass);


--
-- TOC entry 5776 (class 2604 OID 31030)
-- Name: time time_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final."time" ALTER COLUMN time_id SET DEFAULT nextval('projeto_final.time_time_id_seq'::regclass);


--
-- TOC entry 5783 (class 2604 OID 31089)
-- Name: tipo_pokemon tipo_pokemon_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.tipo_pokemon ALTER COLUMN tipo_pokemon_id SET DEFAULT nextval('projeto_final.tipo_pokemon_tipo_pokemon_id_seq'::regclass);


--
-- TOC entry 5780 (class 2604 OID 31063)
-- Name: treinador treinador_id; Type: DEFAULT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador ALTER COLUMN treinador_id SET DEFAULT nextval('projeto_final.treinador_treinador_id_seq'::regclass);


--
-- TOC entry 6041 (class 0 OID 31117)
-- Dependencies: 282
-- Data for Name: batalha; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.batalha (batalha_id, ginasio_id, data, vencedor_id) FROM stdin;
1	1	2023-01-03	1
2	2	2023-01-07	5
3	3	2023-01-09	7
4	4	2023-01-14	2
5	3	2023-01-18	9
6	2	2023-01-25	3
7	7	2023-02-07	11
8	8	2023-02-14	10
9	9	2023-02-18	4
10	10	2023-02-21	5
11	11	2023-02-28	12
12	12	2023-03-02	7
13	8	2023-03-12	4
14	2	2023-02-14	3
15	3	2023-02-16	5
16	7	2023-02-19	9
17	\N	2023-02-22	5
18	\N	2023-03-01	2
19	\N	2023-03-05	8
20	\N	2023-03-08	4
21	\N	2023-03-11	1
\.


--
-- TOC entry 6028 (class 0 OID 31067)
-- Dependencies: 269
-- Data for Name: bolsa; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.bolsa (bolsa_id, cor, modelo) FROM stdin;
1	Vermelho	A
2	Carmesin	B
3	Fuxia	C
4	Bordeaux	D
5	Ciano	E
6	Grená	F
7	Índigo	A
8	Preto	C
9	Verde	D
10	Amarelo	B
11	Laranja	C
12	Cinza	A
\.


--
-- TOC entry 6039 (class 0 OID 31110)
-- Dependencies: 280
-- Data for Name: ginasio; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.ginasio (ginasio_id, regiao_id, nome) FROM stdin;
1	1	Ginásio das Pedras
2	3	Ginásio Sombroso
3	5	Ginásio Dragão
4	7	Ginásio Elétrico
5	4	Ginásio das Águas
6	6	Ginásio do Fogo
7	2	Ginásio do Aço
8	9	Ginásio Fantasma
9	8	Ginásio Venenoso
10	3	Ginásio Voador
11	4	Ginásio Terrestre
12	7	Ginásio Fada
\.


--
-- TOC entry 6030 (class 0 OID 31074)
-- Dependencies: 271
-- Data for Name: item; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.item (item_id, bolsa_id, tipo_item, descricao, preco, nome) FROM stdin;
1	7	all-mail	Stationery featuring a print of atough-looking brick pattern.Let a Pokémon hold it for delivery.	5.00	brick-mail
2	1	vitamins	A candy that is packed with energy. When consumed,it will instantly raise the level of a single Pokémonby one.	1000.00	rare-candy
3	6	special-balls	A somewhat rare Poké Ball that was made as acommemorative item used to celebrate an event ofsome sort.	2.00	premier-ball
4	3	spelunking	A flute made from black glass. It makes it easier toencounter strong Pokémon in the place you use it.	2.00	black-flute
5	6	status-cures	A spray-type medicine for treating burns. It can beused to heal a single Pokémon suffering from a burn.	20.00	burn-heal
6	4	all-mail	Stationery featuring a print of giantheart patterns.Let a Pokémon hold it for delivery.	5.00	heart-mail
7	10	evolution	A peculiar stone that can make certain species ofPokémon evolve. It sparkles like a glittering eye.	300.00	dawn-stone
8	8	evolution	A peculiar stone that can make certain species ofPokémon evolve. It burns as red as the evening sun.	300.00	sun-stone
9	6	healing	An extremely bitter medicinal root. It can be used torestore 120 HP to a single Pokémon.	120.00	energy-root
10	8	evolution	A peculiar stone that can make certain species ofPokémon evolve. It has an unmistakable leaf pattern.	300.00	leaf-stone
11	8	vitamins	A medicine that optimally raises the max PP of a singleselected move that has been learned by a Pokémon.	1000.00	pp-max
12	1	all-mail	Stationery featuring a print ofcolorful letter sets.Let a Pokémon hold it for delivery.	5.00	air-mail
13	6	special-balls	A somewhat rare Poké Ball that was made as acommemorative item used to celebrate an event ofsome sort.	2.00	premier-ball
14	9	status-cures	A very bitter medicinal powder. It can be used onceto heal all the status conditions of a Pokémon.	30.00	heal-powder
15	4	loot	A nugget of the purest gold that gives off a lustrousgleam in direct light. It can be sold at a high priceto shops.	1000.00	nugget
16	1	healing	A bottle of highly nutritious milk. It can be used torestore 100 HP to a single Pokémon.	60.00	moomoo-milk
17	11	special-balls	A somewhat different Poké Ball that is moreeffective when attempting to catch Water- orBug-type Pokémon.	100.00	net-ball
18	3	mulch	A fertilizer for growing Berries. However, it appearsto be unsuitable for the soil in the Hoenn region andhas no effect.	20.00	stable-mulch
19	4	special-balls	A somewhat different Poké Ball that has a moresuccessful catch rate if used at the start of awild encounter.	100.00	quick-ball
20	3	revival	A medicine that can be used to revive a singlePokémon that has fainted. It also fully restoresthe Pokémon’s max HP.	400.00	max-revive
21	1	all-mail	Stationery featuring a print depictingthe huge expanse of space.Let a Pokémon hold it for delivery.	5.00	space-mail
22	5	status-cures	A spray-type medicine for treating burns. It can beused to heal a single Pokémon suffering from a burn.	20.00	burn-heal
23	9	special-balls	A quite rare Poké Ball that has been crafted inorder to commemorate a special occasion ofsome sort.	0.00	cherish-ball
24	2	mulch	A fertilizer for growing Berries. However, it appearsto be unsuitable for the soil in the Hoenn region andhas no effect.	20.00	stable-mulch
25	10	healing	A spray-type medicine for treating wounds. It canbe used to restore 20 HP to a single Pokémon.	20.00	potion
26	6	healing	A very sweet and refreshing drink. It can be used torestore 70 HP to a single Pokémon.	40.00	lemonade
27	4	dex-completion	A fossil from a prehistoric Pokémon that once livedin the sea. It appears to be a fragment of a claw.	700.00	claw-fossil
28	6	revival	This rare ash can revive all fainted Pokémon in aparty. In doing so, it also fully restores their max HP.	5000.00	sacred-ash
29	7	dex-completion	A sweet honey collected by Pokémon. It has a lusharoma and can be sold at a low price to shops.	90.00	honey
30	10	standard-balls	An ultra-high-performance Poké Ball that providesa higher success rate for catching Pokémon thana Great Ball.	80.00	ultra-ball
31	12	stat-boosts	An item that sharply boosts the Defense stat of aPokémon during a battle. It wears off once thePokémon is withdrawn.	200.00	x-defense
32	8	healing	A medicine that can be used to fully restore the HP ofa single Pokémon and heal any status conditions it has.	300.00	full-restore
33	1	all-mail	Stationery featuring a print ofcolorful letter sets.Let a Pokémon hold it for delivery.	5.00	air-mail
34	8	special-balls	A somewhat different Poké Ball that has a moresuccessful catch rate if used at the start of awild encounter.	100.00	quick-ball
35	5	stat-boosts	An item that sharply boosts the Speed stat of aPokémon during a battle. It wears off once thePokémon is withdrawn.	100.00	x-speed
36	5	loot	A rare bone that is extremely valuable for thestudy of Pokémon archeology. It can be sold for ahigh price to shops.	500.00	rare-bone
37	11	dex-completion	A piece of amber that still contains the geneticmaterial of an ancient Pokémon. It’s clear with atawny, reddish tint.	1000.00	old-amber
38	6	vitamins	A candy that is packed with energy. When consumed,it will instantly raise the level of a single Pokémonby one.	1000.00	rare-candy
39	9	dex-completion	A fossil from a prehistoric Pokémon that once livedin the sea. It appears to be a fragment of a claw.	700.00	claw-fossil
40	9	healing	A spray-type medicine for treating wounds. It canbe used to restore 20 HP to a single Pokémon.	20.00	potion
41	9	revival	A medicine that can be used to revive a singlePokémon that has fainted. It also restores half ofthe Pokémon’s max HP.	200.00	revive
42	10	loot	Lovely red sand that flows between the fingerswith a loose, silky feel. It can be sold at a low priceto shops.	300.00	stardust
43	3	vitamins	A medicine that slightly raises the max PP of a singleselected move that has been learned by a Pokémon.	1000.00	pp-up
44	6	dex-completion	A fossil from a prehistoric Pokémon that once livedin the sea. It might be a piece of a seashell.	700.00	helix-fossil
45	9	vitamins	A medicine that optimally raises the max PP of a singleselected move that has been learned by a Pokémon.	1000.00	pp-max
46	10	medicine	A Berry to be consumed by Pokémon. If a Pokémonholds one, it can recover from paralysis on its ownin battle.	8.00	cheri-berry
47	12	healing	A bottle of highly nutritious milk. It can be used torestore 100 HP to a single Pokémon.	60.00	moomoo-milk
48	5	all-mail	Stationery featuring a print of giantheart patterns.Let a Pokémon hold it for delivery.	5.00	heart-mail
49	1	dex-completion	A fossil from a prehistoric Pokémon that once livedin the sea. It might be a piece of a seashell.	700.00	helix-fossil
50	7	special-balls	A somewhat rare Poké Ball that was made as acommemorative item used to celebrate an event ofsome sort.	2.00	premier-ball
\.


--
-- TOC entry 6036 (class 0 OID 31098)
-- Dependencies: 277
-- Data for Name: move; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.move (move_id, categoria, descricao, poder, precisao, nome) FROM stdin;
1	Physical	Pounds with forelegs or tail.	40	100	Pound
2	Physical	A chopping attack with a high critical-hit ratio.	50	100	Karate Chop
3	Physical	Repeatedly slaps 2-5 times.	15	85	Double Slap
4	Physical	Repeatedly punches 2-5 times.	18	85	Comet Punch
5	Physical	A strong punch thrown with incredible power.	80	85	Mega Punch
6	Physical	Throws coins at the foe. Money is recovered after.	40	100	Pay Day
7	Physical	A fiery punch that may burn the foe.	75	100	Fire Punch
8	Physical	An icy punch that may freeze the target.	75	100	Ice Punch
9	Physical	The target is punched with an electrified fist. It may also leave the target with paralysis	75	100	Thunder Punch
10	Physical	Scratches the target with sharp claws.	40	100	Scratch
11	Physical	Huge, impressive pincers grip and squeeze the foe.	55	100	Vise Grip
12	Special	A two-turn attack. Blades of wind hit the foe on the second turn. It has a high critical-hit ratio.	80	100	Razor Wind
13	Physical	The foe is cut with a scythe or claw.	50	95	Cut
14	Special	Whips up a strong gust of wind.	40	100	Gust
15	Physical	Strikes the target with wings.	60	100	Wing Attack
16	Status	\N	\N	\N	Whirlwind
17	Physical	\N	\N	\N	Fly
18	Physical	\N	\N	\N	Bind
19	Physical	\N	\N	\N	Slam
20	Physical	\N	\N	\N	Vine Whip
21	Physical	\N	\N	\N	Stomp
\.


--
-- TOC entry 6019 (class 0 OID 31034)
-- Dependencies: 260
-- Data for Name: pokedex; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.pokedex (pokedex_id, descricao) FROM stdin;
1	There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.
2	When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.
3	Its plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.
4	Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.
5	When it swings its burning tail, it elevates the temperature to unbearably high levels.
6	Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.
7	After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.
8	Often hides in water to stalk unwary prey. For swimming fast, it moves its ears to maintain balance.
9	A brutal Pokémon with pressurized water jets on its shell. They are used for high-speed tackles.
10	For protection, it releases a horrible stench from the antenna on its head to drive away enemies.
11	Its shell is filled with its soft body to store energy. It will be motionless in this state to prepare for its evolution.
12	In battle, it flaps its wings at great speed to release highly toxic dust into the air.
13	Often found in forests, eating leaves. It has a sharp venomous stinger on its head.
14	Almost incapable of moving, this Pokémon can only harden its shell to protect itself from predators.
15	Flies at high speed and attacks using its large venomous stingers on its forelegs and tail.
16	A common sight in forests and woods. It flaps its wings at ground level to kick up blinding sand.
17	Very protective of its sprawling territorial area, this Pokémon will fiercely peck at any intruder.
18	When hunting, it skims the surface of water at high speed to pick off unwary prey such as Magikarp.
19	Bites anything when it attacks. Small and very quick, it is a common sight in many places.
20	It uses its whiskers to maintain its balance. It apparently slows down if they are cut off.
21	It flies at high speed and attacks using the large venomous stinger on its tail.
22	It uses its long beak to attack. It has a surprisingly large territory.
23	Its fangs are long and very sharp. They grow continuously, so it gnaws on hard things to whittle them down.
24	It is rumored that the ferocious warning markings on its belly differ from area to area.
25	When it is angered, it immediately discharges the energy stored in the pouches in its cheeks.
26	If it looses crackling power from the electrical pouches on its cheeks, it is being wary.
27	It burrows and lives underground. If threatened, it curls itself up into a ball for protection.
28	It is adept at seeing and digging the earth’s crust. It can even dig through hard, packed soil.
29	Although small, its venomous barbs render this Pokémon dangerous. The female has smaller horns.
30	The female’s horns develop slowly. Prefers physical attacks such as clawing and biting.
31	Its hard scales provide strong protection. It uses its hefty bulk to execute powerful moves.
32	Stiffens its ears to sense danger. The larger its horns, the more powerful its secreted venom.
33	An aggressive POKéMON that is quick to attack. The horn on its head secretes a powerful venom.
34	It uses its powerful tail in battle to smash, constrict, then break the prey´s bones.
35	Its magical and cute appeal has many admirers. It is rare and found only in certain areas.
36	A timid fairy POKéMON that is rarely seen. It will run and hide the moment it senses people.
37	At the time of birth, it has just one tai.The tail splitsfrom its tip asit grows older.
38	Very smart and very vengeful. Grabbing one of its many tails could result in a 1000-year curse.
39	When its huge eyes light up, it sings a mysteriously soothing melody that lulls its enemies to sleep.
40	The body is soft and rubbery. When angered, it will suck in air and inflate itself to an enormous size.
41	Forms colonies in perpetually dark places. Uses ultrasonic waves to identify and approach targets.
42	Once it strikes, it will not stop draining energy from the victim even if it gets too heavy to fly.
43	During the day, it keeps its face buried in the ground. At night, it wanders around sowing its seeds.
44	The fluid that oozes from its mouth isn’t drool. It is a nectar that is used to attract prey.
45	The larger its petals, the more toxic pollen it contains. Its big head is heavy and hard to hold up.
46	Burrows to suck tree roots. The mushrooms on its back grow by draw­ ing nutrients from the bug host.
47	A host-parasite pair in which the parasite mushroom has taken over the host bug. Prefers damp places.
48	Lives in the shadows of tall trees where it eats insects. It is attracted by light at night.
49	The dust-like scales covering its wings are color coded to indicate the kinds of poison it has.
50	Lives about one yard underground where it feeds on plant roots. It sometimes appears above ground.
51	A team of DIGLETT triplets. It triggers huge earthquakes by burrowing 60 miles underground.
52	Adores circular objects. Wanders the streets on a nightly basis to look for dropped loose change.
53	Although its fur has many admirers, it is tough to raise as a pet because of its fickle meanness.
54	While lulling its enemies with its vacant look, this wily POKéMON will use psychokinetic powers.
55	Often seen swim­ ming elegantly by lake shores. It is often mistaken for the Japanese monster, Kappa.
56	Extremely quick to anger. It could be docile one moment then thrashing away the next instant.
57	Always furious and tenacious to boot. It will not abandon chasing its quarry until it is caught.
58	Very protective of its territory. It will bark and bite to repel intruders from its space.
59	A POKéMON that has been admired since the past for its beauty. It runs agilely as if on wings.
60	Its newly grown legs prevent it from running. It appears to prefer swimming than trying to stand.
61	Capable of living in or out of water. When out of water, it sweats to keep its body slimy.
62	An adept swimmer at both the front crawl and breast stroke. Easily overtakes the best human swimmers.
63	Using its ability to read minds, it will identify impending danger and TELEPORT to safety.
64	It emits special alpha waves from its body that induce headaches just by being close by.
65	Its brain can out­ perform a super­ computer. Its intelligence quotient is said to be 5,000.
66	Loves to build its muscles. It trains in all styles of martial arts to become even stronger.
67	Its muscular body is so powerful, it must wear a power save belt to be able to regulate its motions.
68	Using its heavy muscles, it throws powerful punches that can send the victim clear over the horizon.
69	A carnivorous POKéMON that traps and eats bugs. It uses its root feet to soak up needed moisture.
70	It spits out POISONPOWDER to immobilize the enemy and then finishes it with a spray of ACID.
71	Said to live in huge colonies deep in jungles, although no one has ever returned from there.
72	Drifts in shallow seas. Anglers who hook them by accident are often punished by its stinging acid.
73	The tentacles are normally kept short. On hunts, they are extended to ensnare and immobilize prey.
74	Found in fields and mountains. Mistaking them for boulders, people often step or trip on them.
75	Rolls down slopes to move. It rolls over any obstacle without slowing or changing its direction.
76	Its boulder-like body is extremely hard. It can easily withstand dynamite blasts without damage.
77	Its hooves are 10 times harder than diamonds. It can trample anything completely flat in little time.
78	Very competitive, this POKéMON will chase anything that moves fast in the hopes of racing it.
79	Incredibly slow and dopey. It takes 5 seconds for it to feel pain when under attack.
80	The SHELLDER that is latched onto SLOWPOKE’s tail is said to feed on the host’s left over scraps.
81	Uses anti-gravity to stay suspended. Appears without warning and uses THUNDER WAVE and similar moves.
82	Formed by several MAGNEMITEs linked together. They frequently appear when sunspo’ts\nflare up.
83	The sprig of green onions it holds is its weapon. It is used much like a metal sword.
84	A bird that makes up for its poor flying with its fast foot speed. Leaves giant footprints.
85	Uses its three brains to execute complex plans. While two heads sleep, one head stays awake.
86	The protruding horn on its head is very hard. It is used for bashing through thick ice.
87	Stores thermal energy in its body. Swims at a steady 8 knots even in intensely cold waters.
88	Appears in filthy areas. Thrives by sucking up polluted sludge that is pumped out of factories.
89	Thickly covered with a filthy, vile sludge. It is so toxic, even its footprints contain poison.
90	Its hard shell repels any kind of attack. It is vulnerable only when its shell is open.
91	When attacked, it launches its horns in quick volleys. Its innards have never been seen.
92	Almost invisible, this gaseous POKéMON cloaks the target and puts it to sleep without notice.
93	Because of its ability to slip through block walls, it is said to be from an­ other dimension.
94	Under a full moon, this POKéMON likes to mimic the shadows of people and laugh at their fright.
95	As it grows, the stone portions of its body harden to become similar to a diamond, but colored black.
96	Puts enemies to sleep then eats their dreams. Occasionally gets sick from eating bad dreams.
97	When it locks eyes with an enemy, it will use a mix of PSI moves such as HYPNOSIS and CONFUSION.
98	Its pincers are not only powerful weapons, they are used for balance when walking sideways.
99	The large pincer has 10000 hp of crushing power. However, its huge size makes it unwieldy to use.
100	Usually found in power plants. Easily mistaken for a POKé BALL, they have zapped many people.
101	It stores electric energy under very high pressure. It often explodes with little or no provocation.
102	Often mistaken for eggs. When disturbed, they quickly gather and attack in swarms.
103	Legend has it that on rare occasions, one of its heads will drop off and continue on as an EXEGGCUTE.
104	Because it never removes its skull helmet, no one has ever seen this POKéMON’s real face.
105	The bone it holds is its key weapon. It throws the bone skillfully like a boomerang to KO targets.
106	When in a hurry, its legs lengthen progressively. It runs smoothly with extra long, loping strides.
107	While apparently doing nothing, it fires punches in lightning fast volleys that are impossible to see.
108	Its tongue can be extended like a chameleon’s. It leaves a tingling sensation when it licks enemies.
109	Because it stores several kinds of toxic gases in its body, it is prone to exploding without warning.
110	Where two kinds of poison gases meet, 2 KOFFINGs can fuse into a WEEZING over many years.
111	Its massive bones are 1000 times harder than human bones. It can easily knock a trailer flying.
112	Protected by an armor-like hide, it is capable of living in molten lava of 3,600 degrees.
113	A rare and elusive POKéMON that is said to bring happiness to those who manage to get it.
114	The whole body is swathed with wide vines that are similar to sea­weed. Its vines shake as it walks.
115	The infant rarely ventures out of its mother’s protective pouch until it is 3 years old.
116	Known to shoot down flying bugs with precision blasts of ink from the surface of the water.
117	Capable of swim­ming backwards by rapidly flapping its wing-like pectoral fins and stout tail.
118	Its tail fin billows like an elegant ballroom dress, giving it the nickname of the Water Queen.
119	In the autumn spawning season, they can be seen swimming power­ fully up rivers and creeks.
120	An enigmatic POKéMON that can effortlessly regenerate any appendage it loses in battle.
121	Its central core glows with the seven colors of the rainbow. Some people value the core as a gem.
122	If interrupted while it is miming, it will slap around the offender with its broad hands.
123	With ninja-like agility and speed, it can create the illusion that there is more than one.
124	It seductively wiggles its hips as it walks. It can cause people to dance in unison with it.
125	Normally found near power plants, they can wander away and cause major blackouts in cities.
126	Its body always burns with an orange glow that enables it to hide perfectly among flames.
127	If it fails to crush the victim in its pincers, it will swing it around and toss it hard.
128	When it targets an enemy, it charges furiously while whipping its body with its long tails.
129	In the distant past, it was somewhat stronger than the horribly weak descendants that exist today.
130	Rarely seen in the wild. Huge and vicious, it is capable of destroying entire cities in a rage.
131	A POKéMON that has been over­ hunted almost to extinction. It can ferry people across the water.
132	Capable of copying an enemy’s genetic code to instantly transform itself into a duplicate of the enemy.
133	Its genetic code is irregular. It may mutate if it is exposed to radiation from element STONEs.
134	Lives close to water. Its long tail is ridged with a fin which is often mistaken for a mermaid’s.
135	It accumulates negative ions in the atmosphere to blast out 10000- volt lightning bolts.
136	When storing thermal energy in its body, its temperature could soar to over 1600 degrees.
137	A POKéMON that consists entirely of programming code. Capable of moving freely in cyberspace.
138	Although long extinct, in rare cases, it can be genetically resurrected from fossils.
139	A prehistoric POKéMON that died out when its heavy shell made it impossible to catch prey.
140	A POKéMON that was resurrected from a fossil found in what was once the ocean floor eons ago.
141	Its sleek shape is perfect for swim­ ming. It slashes prey with its claws and drains the body fluids.
142	A ferocious, pre­ historic POKéMON that goes for the enemy’s throat with its serrated saw-like fangs.
143	Very lazy. Just eats and sleeps. As its rotund bulk builds, it becomes steadily more slothful.
144	A legendary bird POKéMON that is said to appear to doomed people who are lost in icy mountains.
145	A legendary bird POKéMON that is said to appear from clouds while dropping enormous lightning bolts.
146	Known as the legendary bird of fire. Every flap of its wings creates a dazzling flash of flames.
147	Long considered a mythical POKéMON until recently when a small colony was found living underwater.
148	A mystical POKéMON that exudes a gentle aura. Has the ability to change climate conditions.
149	An extremely rarely seen marine POKéMON. Its intelligence is said to match that of humans.
150	It was created by a scientist after years of horrific gene splicing and DNA engineering experiments.
151	So rare that it is still said to be a mirage by many experts. Only a few people have seen it worldwide.
152	\N
153	\N
154	\N
155	\N
156	\N
157	\N
158	\N
159	\N
160	\N
161	\N
162	\N
163	\N
164	\N
165	\N
166	\N
167	\N
168	\N
169	\N
170	\N
171	\N
\.


--
-- TOC entry 6021 (class 0 OID 31041)
-- Dependencies: 262
-- Data for Name: pokemon; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.pokemon (pokemon_id, pokedex_id, nome, lvl, atk, def, sp_def, sp_atk, vel, hp) FROM stdin;
1	56	mankey	56	1	66	10	18	8	67
2	30	nidorina	13	73	52	48	68	67	52
3	37	vulpix	99	76	25	97	20	64	40
4	51	dugtrio	72	20	23	35	61	25	66
5	59	arcanine	62	3	82	62	23	2	56
6	35	clefairy	29	23	89	83	38	20	8
7	62	poliwrath	17	59	80	36	55	26	1
8	15	beedrill	49	83	57	94	63	27	79
9	45	vileplume	93	33	1	37	68	69	11
10	31	nidoqueen	54	92	25	3	3	93	62
11	28	sandslash	26	34	33	50	100	54	17
12	15	beedrill	71	27	68	99	30	36	3
13	38	ninetales	31	66	94	37	78	56	50
14	45	vileplume	100	66	41	47	88	52	79
15	63	abra	6	50	71	52	2	29	6
16	41	zubat	19	33	54	71	62	58	12
17	19	rattata	73	63	64	14	90	84	64
18	28	sandslash	34	19	18	66	77	4	74
19	66	machop	73	35	26	53	14	63	29
20	14	kakuna	77	83	38	21	44	89	27
21	49	venomoth	73	57	3	77	85	55	40
22	18	pidgeot	39	1	53	77	88	64	51
23	51	dugtrio	30	13	42	92	98	37	44
24	5	charmeleon	95	54	42	68	42	60	6
25	11	metapod	96	87	81	85	37	38	73
26	18	pidgeot	94	42	83	85	91	91	25
27	71	victreebel	100	16	87	5	89	30	9
28	52	meowth	6	37	1	31	61	7	20
29	54	psyduck	9	95	62	84	61	19	40
30	37	vulpix	62	81	57	30	45	28	19
31	61	poliwhirl	80	45	34	90	99	94	89
32	53	persian	81	29	35	100	85	26	20
33	12	butterfree	6	22	54	36	18	9	91
34	57	primeape	71	96	25	80	100	5	15
35	56	mankey	15	92	51	92	30	56	63
36	28	sandslash	25	98	97	15	34	63	63
37	30	nidorina	47	99	83	58	70	90	15
38	2	ivysaur	21	22	70	48	22	77	76
39	67	machoke	22	68	7	91	40	13	28
40	70	weepinbell	15	61	100	46	82	12	39
41	38	ninetales	34	25	54	90	99	54	19
42	17	pidgeotto	81	36	91	96	35	81	8
43	2	ivysaur	60	58	82	49	25	49	92
44	23	ekans	88	41	14	39	11	84	8
45	32	nidoran-m	63	76	20	98	10	29	50
46	26	raichu	15	82	44	67	16	97	71
47	24	arbok	29	100	71	33	21	3	14
48	38	ninetales	65	7	40	7	47	98	91
49	64	kadabra	42	99	13	3	34	91	66
50	62	poliwrath	88	52	15	6	12	73	47
51	36	clefable	95	73	39	34	17	5	73
52	42	golbat	21	42	29	82	80	46	71
53	42	golbat	5	64	79	24	81	30	2
54	10	caterpie	51	97	100	13	82	33	86
55	65	alakazam	10	65	81	20	30	82	41
56	66	machop	79	93	50	20	90	75	79
57	49	venomoth	96	35	9	48	15	49	25
58	62	poliwrath	18	96	9	6	15	89	53
59	43	oddish	47	4	17	92	8	67	78
60	36	clefable	88	9	10	44	18	48	84
61	17	pidgeotto	7	88	46	17	81	84	54
62	40	wigglytuff	74	94	65	18	13	71	94
63	15	beedrill	35	14	87	83	94	27	52
64	42	golbat	41	15	19	68	47	67	7
65	38	ninetales	48	74	38	23	29	49	33
66	16	pidgey	87	9	81	85	35	98	46
67	44	gloom	41	6	52	18	43	66	62
68	15	beedrill	82	73	29	24	65	78	37
69	47	parasect	51	70	63	62	31	62	89
70	58	growlithe	92	72	98	5	60	13	37
71	48	venonat	51	19	65	30	93	15	79
72	55	golduck	40	30	62	75	33	52	69
\.


--
-- TOC entry 6037 (class 0 OID 31104)
-- Dependencies: 278
-- Data for Name: pokemon_move; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.pokemon_move (pokemon_id, move_id) FROM stdin;
1	9
1	12
1	4
2	1
2	3
2	6
3	15
4	8
4	9
5	5
6	1
6	3
6	4
6	15
7	8
7	9
7	6
8	14
9	5
10	2
10	15
11	13
11	5
12	1
12	11
12	9
12	15
13	10
13	15
14	14
15	13
15	15
16	2
16	3
16	14
17	12
17	5
18	4
18	5
19	8
19	4
19	14
20	7
21	8
21	3
21	7
22	8
22	3
22	15
23	10
24	4
25	5
26	1
26	3
27	9
28	11
28	4
28	14
29	4
29	13
30	11
30	13
31	10
32	14
33	2
33	15
34	10
34	14
34	6
35	1
36	12
37	3
38	1
38	12
38	15
39	1
39	9
40	3
40	2
40	11
40	12
41	1
42	6
42	15
43	5
44	2
44	14
44	15
45	13
45	15
46	8
46	6
46	15
47	8
47	11
48	10
49	10
49	3
49	12
50	10
50	6
50	14
50	15
51	10
51	4
51	14
51	15
52	3
52	4
52	5
53	2
53	4
53	6
54	10
54	4
54	5
54	15
55	2
56	10
57	2
57	5
58	7
59	8
59	9
59	11
60	1
60	10
60	15
61	1
61	2
61	11
61	9
62	1
62	12
62	5
62	9
63	4
64	15
65	9
65	11
65	12
65	1
66	8
66	1
66	2
66	4
67	2
67	5
67	7
68	5
68	11
68	13
69	14
70	11
70	7
70	15
71	12
72	8
72	13
\.


--
-- TOC entry 6015 (class 0 OID 31021)
-- Dependencies: 256
-- Data for Name: pokemon_time; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.pokemon_time (pokemon_id, time_id) FROM stdin;
1	1
2	1
3	1
4	1
6	1
7	2
8	2
9	2
10	2
11	2
12	2
15	3
18	3
19	4
21	4
22	4
23	4
24	4
26	5
27	5
28	5
29	5
30	5
31	6
32	6
33	6
36	6
38	7
40	7
42	7
43	8
44	8
45	8
46	8
47	8
48	8
50	9
52	9
53	9
54	9
55	10
56	10
57	10
58	10
59	10
60	10
61	11
62	11
63	11
66	11
67	12
69	12
70	12
72	12
\.


--
-- TOC entry 6034 (class 0 OID 31092)
-- Dependencies: 275
-- Data for Name: pokemon_tipo_pokemon; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.pokemon_tipo_pokemon (pokemon_id, tipo_pokemon_id) FROM stdin;
1	2
2	4
3	10
4	5
5	10
6	18
7	11
7	2
8	7
8	4
9	12
9	4
10	4
10	5
11	5
12	7
12	4
13	10
14	12
14	4
15	14
16	4
16	3
17	1
18	5
19	2
20	7
20	4
21	7
21	4
22	1
22	3
23	5
24	10
25	7
26	1
26	3
27	12
27	4
28	1
29	11
30	10
31	11
32	1
33	7
33	3
34	2
35	2
36	5
37	4
38	12
38	4
39	2
40	12
40	4
41	10
42	1
42	3
43	12
43	4
44	4
45	4
46	13
47	4
48	10
49	14
50	11
50	2
51	18
52	4
52	3
53	4
53	3
54	7
55	14
56	2
57	7
57	4
58	11
58	2
59	12
59	4
60	18
61	1
61	3
62	1
62	18
63	7
63	4
64	4
64	3
65	10
66	1
66	3
67	12
67	4
68	7
68	4
69	7
69	12
70	10
71	7
71	4
72	11
\.


--
-- TOC entry 6024 (class 0 OID 31053)
-- Dependencies: 265
-- Data for Name: regiao; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.regiao (regiao_id, nome, descricao) FROM stdin;
1	Kanto	Região da Geração 1 de Pokémon
2	Johto	Região da Geração 2 de Pokémon
3	Hoenn	Região da Geração 3 de Pokémon
4	Sinnoh	Região da Geração 4 de Pokémon
5	Unova	Região da Geração 5 de Pokémon
6	Kalos	Região da Geração 6 de Pokémon
7	Alola	Região da Geração 7 de Pokémon
8	Galar	Região da Geração 8 de Pokémon
9	Hisui	Região da Geração 9 de Pokémon
\.


--
-- TOC entry 6017 (class 0 OID 31027)
-- Dependencies: 258
-- Data for Name: time; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final."time" (time_id) FROM stdin;
1
2
3
4
5
6
7
8
9
10
11
12
\.


--
-- TOC entry 6033 (class 0 OID 31086)
-- Dependencies: 274
-- Data for Name: tipo_pokemon; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.tipo_pokemon (tipo_pokemon_id, descricao, nome_tipo) FROM stdin;
1	Fraco para Lutador. Imune a Fantasma	Normal
2	Fraco para Voador, Psíquico e Fada. Resistente Pedra, Inseto e Sombroso	Lutador
3	Fraco para Pedra, Elétrico e Gelo. Resistente a Lutador, Inseto e Grama. Imune a Terrestra.	Voador
4	Fraco para Terrestre e Psíquico. Resistente a Lutador, Veneno, Inseto, Grama e Veneno	Venenoso
5	Fraco para Água, Grama e Gelo. Resistente a Venenoso e Pedra. Imune a Elétrico	Terrestre
6	Fraco para Lutador, Terrestre, Aço, Água e Grama. Resistente a Normal, Voador, Venenoso e Fogo	Pedra
7	Fraco para Voador, Pedra e Fogo. Resistente a Lutador, Terrestre e Grama.	Inseto
8	Fraco para Fantasman e Sombroso. Resistente a Venenoso. Imune a Lutador e Normal.	Fantasma
9	Fraco para Lutador, Terrestre e Fogo. Resistente a Normal, Voador, Pedra, Inseto, Aço, Grama, Psíquico, Gelo, Dragão e Fada.	Aço
10	Fraco para Terrestre, Pedra e Água. Resistente a Inseto, Aço, Fogo, Grama, Gelo e Fada.	Fogo
11	Fraco para Grama e Elétrico. Resistente a Aço, Fogo, Água e Gelo.	Água
12	Fraco para Fogo, Voador, Venenoso e Gelo. Resistente a Grama, Água, Terrestre e Elétrico.	Grama
13	Fraco para Terrestre. Resistente a Elétrico, Aço e Voador.	Elétrico
14	Fraco para Inseto, Fantasma e Sombroso. Resistente a Psíquico e Lutador.	Psíquico
15	Fraco para Lutador, Fogo, Pedra e Aço. Resistente a Gelo.	Gelo
16	Fraco para Gelo, Dragão e Fada. Resistente a Fogo, Água, Grama e Elétrico.	Dragão
17	Fraco para Lutador, Inseto e Fada. Resistente a Fantasma e Sombio. Imune a Psíquico.	Sombroso
18	Fraco para Aço e Venenoso. Resistente para Lutador e Sombroso. Imune a Dragão.	Fada
\.


--
-- TOC entry 6026 (class 0 OID 31060)
-- Dependencies: 267
-- Data for Name: treinador; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.treinador (treinador_id, regiao_id, nome, sexo, idade) FROM stdin;
1	8	Ana	F	17
2	1	Bruno	M	18
3	1	Carlos	M	22
4	6	Daniela	F	10
5	7	Eduardo	M	17
6	1	Fernanda	F	21
8	1	Helena	F	11
9	8	Igor	M	14
10	5	Juliana	F	18
11	4	Kleber	M	10
12	7	Leticia	F	13
13	5	\N	M	23
14	8	\N	F	14
15	3	\N	F	11
16	4	\N	M	20
17	6	\N	F	21
18	6	Leandro	\N	22
19	7	Edinaldo	\N	17
20	9	Lucas	\N	16
21	2	Pedro	\N	25
22	7	Cadu	\N	20
23	1	\N	\N	26
24	4	\N	\N	14
25	7	\N	\N	16
26	8	\N	\N	30
27	8	\N	\N	25
7	4	Guilherme	M	10
\.


--
-- TOC entry 6042 (class 0 OID 31123)
-- Dependencies: 283
-- Data for Name: treinador_batalha; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.treinador_batalha (batalha_id, treinador_id) FROM stdin;
1	1
1	5
2	5
2	7
3	7
3	2
4	2
4	9
5	9
5	3
6	3
6	4
7	11
7	10
8	10
8	6
9	4
9	8
10	5
10	1
11	12
11	3
12	7
12	2
13	4
13	1
14	3
14	12
15	5
15	9
16	9
16	5
\.


--
-- TOC entry 6031 (class 0 OID 31080)
-- Dependencies: 272
-- Data for Name: treinador_bolsa; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.treinador_bolsa (treinador_id, bolsa_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	11
12	12
\.


--
-- TOC entry 6022 (class 0 OID 31047)
-- Dependencies: 263
-- Data for Name: treinador_time; Type: TABLE DATA; Schema: projeto_final; Owner: jhonatanuff
--

COPY projeto_final.treinador_time (treinador_id, time_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	11
12	12
\.


--
-- TOC entry 6059 (class 0 OID 0)
-- Dependencies: 281
-- Name: batalha_batalha_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.batalha_batalha_id_seq', 21, true);


--
-- TOC entry 6060 (class 0 OID 0)
-- Dependencies: 268
-- Name: bolsa_bolsa_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.bolsa_bolsa_id_seq', 12, true);


--
-- TOC entry 6061 (class 0 OID 0)
-- Dependencies: 279
-- Name: ginasio_ginasio_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.ginasio_ginasio_id_seq', 12, true);


--
-- TOC entry 6062 (class 0 OID 0)
-- Dependencies: 270
-- Name: item_item_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.item_item_id_seq', 50, true);


--
-- TOC entry 6063 (class 0 OID 0)
-- Dependencies: 276
-- Name: move_move_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.move_move_id_seq', 1, false);


--
-- TOC entry 6064 (class 0 OID 0)
-- Dependencies: 259
-- Name: pokedex_pokedex_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.pokedex_pokedex_id_seq', 151, true);


--
-- TOC entry 6065 (class 0 OID 0)
-- Dependencies: 261
-- Name: pokemon_pokemon_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.pokemon_pokemon_id_seq', 72, true);


--
-- TOC entry 6066 (class 0 OID 0)
-- Dependencies: 264
-- Name: regiao_regiao_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.regiao_regiao_id_seq', 9, true);


--
-- TOC entry 6067 (class 0 OID 0)
-- Dependencies: 257
-- Name: time_time_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.time_time_id_seq', 1, false);


--
-- TOC entry 6068 (class 0 OID 0)
-- Dependencies: 273
-- Name: tipo_pokemon_tipo_pokemon_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.tipo_pokemon_tipo_pokemon_id_seq', 18, true);


--
-- TOC entry 6069 (class 0 OID 0)
-- Dependencies: 266
-- Name: treinador_treinador_id_seq; Type: SEQUENCE SET; Schema: projeto_final; Owner: jhonatanuff
--

SELECT pg_catalog.setval('projeto_final.treinador_treinador_id_seq', 27, true);


--
-- TOC entry 5836 (class 2606 OID 31122)
-- Name: batalha batalha_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.batalha
    ADD CONSTRAINT batalha_pkey PRIMARY KEY (batalha_id);


--
-- TOC entry 5812 (class 2606 OID 31072)
-- Name: bolsa bolsa_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.bolsa
    ADD CONSTRAINT bolsa_pkey PRIMARY KEY (bolsa_id);


--
-- TOC entry 5832 (class 2606 OID 31115)
-- Name: ginasio ginasio_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.ginasio
    ADD CONSTRAINT ginasio_pkey PRIMARY KEY (ginasio_id);


--
-- TOC entry 5816 (class 2606 OID 31079)
-- Name: item item_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (item_id);


--
-- TOC entry 5827 (class 2606 OID 31103)
-- Name: move move_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.move
    ADD CONSTRAINT move_pkey PRIMARY KEY (move_id);


--
-- TOC entry 5793 (class 2606 OID 31039)
-- Name: pokedex pokedex_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokedex
    ADD CONSTRAINT pokedex_pkey PRIMARY KEY (pokedex_id);


--
-- TOC entry 5829 (class 2606 OID 31108)
-- Name: pokemon_move pokemon_move_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon_move
    ADD CONSTRAINT pokemon_move_pkey PRIMARY KEY (pokemon_id, move_id);


--
-- TOC entry 5798 (class 2606 OID 31046)
-- Name: pokemon pokemon_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon
    ADD CONSTRAINT pokemon_pkey PRIMARY KEY (pokemon_id);


--
-- TOC entry 5788 (class 2606 OID 31025)
-- Name: pokemon_time pokemon_time_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon_time
    ADD CONSTRAINT pokemon_time_pkey PRIMARY KEY (pokemon_id);


--
-- TOC entry 5824 (class 2606 OID 31096)
-- Name: pokemon_tipo_pokemon pokemon_tipo_pokemon_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon_tipo_pokemon
    ADD CONSTRAINT pokemon_tipo_pokemon_pkey PRIMARY KEY (pokemon_id, tipo_pokemon_id);


--
-- TOC entry 5804 (class 2606 OID 31058)
-- Name: regiao regiao_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.regiao
    ADD CONSTRAINT regiao_pkey PRIMARY KEY (regiao_id);


--
-- TOC entry 5791 (class 2606 OID 31032)
-- Name: time time_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final."time"
    ADD CONSTRAINT time_pkey PRIMARY KEY (time_id);


--
-- TOC entry 5822 (class 2606 OID 31091)
-- Name: tipo_pokemon tipo_pokemon_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.tipo_pokemon
    ADD CONSTRAINT tipo_pokemon_pkey PRIMARY KEY (tipo_pokemon_id);


--
-- TOC entry 5838 (class 2606 OID 31127)
-- Name: treinador_batalha treinador_batalha_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador_batalha
    ADD CONSTRAINT treinador_batalha_pkey PRIMARY KEY (batalha_id, treinador_id);


--
-- TOC entry 5820 (class 2606 OID 31084)
-- Name: treinador_bolsa treinador_bolsa_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador_bolsa
    ADD CONSTRAINT treinador_bolsa_pkey PRIMARY KEY (treinador_id);


--
-- TOC entry 5808 (class 2606 OID 31065)
-- Name: treinador treinador_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador
    ADD CONSTRAINT treinador_pkey PRIMARY KEY (treinador_id);


--
-- TOC entry 5800 (class 2606 OID 31051)
-- Name: treinador_time treinador_time_pkey; Type: CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador_time
    ADD CONSTRAINT treinador_time_pkey PRIMARY KEY (treinador_id);


--
-- TOC entry 5833 (class 1259 OID 31257)
-- Name: batalha_data; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX batalha_data ON projeto_final.batalha USING btree (data);


--
-- TOC entry 5834 (class 1259 OID 31265)
-- Name: batalha_ginasio_id; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX batalha_ginasio_id ON projeto_final.batalha USING hash (ginasio_id);


--
-- TOC entry 5810 (class 1259 OID 31261)
-- Name: bolsa_cor; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX bolsa_cor ON projeto_final.bolsa USING hash (cor);


--
-- TOC entry 5830 (class 1259 OID 31256)
-- Name: ginasio_nome; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX ginasio_nome ON projeto_final.ginasio USING hash (nome);


--
-- TOC entry 5813 (class 1259 OID 31259)
-- Name: item_bolsa_id; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX item_bolsa_id ON projeto_final.item USING hash (bolsa_id);


--
-- TOC entry 5814 (class 1259 OID 31255)
-- Name: item_nome; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX item_nome ON projeto_final.item USING hash (nome);


--
-- TOC entry 5817 (class 1259 OID 31253)
-- Name: item_tipo_item; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX item_tipo_item ON projeto_final.item USING hash (tipo_item);


--
-- TOC entry 5825 (class 1259 OID 31266)
-- Name: move_nome; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX move_nome ON projeto_final.move USING hash (nome);


--
-- TOC entry 5794 (class 1259 OID 31258)
-- Name: pokemon_atk; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX pokemon_atk ON projeto_final.pokemon USING hash (atk);


--
-- TOC entry 5795 (class 1259 OID 31254)
-- Name: pokemon_lvl; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX pokemon_lvl ON projeto_final.pokemon USING btree (lvl);


--
-- TOC entry 5796 (class 1259 OID 31267)
-- Name: pokemon_nome; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX pokemon_nome ON projeto_final.pokemon USING hash (nome);


--
-- TOC entry 5789 (class 1259 OID 31270)
-- Name: pokemon_time_time_id; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX pokemon_time_time_id ON projeto_final.pokemon_time USING hash (time_id);


--
-- TOC entry 5802 (class 1259 OID 31263)
-- Name: regiao_nome; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX regiao_nome ON projeto_final.regiao USING hash (nome);


--
-- TOC entry 5818 (class 1259 OID 31262)
-- Name: treinador_bolsa_bolsa_id; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX treinador_bolsa_bolsa_id ON projeto_final.treinador_bolsa USING hash (bolsa_id);


--
-- TOC entry 5805 (class 1259 OID 31260)
-- Name: treinador_idade; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX treinador_idade ON projeto_final.treinador USING btree (idade);


--
-- TOC entry 5806 (class 1259 OID 31268)
-- Name: treinador_nome; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX treinador_nome ON projeto_final.treinador USING hash (nome);


--
-- TOC entry 5809 (class 1259 OID 31264)
-- Name: treinador_regiao_id; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX treinador_regiao_id ON projeto_final.treinador USING hash (regiao_id);


--
-- TOC entry 5801 (class 1259 OID 31269)
-- Name: treinador_time_time_id; Type: INDEX; Schema: projeto_final; Owner: jhonatanuff
--

CREATE INDEX treinador_time_time_id ON projeto_final.treinador_time USING hash (time_id);


--
-- TOC entry 5860 (class 2620 OID 31224)
-- Name: treinador_time before_insert_update_treinador_time; Type: TRIGGER; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TRIGGER before_insert_update_treinador_time BEFORE INSERT OR UPDATE ON projeto_final.treinador_time FOR EACH ROW EXECUTE FUNCTION public.verificar_time_duplicado();


--
-- TOC entry 5857 (class 2620 OID 31222)
-- Name: pokemon_time limitar_quantidade_pokemon; Type: TRIGGER; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TRIGGER limitar_quantidade_pokemon BEFORE INSERT ON projeto_final.pokemon_time FOR EACH ROW EXECUTE FUNCTION public.limitar_quantidade_pokemon_no_time();


--
-- TOC entry 5861 (class 2620 OID 31218)
-- Name: move move_before_insert_update; Type: TRIGGER; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TRIGGER move_before_insert_update BEFORE INSERT OR UPDATE ON projeto_final.move FOR EACH ROW EXECUTE FUNCTION public.limitar_precisao_move();


--
-- TOC entry 5859 (class 2620 OID 31219)
-- Name: pokemon pokemon_before_insert_update; Type: TRIGGER; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TRIGGER pokemon_before_insert_update BEFORE INSERT OR UPDATE ON projeto_final.pokemon FOR EACH ROW EXECUTE FUNCTION public.limitar_lvl_pokemon();


--
-- TOC entry 5858 (class 2620 OID 31223)
-- Name: pokemon_time trigger_proibir_associacao_pokemon_time; Type: TRIGGER; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TRIGGER trigger_proibir_associacao_pokemon_time BEFORE INSERT OR UPDATE ON projeto_final.pokemon_time FOR EACH ROW EXECUTE FUNCTION public.proibir_associacao_pokemon_time();


--
-- TOC entry 5863 (class 2620 OID 31220)
-- Name: treinador_batalha trigger_verificar_limite_treinadores; Type: TRIGGER; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TRIGGER trigger_verificar_limite_treinadores BEFORE INSERT ON projeto_final.treinador_batalha FOR EACH ROW EXECUTE FUNCTION public.verificar_limite_treinadores();


--
-- TOC entry 5862 (class 2620 OID 31221)
-- Name: batalha verificar_vencedor_batalha_trigger; Type: TRIGGER; Schema: projeto_final; Owner: jhonatanuff
--

CREATE TRIGGER verificar_vencedor_batalha_trigger BEFORE UPDATE ON projeto_final.batalha FOR EACH ROW EXECUTE FUNCTION public.verificar_vencedor_batalha();


--
-- TOC entry 5852 (class 2606 OID 31193)
-- Name: batalha fk_batalha_ginasio; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.batalha
    ADD CONSTRAINT fk_batalha_ginasio FOREIGN KEY (ginasio_id) REFERENCES projeto_final.ginasio(ginasio_id);


--
-- TOC entry 5853 (class 2606 OID 31203)
-- Name: batalha fk_batalha_ginasio_id; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.batalha
    ADD CONSTRAINT fk_batalha_ginasio_id FOREIGN KEY (ginasio_id) REFERENCES projeto_final.ginasio(ginasio_id);


--
-- TOC entry 5854 (class 2606 OID 31198)
-- Name: batalha fk_batalha_treinador; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.batalha
    ADD CONSTRAINT fk_batalha_treinador FOREIGN KEY (vencedor_id) REFERENCES projeto_final.treinador(treinador_id);


--
-- TOC entry 5845 (class 2606 OID 31168)
-- Name: item fk_item_bolsa; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.item
    ADD CONSTRAINT fk_item_bolsa FOREIGN KEY (bolsa_id) REFERENCES projeto_final.bolsa(bolsa_id);


--
-- TOC entry 5850 (class 2606 OID 31183)
-- Name: pokemon_move fk_pokemon_move_move; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon_move
    ADD CONSTRAINT fk_pokemon_move_move FOREIGN KEY (move_id) REFERENCES projeto_final.move(move_id);


--
-- TOC entry 5851 (class 2606 OID 31188)
-- Name: pokemon_move fk_pokemon_move_pokemon; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon_move
    ADD CONSTRAINT fk_pokemon_move_pokemon FOREIGN KEY (pokemon_id) REFERENCES projeto_final.pokemon(pokemon_id);


--
-- TOC entry 5841 (class 2606 OID 31138)
-- Name: pokemon fk_pokemon_pokedex; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon
    ADD CONSTRAINT fk_pokemon_pokedex FOREIGN KEY (pokedex_id) REFERENCES projeto_final.pokedex(pokedex_id);


--
-- TOC entry 5839 (class 2606 OID 31133)
-- Name: pokemon_time fk_pokemon_pokemon_id; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon_time
    ADD CONSTRAINT fk_pokemon_pokemon_id FOREIGN KEY (pokemon_id) REFERENCES projeto_final.pokemon(pokemon_id);


--
-- TOC entry 5840 (class 2606 OID 31128)
-- Name: pokemon_time fk_pokemon_time_time; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon_time
    ADD CONSTRAINT fk_pokemon_time_time FOREIGN KEY (time_id) REFERENCES projeto_final."time"(time_id);


--
-- TOC entry 5848 (class 2606 OID 31178)
-- Name: pokemon_tipo_pokemon fk_pokemon_tipo_pokemon_pokemon; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon_tipo_pokemon
    ADD CONSTRAINT fk_pokemon_tipo_pokemon_pokemon FOREIGN KEY (pokemon_id) REFERENCES projeto_final.pokemon(pokemon_id);


--
-- TOC entry 5849 (class 2606 OID 31173)
-- Name: pokemon_tipo_pokemon fk_pokemon_tipo_pokemon_tipo_pokemon; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.pokemon_tipo_pokemon
    ADD CONSTRAINT fk_pokemon_tipo_pokemon_tipo_pokemon FOREIGN KEY (tipo_pokemon_id) REFERENCES projeto_final.tipo_pokemon(tipo_pokemon_id);


--
-- TOC entry 5855 (class 2606 OID 31208)
-- Name: treinador_batalha fk_treinador_batalha_batalha; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador_batalha
    ADD CONSTRAINT fk_treinador_batalha_batalha FOREIGN KEY (batalha_id) REFERENCES projeto_final.batalha(batalha_id);


--
-- TOC entry 5856 (class 2606 OID 31213)
-- Name: treinador_batalha fk_treinador_batalha_treinador; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador_batalha
    ADD CONSTRAINT fk_treinador_batalha_treinador FOREIGN KEY (treinador_id) REFERENCES projeto_final.treinador(treinador_id);


--
-- TOC entry 5846 (class 2606 OID 31158)
-- Name: treinador_bolsa fk_treinador_bolsa_bolsa; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador_bolsa
    ADD CONSTRAINT fk_treinador_bolsa_bolsa FOREIGN KEY (bolsa_id) REFERENCES projeto_final.bolsa(bolsa_id);


--
-- TOC entry 5847 (class 2606 OID 31163)
-- Name: treinador_bolsa fk_treinador_bolsa_treinador_id; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador_bolsa
    ADD CONSTRAINT fk_treinador_bolsa_treinador_id FOREIGN KEY (treinador_id) REFERENCES projeto_final.treinador(treinador_id);


--
-- TOC entry 5844 (class 2606 OID 31153)
-- Name: treinador fk_treinador_regiao; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador
    ADD CONSTRAINT fk_treinador_regiao FOREIGN KEY (regiao_id) REFERENCES projeto_final.regiao(regiao_id);


--
-- TOC entry 5842 (class 2606 OID 31143)
-- Name: treinador_time fk_treinador_time_time; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador_time
    ADD CONSTRAINT fk_treinador_time_time FOREIGN KEY (time_id) REFERENCES projeto_final."time"(time_id);


--
-- TOC entry 5843 (class 2606 OID 31148)
-- Name: treinador_time fk_treinador_time_treinador_id; Type: FK CONSTRAINT; Schema: projeto_final; Owner: jhonatanuff
--

ALTER TABLE ONLY projeto_final.treinador_time
    ADD CONSTRAINT fk_treinador_time_treinador_id FOREIGN KEY (treinador_id) REFERENCES projeto_final.treinador(treinador_id);


-- Completed on 2023-12-14 22:01:37

--
-- PostgreSQL database dump complete
--

