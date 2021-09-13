--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.3

-- Started on 2021-09-12 20:18:02 CEST

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 17386)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(150) NOT NULL,
    telephone character varying(30) NOT NULL,
    poste character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    mot_de_passe character varying(20) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17384)
-- Name: admin_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_admin_id_seq OWNER TO postgres;

--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 200
-- Name: admin_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_admin_id_seq OWNED BY public.admin.admin_id;


--
-- TOC entry 202 (class 1259 OID 17395)
-- Name: authentification_admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentification_admin (
    admin_id integer NOT NULL,
    email character varying(100) NOT NULL,
    mdp character varying(20) NOT NULL
);


ALTER TABLE public.authentification_admin OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17431)
-- Name: authentification_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentification_client (
    client_id integer NOT NULL,
    email character varying(100) NOT NULL,
    mdp character varying(20) NOT NULL
);


ALTER TABLE public.authentification_client OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17447)
-- Name: boissons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boissons (
    boisson_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prix_unitaire double precision NOT NULL,
    quantite_1 integer,
    quantite_min integer,
    quantite_max integer,
    fournisseur_id integer NOT NULL
);


ALTER TABLE public.boissons OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17445)
-- Name: boissons_boisson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boissons_boisson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boissons_boisson_id_seq OWNER TO postgres;

--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 212
-- Name: boissons_boisson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boissons_boisson_id_seq OWNED BY public.boissons.boisson_id;


--
-- TOC entry 208 (class 1259 OID 17420)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    client_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    adresse character varying(150) NOT NULL,
    code_postal character varying(5) NOT NULL,
    ville character varying(100) NOT NULL,
    telephone character varying(30) NOT NULL,
    email character varying(150) NOT NULL,
    mot_de_passe character varying(20) NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17418)
-- Name: clients_client_id_seq_1_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_client_id_seq_1_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_client_id_seq_1_1 OWNER TO postgres;

--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 207
-- Name: clients_client_id_seq_1_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_client_id_seq_1_1 OWNED BY public.clients.client_id;


--
-- TOC entry 223 (class 1259 OID 17499)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    id_commande integer NOT NULL,
    date date NOT NULL,
    montant_ht double precision NOT NULL,
    promo double precision,
    montant_ttc double precision NOT NULL,
    taxe double precision NOT NULL,
    livraison boolean NOT NULL,
    payer boolean NOT NULL,
    client_id integer NOT NULL,
    a_emporter boolean NOT NULL,
    pizzeria_id integer NOT NULL,
    admin_id integer NOT NULL
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17497)
-- Name: commande_id_commande_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commande_id_commande_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commande_id_commande_seq OWNER TO postgres;

--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 222
-- Name: commande_id_commande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commande_id_commande_seq OWNED BY public.commande.id_commande;


--
-- TOC entry 221 (class 1259 OID 17490)
-- Name: commandes_fournisseurs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commandes_fournisseurs (
    commande_id integer NOT NULL,
    date_commande date NOT NULL,
    montant_ht double precision NOT NULL,
    taxe double precision NOT NULL,
    montant_ttc double precision NOT NULL,
    date_paiement date NOT NULL,
    pizzeria_id integer NOT NULL
);


ALTER TABLE public.commandes_fournisseurs OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17488)
-- Name: commandes_fournisseurs_commande_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commandes_fournisseurs_commande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commandes_fournisseurs_commande_id_seq OWNER TO postgres;

--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 220
-- Name: commandes_fournisseurs_commande_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commandes_fournisseurs_commande_id_seq OWNED BY public.commandes_fournisseurs.commande_id;


--
-- TOC entry 211 (class 1259 OID 17438)
-- Name: desserts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.desserts (
    dessert_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prix_unitaire double precision NOT NULL,
    quantite integer,
    quantite_min integer,
    quantite_max integer,
    fournisseur_id integer NOT NULL
);


ALTER TABLE public.desserts OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17436)
-- Name: desserts_dessert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.desserts_dessert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.desserts_dessert_id_seq OWNER TO postgres;

--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 210
-- Name: desserts_dessert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.desserts_dessert_id_seq OWNED BY public.desserts.dessert_id;


