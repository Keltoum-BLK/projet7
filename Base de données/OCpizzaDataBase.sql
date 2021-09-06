
CREATE SEQUENCE public.admin_admin_id_seq;

CREATE TABLE public.Admin (
                admin_id INTEGER NOT NULL DEFAULT nextval('public.admin_admin_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(150) NOT NULL,
                telephone VARCHAR(30) NOT NULL,
                poste VARCHAR(100) NOT NULL,
                email VARCHAR(100) NOT NULL,
                mot_de_passe VARCHAR(20) NOT NULL,
                CONSTRAINT admin_pk PRIMARY KEY (admin_id)
);


ALTER SEQUENCE public.admin_admin_id_seq OWNED BY public.Admin.admin_id;

CREATE TABLE public.Authentification_admin (
                admin_id INTEGER NOT NULL,
                email VARCHAR(100) NOT NULL,
                mdp VARCHAR(20) NOT NULL,
                CONSTRAINT authentification_admin_pk PRIMARY KEY (admin_id)
);


CREATE SEQUENCE public.fournisseur_fournisseur_id_seq;

CREATE TABLE public.Fournisseur (
                fournisseur_id INTEGER NOT NULL DEFAULT nextval('public.fournisseur_fournisseur_id_seq'),
                nom VARCHAR(100) NOT NULL,
                adresse VARCHAR(150) NOT NULL,
                ville VARCHAR(100) NOT NULL,
                codepostal VARCHAR(30) NOT NULL,
                CONSTRAINT fournisseur_pk PRIMARY KEY (fournisseur_id)
);


ALTER SEQUENCE public.fournisseur_fournisseur_id_seq OWNED BY public.Fournisseur.fournisseur_id;

CREATE UNIQUE INDEX fournisseur_idx
 ON public.Fournisseur
 ( nom );

CREATE SEQUENCE public.ingredients_ingredient_id_seq;

CREATE TABLE public.Ingredients (
                ingredient_id INTEGER NOT NULL DEFAULT nextval('public.ingredients_ingredient_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prix_unitaire DOUBLE PRECISION NOT NULL,
                quantite INTEGER NOT NULL,
                qte_min INTEGER NOT NULL,
                qte_max INTEGER NOT NULL,
                fournisseur_id INTEGER NOT NULL,
                CONSTRAINT ingredients_pk PRIMARY KEY (ingredient_id)
);


ALTER SEQUENCE public.ingredients_ingredient_id_seq OWNED BY public.Ingredients.ingredient_id;

CREATE UNIQUE INDEX ingredients_idx
 ON public.Ingredients
 ( nom );

CREATE SEQUENCE public.clients_client_id_seq_1_1;

CREATE TABLE public.Clients (
                client_id INTEGER NOT NULL DEFAULT nextval('public.clients_client_id_seq_1_1'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                adresse VARCHAR(150) NOT NULL,
                code_postal VARCHAR(5) NOT NULL,
                ville VARCHAR(100) NOT NULL,
                telephone VARCHAR(30) NOT NULL,
                email VARCHAR(150) NOT NULL,
                mot_de_passe VARCHAR(20) NOT NULL,
                CONSTRAINT clients_pk PRIMARY KEY (client_id)
);


ALTER SEQUENCE public.clients_client_id_seq_1_1 OWNED BY public.Clients.client_id;

CREATE INDEX clients_idx
 ON public.Clients
 ( telephone, nom );

CREATE UNIQUE INDEX clients_idx1
 ON public.Clients
 ( telephone );

CREATE TABLE public.Authentification_client (
                client_id INTEGER NOT NULL,
                email VARCHAR(100) NOT NULL,
                mdp VARCHAR(20) NOT NULL,
                CONSTRAINT authentification_client_pk PRIMARY KEY (client_id)
);


CREATE SEQUENCE public.desserts_dessert_id_seq;

CREATE TABLE public.Desserts (
                dessert_id INTEGER NOT NULL DEFAULT nextval('public.desserts_dessert_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prix_unitaire DOUBLE PRECISION NOT NULL,
                quantite INTEGER,
                quantite_min INTEGER,
                quantite_max INTEGER,
                fournisseur_id INTEGER NOT NULL,
                CONSTRAINT desserts_pk PRIMARY KEY (dessert_id)
);


ALTER SEQUENCE public.desserts_dessert_id_seq OWNED BY public.Desserts.dessert_id;

CREATE UNIQUE INDEX desserts_idx
 ON public.Desserts
 ( nom );

CREATE SEQUENCE public.boissons_boisson_id_seq;

CREATE TABLE public.Boissons (
                boisson_id INTEGER NOT NULL DEFAULT nextval('public.boissons_boisson_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prix_unitaire DOUBLE PRECISION NOT NULL,
                quantite_1 INTEGER,
                quantite_min INTEGER,
                quantite_max INTEGER,
                fournisseur_id INTEGER NOT NULL,
                CONSTRAINT boissons_pk PRIMARY KEY (boisson_id)
);


ALTER SEQUENCE public.boissons_boisson_id_seq OWNED BY public.Boissons.boisson_id;

CREATE UNIQUE INDEX boissons_idx
 ON public.Boissons
 ( nom );

CREATE SEQUENCE public.pizza_pizza_id_seq;

CREATE TABLE public.Pizza (
                pizza_id INTEGER NOT NULL DEFAULT nextval('public.pizza_pizza_id_seq'),
                nom VARCHAR(100) NOT NULL,
                format VARCHAR(20) NOT NULL,
                prix_ht DOUBLE PRECISION NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (pizza_id)
);


ALTER SEQUENCE public.pizza_pizza_id_seq OWNED BY public.Pizza.pizza_id;

CREATE INDEX pizza_idx
 ON public.Pizza
 ( nom );

CREATE UNIQUE INDEX pizza_idx1
 ON public.Pizza
 ( nom );

CREATE TABLE public.Fiche (
                recette_id INTEGER NOT NULL,
                nom VARCHAR(100) NOT NULL,
                format VARCHAR(150) NOT NULL,
                recette VARCHAR(2000) NOT NULL,
                time TIME,
                ingredient_id INTEGER NOT NULL,
                CONSTRAINT fiche_pk PRIMARY KEY (recette_id)
);


CREATE INDEX fiche_pizza__idx
 ON public.Fiche
 ( nom );

CREATE SEQUENCE public.pizzeria_pizzeria_id_seq_1;

CREATE TABLE public.Pizzeria (
                pizzeria_id INTEGER NOT NULL DEFAULT nextval('public.pizzeria_pizzeria_id_seq_1'),
                nom VARCHAR(100) NOT NULL,
                adresse VARCHAR(150) NOT NULL,
                code_postal VARCHAR(5) NOT NULL,
                ville VARCHAR(150) NOT NULL,
                nbre_salaries INTEGER NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (pizzeria_id)
);


ALTER SEQUENCE public.pizzeria_pizzeria_id_seq_1 OWNED BY public.Pizzeria.pizzeria_id;

CREATE UNIQUE INDEX pizzeria_idx
 ON public.Pizzeria
 ( ville );

CREATE TABLE public.Gerance (
                pizzeria_id INTEGER NOT NULL,
                responsable_id INTEGER NOT NULL,
                CONSTRAINT gerance_pk PRIMARY KEY (pizzeria_id, responsable_id)
);


CREATE UNIQUE INDEX gerance_idx
 ON public.Gerance
 ( pizzeria_id );

CREATE SEQUENCE public.commandes_fournisseurs_commande_id_seq;

CREATE TABLE public.Commandes_fournisseurs (
                commande_id INTEGER NOT NULL DEFAULT nextval('public.commandes_fournisseurs_commande_id_seq'),
                date_commande DATE NOT NULL,
                montant_ht DOUBLE PRECISION NOT NULL,
                taxe DOUBLE PRECISION NOT NULL,
                montant_ttc DOUBLE PRECISION NOT NULL,
                date_paiement DATE NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                CONSTRAINT commandes_fournisseurs_pk PRIMARY KEY (commande_id)
);


ALTER SEQUENCE public.commandes_fournisseurs_commande_id_seq OWNED BY public.Commandes_fournisseurs.commande_id;

CREATE INDEX commandes_fournisseurs_idx
 ON public.Commandes_fournisseurs
 ( commande_id );

CREATE SEQUENCE public.commande_id_commande_seq;

CREATE TABLE public.Commande (
                id_commande INTEGER NOT NULL DEFAULT nextval('public.commande_id_commande_seq'),
                date DATE NOT NULL,
                montant_ht DOUBLE PRECISION NOT NULL,
                promo DOUBLE PRECISION,
                montant_ttc DOUBLE PRECISION NOT NULL,
                taxe DOUBLE PRECISION NOT NULL,
                livraison BOOLEAN NOT NULL,
                payer BOOLEAN NOT NULL,
                client_id INTEGER NOT NULL,
                a_emporter BOOLEAN NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                admin_id INTEGER NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (id_commande)
);


ALTER SEQUENCE public.commande_id_commande_seq OWNED BY public.Commande.id_commande;

CREATE INDEX commande_idx
 ON public.Commande
 ( id_commande );

CREATE SEQUENCE public.livraison_livraison_id_seq_1;

CREATE TABLE public.Livraison (
                livraison_id INTEGER NOT NULL DEFAULT nextval('public.livraison_livraison_id_seq_1'),
                date_livraison DATE NOT NULL,
                heure_livraison TIME NOT NULL,
                id_commande INTEGER NOT NULL,
                pizzeria_depart_id INTEGER NOT NULL,
                client_id INTEGER NOT NULL,
                livreur_id INTEGER NOT NULL,
                CONSTRAINT livraison_pk PRIMARY KEY (livraison_id)
);


ALTER SEQUENCE public.livraison_livraison_id_seq_1 OWNED BY public.Livraison.livraison_id;

ALTER TABLE public.Livraison ADD CONSTRAINT admin_livraison_fk
FOREIGN KEY (livreur_id)
REFERENCES public.Admin (admin_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande ADD CONSTRAINT admin_commande_fk
FOREIGN KEY (admin_id)
REFERENCES public.Admin (admin_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Gerance ADD CONSTRAINT admin_gerance_fk
FOREIGN KEY (responsable_id)
REFERENCES public.Admin (admin_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Authentification_admin ADD CONSTRAINT admin_authentification_admin_fk
FOREIGN KEY (admin_id)
REFERENCES public.Admin (admin_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Boissons ADD CONSTRAINT fournisseur_boissons_fk
FOREIGN KEY (fournisseur_id)
REFERENCES public.Fournisseur (fournisseur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Desserts ADD CONSTRAINT fournisseur_desserts_fk
FOREIGN KEY (fournisseur_id)
REFERENCES public.Fournisseur (fournisseur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ingredients ADD CONSTRAINT fournisseur_ingredients_fk
FOREIGN KEY (fournisseur_id)
REFERENCES public.Fournisseur (fournisseur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Fiche ADD CONSTRAINT ingredients_fiche_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.Ingredients (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande ADD CONSTRAINT clients_commande_fk
FOREIGN KEY (client_id)
REFERENCES public.Clients (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Livraison ADD CONSTRAINT clients_livraison_fk
FOREIGN KEY (client_id)
REFERENCES public.Clients (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Authentification_client ADD CONSTRAINT clients_authentification_client_fk
FOREIGN KEY (client_id)
REFERENCES public.Clients (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Fiche ADD CONSTRAINT pizza_fiche_pizza__fk
FOREIGN KEY (recette_id)
REFERENCES public.Pizza (pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande ADD CONSTRAINT pizzeria_commande_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Livraison ADD CONSTRAINT pizzeria_livraison_fk
FOREIGN KEY (pizzeria_depart_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Gerance ADD CONSTRAINT pizzeria_gerance_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commandes_fournisseurs ADD CONSTRAINT gerance_commandes_fournisseurs_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.Gerance (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Livraison ADD CONSTRAINT commande_livraison_fk
FOREIGN KEY (id_commande)
REFERENCES public.Commande (id_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