--
-- TOC entry 216 (class 1259 OID 17464)
-- Name: fiche; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiche (
    recette_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    format character varying(150) NOT NULL,
    recette character varying(2000) NOT NULL,
    "time" time without time zone,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.fiche OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17402)
-- Name: fournisseur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fournisseur (
    fournisseur_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    adresse character varying(150) NOT NULL,
    ville character varying(100) NOT NULL,
    codepostal character varying(30) NOT NULL
);


ALTER TABLE public.fournisseur OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17400)
-- Name: fournisseur_fournisseur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fournisseur_fournisseur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fournisseur_fournisseur_id_seq OWNER TO postgres;

--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 203
-- Name: fournisseur_fournisseur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fournisseur_fournisseur_id_seq OWNED BY public.fournisseur.fournisseur_id;


--
-- TOC entry 219 (class 1259 OID 17482)
-- Name: gerance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gerance (
    pizzeria_id integer NOT NULL,
    responsable_id integer NOT NULL
);


ALTER TABLE public.gerance OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17411)
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredients (
    ingredient_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prix_unitaire double precision NOT NULL,
    quantite integer NOT NULL,
    qte_min integer NOT NULL,
    qte_max integer NOT NULL,
    fournisseur_id integer NOT NULL
);


ALTER TABLE public.ingredients OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17409)
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredients_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 205
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredients_ingredient_id_seq OWNED BY public.ingredients.ingredient_id;


--
-- TOC entry 225 (class 1259 OID 17508)
-- Name: livraison; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livraison (
    livraison_id integer NOT NULL,
    date_livraison date NOT NULL,
    heure_livraison time without time zone NOT NULL,
    id_commande integer NOT NULL,
    pizzeria_depart_id integer NOT NULL,
    client_id integer NOT NULL,
    livreur_id integer NOT NULL
);


ALTER TABLE public.livraison OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17506)
-- Name: livraison_livraison_id_seq_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.livraison_livraison_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.livraison_livraison_id_seq_1 OWNER TO postgres;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 224
-- Name: livraison_livraison_id_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.livraison_livraison_id_seq_1 OWNED BY public.livraison.livraison_id;


--
-- TOC entry 215 (class 1259 OID 17456)
-- Name: pizza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza (
    pizza_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    format character varying(20) NOT NULL,
    prix_ht double precision NOT NULL
);


ALTER TABLE public.pizza OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17454)
-- Name: pizza_pizza_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizza_pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizza_pizza_id_seq OWNER TO postgres;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 214
-- Name: pizza_pizza_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizza_pizza_id_seq OWNED BY public.pizza.pizza_id;


--
-- TOC entry 218 (class 1259 OID 17475)
-- Name: pizzeria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizzeria (
    pizzeria_id integer NOT NULL,
    nom character varying(100) NOT NULL,
    adresse character varying(150) NOT NULL,
    code_postal character varying(5) NOT NULL,
    ville character varying(150) NOT NULL,
    nbre_salaries integer NOT NULL
);


ALTER TABLE public.pizzeria OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17473)
-- Name: pizzeria_pizzeria_id_seq_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizzeria_pizzeria_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizzeria_pizzeria_id_seq_1 OWNER TO postgres;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 217
-- Name: pizzeria_pizzeria_id_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizzeria_pizzeria_id_seq_1 OWNED BY public.pizzeria.pizzeria_id;


--
-- TOC entry 3196 (class 2604 OID 17389)
-- Name: admin admin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_admin_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 17450)
-- Name: boissons boisson_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boissons ALTER COLUMN boisson_id SET DEFAULT nextval('public.boissons_boisson_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 17423)
-- Name: clients client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN client_id SET DEFAULT nextval('public.clients_client_id_seq_1_1'::regclass);


--
-- TOC entry 3205 (class 2604 OID 17502)
-- Name: commande id_commande; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande ALTER COLUMN id_commande SET DEFAULT nextval('public.commande_id_commande_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 17493)
-- Name: commandes_fournisseurs commande_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes_fournisseurs ALTER COLUMN commande_id SET DEFAULT nextval('public.commandes_fournisseurs_commande_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 17441)
-- Name: desserts dessert_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desserts ALTER COLUMN dessert_id SET DEFAULT nextval('public.desserts_dessert_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 17405)
-- Name: fournisseur fournisseur_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fournisseur ALTER COLUMN fournisseur_id SET DEFAULT nextval('public.fournisseur_fournisseur_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 17414)
-- Name: ingredients ingredient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN ingredient_id SET DEFAULT nextval('public.ingredients_ingredient_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 17511)
-- Name: livraison livraison_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison ALTER COLUMN livraison_id SET DEFAULT nextval('public.livraison_livraison_id_seq_1'::regclass);


--
-- TOC entry 3202 (class 2604 OID 17459)
-- Name: pizza pizza_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza ALTER COLUMN pizza_id SET DEFAULT nextval('public.pizza_pizza_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 17478)
-- Name: pizzeria pizzeria_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzeria ALTER COLUMN pizzeria_id SET DEFAULT nextval('public.pizzeria_pizzeria_id_seq_1'::regclass);


--
-- TOC entry 3398 (class 0 OID 17386)
-- Dependencies: 201
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (admin_id, nom, prenom, telephone, poste, email, mot_de_passe) FROM stdin;
1	ROUACHE	Laurent	000000001	pizzaiolo	laurent.r@gmail.com	568713Laurent
2	LOUFI	Bouchra	000015775	responsable	bouchra.loufi@hotmail.fr	879644Bouchra
3	JUNO	Kevin	574965633	livreur	juno.kevin@yahou.fr	789423Kevin
\.


--
-- TOC entry 3399 (class 0 OID 17395)
-- Dependencies: 202
-- Data for Name: authentification_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentification_admin (admin_id, email, mdp) FROM stdin;
1	laurent.r@gmail.com	568713Laurent
2	bouchra.loufi@hotmail.fr	879644Bouchra
3	juno.kevin@yahou.fr	789423Kevin
\.


--
-- TOC entry 3406 (class 0 OID 17431)
-- Dependencies: 209
-- Data for Name: authentification_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentification_client (client_id, email, mdp) FROM stdin;
1	mobango.antoine@gmail.com	78MOB69--@
2	erika.ninos@hotmail.fr	Ninos87Pikino@++
3	samira.taieb@gmail.com	SamiraAF1@+++
\.


--
-- TOC entry 3410 (class 0 OID 17447)
-- Dependencies: 213
-- Data for Name: boissons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boissons (boisson_id, nom, prix_unitaire, quantite_1, quantite_min, quantite_max, fournisseur_id) FROM stdin;
1	COCA COLA ZERO Cannette 	1.5	112	100	700	1
2	COCA ZERO 1,5l 	4	100	80	200	1
\.


--
-- TOC entry 3405 (class 0 OID 17420)
-- Dependencies: 208
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (client_id, nom, prenom, adresse, code_postal, ville, telephone, email, mot_de_passe) FROM stdin;
1	MOBANGO	Antoine	25 rue des galères 	75017	PARIS	4598700457	mobango.antoine@gmail.com	78MOB69--@
2	NINOS DA SILVA	Erika 	78 rue des reflets 	92400	COURBEVOIE	0015789465	erika.ninos@hotmail.fr	Ninos87Pikino@++
3	TAIEB	Samira	85 rue des saules 	93100	MONTREUIL	0759877962	samira.taieb@gmail.com	SamiraAF1@+++
\.


--
-- TOC entry 3420 (class 0 OID 17499)
-- Dependencies: 223
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande (id_commande, date, montant_ht, promo, montant_ttc, taxe, livraison, payer, client_id, a_emporter, pizzeria_id, admin_id) FROM stdin;
1	2021-05-09	24.9	0	26.49	10	t	t	2	f	1	1
2	2021-05-09	45.9	10	39.49	10	f	f	1	t	2	2
\.


--
-- TOC entry 3418 (class 0 OID 17490)
-- Dependencies: 221
-- Data for Name: commandes_fournisseurs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commandes_fournisseurs (commande_id, date_commande, montant_ht, taxe, montant_ttc, date_paiement, pizzeria_id) FROM stdin;
1	2021-06-09	125.9	5	131.25	2021-06-10	1
2	2021-06-09	256	5	268.8	2021-06-10	2
\.


--
-- TOC entry 3408 (class 0 OID 17438)
-- Dependencies: 211
-- Data for Name: desserts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desserts (dessert_id, nom, prix_unitaire, quantite, quantite_min, quantite_max, fournisseur_id) FROM stdin;
1	TIRAMISU SPECULO	2	100	50	300	1
2	TARTE DAIM	2.5	100	50	300	1
\.


--
-- TOC entry 3413 (class 0 OID 17464)
-- Dependencies: 216
-- Data for Name: fiche; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fiche (recette_id, nom, format, recette, "time", ingredient_id) FROM stdin;
1	CARNIVORE	junior	Mettre la sauce tomage sur la pate en suite ajouter 100g de chorizo et 100g de mozarella 	10:00:00	1
\.


--
-- TOC entry 3401 (class 0 OID 17402)
-- Dependencies: 204
-- Data for Name: fournisseur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fournisseur (fournisseur_id, nom, adresse, ville, codepostal) FROM stdin;
1	METRO	96 rue des mesanges 	MONTREUIL	93100
2	MARAICHER	72 boulevard des apprentis	77700	MAGNY LE HONGRE
\.


--
-- TOC entry 3416 (class 0 OID 17482)
-- Dependencies: 219
-- Data for Name: gerance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gerance (pizzeria_id, responsable_id) FROM stdin;
1	2
2	2
\.


--
-- TOC entry 3403 (class 0 OID 17411)
-- Dependencies: 206
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients (ingredient_id, nom, prix_unitaire, quantite, qte_min, qte_max, fournisseur_id) FROM stdin;
1	Chorizo 100g	1	400	200	600	1
2	Tomates	0.99	400	200	600	2
3	Mozarrella	0.99	350	150	400	1
\.


--
-- TOC entry 3422 (class 0 OID 17508)
-- Dependencies: 225
-- Data for Name: livraison; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.livraison (livraison_id, date_livraison, heure_livraison, id_commande, pizzeria_depart_id, client_id, livreur_id) FROM stdin;
1	2021-05-09	19:05:00	1	1	2	3
\.


--
-- TOC entry 3412 (class 0 OID 17456)
-- Dependencies: 215
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizza (pizza_id, nom, format, prix_ht) FROM stdin;
1	CARNIVORE	junior 	5.5
2	MARGARITA 	junior	5.5
3	REINE	junior 	5.5
\.


--
-- TOC entry 3415 (class 0 OID 17475)
-- Dependencies: 218
-- Data for Name: pizzeria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizzeria (pizzeria_id, nom, adresse, code_postal, ville, nbre_salaries) FROM stdin;
1	OCPIZZA LA DEFENSE	52 rue des reflets 	92400	COURBEVOIE	20
2	OCPIZZA WAGRAM 	48 rue des resistants	75017	PARIS	30
\.


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 200
-- Name: admin_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_admin_id_seq', 1, false);


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 212
-- Name: boissons_boisson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boissons_boisson_id_seq', 1, false);


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 207
-- Name: clients_client_id_seq_1_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_client_id_seq_1_1', 1, false);


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 222
-- Name: commande_id_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commande_id_commande_seq', 1, false);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 220
-- Name: commandes_fournisseurs_commande_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commandes_fournisseurs_commande_id_seq', 1, false);


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 210
-- Name: desserts_dessert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.desserts_dessert_id_seq', 1, false);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 203
-- Name: fournisseur_fournisseur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fournisseur_fournisseur_id_seq', 1, false);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 205
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredients_ingredient_id_seq', 1, false);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 224
-- Name: livraison_livraison_id_seq_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.livraison_livraison_id_seq_1', 1, false);


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 214
-- Name: pizza_pizza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizza_pizza_id_seq', 1, false);


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 217
-- Name: pizzeria_pizzeria_id_seq_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizzeria_pizzeria_id_seq_1', 1, false);


--
-- TOC entry 3208 (class 2606 OID 17394)
-- Name: admin admin_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pk PRIMARY KEY (admin_id);


--
-- TOC entry 3210 (class 2606 OID 17399)
-- Name: authentification_admin authentification_admin_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentification_admin
    ADD CONSTRAINT authentification_admin_pk PRIMARY KEY (admin_id);


--
-- TOC entry 3222 (class 2606 OID 17435)
-- Name: authentification_client authentification_client_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentification_client
    ADD CONSTRAINT authentification_client_pk PRIMARY KEY (client_id);


--
-- TOC entry 3228 (class 2606 OID 17452)
-- Name: boissons boissons_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boissons
    ADD CONSTRAINT boissons_pk PRIMARY KEY (boisson_id);


--
-- TOC entry 3220 (class 2606 OID 17428)
-- Name: clients clients_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pk PRIMARY KEY (client_id);


--
-- TOC entry 3247 (class 2606 OID 17504)
-- Name: commande commande_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (id_commande);


--
-- TOC entry 3244 (class 2606 OID 17495)
-- Name: commandes_fournisseurs commandes_fournisseurs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes_fournisseurs
    ADD CONSTRAINT commandes_fournisseurs_pk PRIMARY KEY (commande_id);


--
-- TOC entry 3225 (class 2606 OID 17443)
-- Name: desserts desserts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desserts
    ADD CONSTRAINT desserts_pk PRIMARY KEY (dessert_id);


--
-- TOC entry 3235 (class 2606 OID 17471)
-- Name: fiche fiche_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiche
    ADD CONSTRAINT fiche_pk PRIMARY KEY (recette_id);


--
-- TOC entry 3213 (class 2606 OID 17407)
-- Name: fournisseur fournisseur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fournisseur
    ADD CONSTRAINT fournisseur_pk PRIMARY KEY (fournisseur_id);


--
-- TOC entry 3241 (class 2606 OID 17486)
-- Name: gerance gerance_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerance
    ADD CONSTRAINT gerance_pk PRIMARY KEY (pizzeria_id, responsable_id);


--
-- TOC entry 3216 (class 2606 OID 17416)
-- Name: ingredients ingredients_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pk PRIMARY KEY (ingredient_id);


--
-- TOC entry 3249 (class 2606 OID 17513)
-- Name: livraison livraison_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_pk PRIMARY KEY (livraison_id);


--
-- TOC entry 3232 (class 2606 OID 17461)
-- Name: pizza pizza_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pk PRIMARY KEY (pizza_id);


--
-- TOC entry 3238 (class 2606 OID 17480)
-- Name: pizzeria pizzeria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT pizzeria_pk PRIMARY KEY (pizzeria_id);


--
-- TOC entry 3226 (class 1259 OID 17453)
-- Name: boissons_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX boissons_idx ON public.boissons USING btree (nom);


--
-- TOC entry 3217 (class 1259 OID 17429)
-- Name: clients_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX clients_idx ON public.clients USING btree (telephone, nom);


--
-- TOC entry 3218 (class 1259 OID 17430)
-- Name: clients_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX clients_idx1 ON public.clients USING btree (telephone);


--
-- TOC entry 3245 (class 1259 OID 17505)
-- Name: commande_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX commande_idx ON public.commande USING btree (id_commande);


--
-- TOC entry 3242 (class 1259 OID 17496)
-- Name: commandes_fournisseurs_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX commandes_fournisseurs_idx ON public.commandes_fournisseurs USING btree (commande_id);


--
-- TOC entry 3223 (class 1259 OID 17444)
-- Name: desserts_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX desserts_idx ON public.desserts USING btree (nom);


--
-- TOC entry 3233 (class 1259 OID 17472)
-- Name: fiche_pizza__idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fiche_pizza__idx ON public.fiche USING btree (nom);


--
-- TOC entry 3211 (class 1259 OID 17408)
-- Name: fournisseur_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX fournisseur_idx ON public.fournisseur USING btree (nom);


--
-- TOC entry 3239 (class 1259 OID 17487)
-- Name: gerance_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gerance_idx ON public.gerance USING btree (pizzeria_id);


--
-- TOC entry 3214 (class 1259 OID 17417)
-- Name: ingredients_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ingredients_idx ON public.ingredients USING btree (nom);


--
-- TOC entry 3229 (class 1259 OID 17462)
-- Name: pizza_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pizza_idx ON public.pizza USING btree (nom);


--
-- TOC entry 3230 (class 1259 OID 17463)
-- Name: pizza_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pizza_idx1 ON public.pizza USING btree (nom);


--
-- TOC entry 3236 (class 1259 OID 17481)
-- Name: pizzeria_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pizzeria_idx ON public.pizzeria USING btree (ville);


--
-- TOC entry 3250 (class 2606 OID 17529)
-- Name: authentification_admin admin_authentification_admin_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentification_admin
    ADD CONSTRAINT admin_authentification_admin_fk FOREIGN KEY (admin_id) REFERENCES public.admin(admin_id);


--
-- TOC entry 3260 (class 2606 OID 17519)
-- Name: commande admin_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT admin_commande_fk FOREIGN KEY (admin_id) REFERENCES public.admin(admin_id);


--
-- TOC entry 3257 (class 2606 OID 17524)
-- Name: gerance admin_gerance_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerance
    ADD CONSTRAINT admin_gerance_fk FOREIGN KEY (responsable_id) REFERENCES public.admin(admin_id);


--
-- TOC entry 3263 (class 2606 OID 17514)
-- Name: livraison admin_livraison_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT admin_livraison_fk FOREIGN KEY (livreur_id) REFERENCES public.admin(admin_id);


--
-- TOC entry 3252 (class 2606 OID 17564)
-- Name: authentification_client clients_authentification_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentification_client
    ADD CONSTRAINT clients_authentification_client_fk FOREIGN KEY (client_id) REFERENCES public.clients(client_id);


--
-- TOC entry 3261 (class 2606 OID 17554)
-- Name: commande clients_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT clients_commande_fk FOREIGN KEY (client_id) REFERENCES public.clients(client_id);


--
-- TOC entry 3264 (class 2606 OID 17559)
-- Name: livraison clients_livraison_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT clients_livraison_fk FOREIGN KEY (client_id) REFERENCES public.clients(client_id);


--
-- TOC entry 3266 (class 2606 OID 17594)
-- Name: livraison commande_livraison_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT commande_livraison_fk FOREIGN KEY (id_commande) REFERENCES public.commande(id_commande);


--
-- TOC entry 3254 (class 2606 OID 17534)
-- Name: boissons fournisseur_boissons_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boissons
    ADD CONSTRAINT fournisseur_boissons_fk FOREIGN KEY (fournisseur_id) REFERENCES public.fournisseur(fournisseur_id);


--
-- TOC entry 3253 (class 2606 OID 17539)
-- Name: desserts fournisseur_desserts_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desserts
    ADD CONSTRAINT fournisseur_desserts_fk FOREIGN KEY (fournisseur_id) REFERENCES public.fournisseur(fournisseur_id);


--
-- TOC entry 3251 (class 2606 OID 17544)
-- Name: ingredients fournisseur_ingredients_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT fournisseur_ingredients_fk FOREIGN KEY (fournisseur_id) REFERENCES public.fournisseur(fournisseur_id);


--
-- TOC entry 3259 (class 2606 OID 17589)
-- Name: commandes_fournisseurs gerance_commandes_fournisseurs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes_fournisseurs
    ADD CONSTRAINT gerance_commandes_fournisseurs_fk FOREIGN KEY (pizzeria_id) REFERENCES public.gerance(pizzeria_id);


--
-- TOC entry 3255 (class 2606 OID 17549)
-- Name: fiche ingredients_fiche_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiche
    ADD CONSTRAINT ingredients_fiche_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(ingredient_id);


--
-- TOC entry 3256 (class 2606 OID 17569)
-- Name: fiche pizza_fiche_pizza__fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiche
    ADD CONSTRAINT pizza_fiche_pizza__fk FOREIGN KEY (recette_id) REFERENCES public.pizza(pizza_id);


--
-- TOC entry 3262 (class 2606 OID 17574)
-- Name: commande pizzeria_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT pizzeria_commande_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- TOC entry 3258 (class 2606 OID 17584)
-- Name: gerance pizzeria_gerance_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerance
    ADD CONSTRAINT pizzeria_gerance_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- TOC entry 3265 (class 2606 OID 17579)
-- Name: livraison pizzeria_livraison_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT pizzeria_livraison_fk FOREIGN KEY (pizzeria_depart_id) REFERENCES public.pizzeria(pizzeria_id);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM keljellyfish;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2021-09-12 20:18:03 CEST

--
-- PostgreSQL database dump complete
--

