
CREATE TABLE Clients (
                client_id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                adresse VARCHAR(150) NOT NULL,
                code_postal VARCHAR(5) NOT NULL,
                ville VARCHAR(100) NOT NULL,
                telephone INT NOT NULL,
                email VARCHAR(150) NOT NULL,
                PRIMARY KEY (client_id)
);


CREATE INDEX clients_idx
 ON Clients
 ( telephone, nom );

CREATE TABLE Salari (
                salarie_id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(150) NOT NULL,
                adresse VARCHAR(150) NOT NULL,
                n_ss INT NOT NULL,
                ville VARCHAR(150) NOT NULL,
                code_postal VARCHAR(5) NOT NULL,
                telephone VARCHAR(10) NOT NULL,
                echelon INT NOT NULL,
                poste VARCHAR(30) NOT NULL,
                email VARCHAR(100) NOT NULL,
                mot_de_passe VARCHAR(13) NOT NULL,
                PRIMARY KEY (salarie_id)
);


CREATE INDEX salarié_idx
 ON Salari
 ( nom, prenom );

CREATE TABLE Pizzeria (
                pizzeria_id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                adresse VARCHAR(150) NOT NULL,
                code_postal_ VARCHAR(5) NOT NULL,
                ville VARCHAR(150) NOT NULL,
                nbre_salaries INT NOT NULL,
                PRIMARY KEY (pizzeria_id)
);


CREATE UNIQUE INDEX pizzeria_idx
 ON Pizzeria
 ( ville );

CREATE TABLE Gerance (
                responsable_id INT NOT NULL,
                pizzeria_id INT NOT NULL,
                PRIMARY KEY (responsable_id, pizzeria_id)
);


CREATE TABLE Commandes_fournisseurs (
                commande_id INT AUTO_INCREMENT NOT NULL,
                date_commande DATE NOT NULL,
                montant_ht DOUBLE PRECISION NOT NULL,
                taxe DOUBLE PRECISION NOT NULL,
                montant_ttc DOUBLE PRECISION NOT NULL,
                date_paiement DATE NOT NULL,
                responsable_id INT NOT NULL,
                pizzeria_id INT NOT NULL,
                PRIMARY KEY (commande_id)
);


CREATE INDEX commandes_fournisseurs_idx
 ON Commandes_fournisseurs
 ( commande_id );

CREATE TABLE Fournisseur_ (
                fournisseur_id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                adresse VARCHAR(150) NOT NULL,
                ville VARCHAR(150) NOT NULL,
                code_postal VARCHAR(5) NOT NULL,
                commande_id INT NOT NULL,
                PRIMARY KEY (fournisseur_id)
);


CREATE INDEX fournisseur_idx
 ON Fournisseur_
 ( nom );

CREATE TABLE Desserts (
                dessert_id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                date_limite DATE NOT NULL,
                prix_unitaire DOUBLE PRECISION NOT NULL,
                fournisseur_dessert_id INT NOT NULL,
                quantite INT,
                quantite_min INT,
                quantite_max INT,
                PRIMARY KEY (dessert_id)
);


CREATE UNIQUE INDEX desserts_idx
 ON Desserts
 ( nom );

CREATE TABLE Boissons (
                boisson_id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                quantite INT NOT NULL,
                prix_unitaire DOUBLE PRECISION NOT NULL,
                date_limite DATE NOT NULL,
                fournisseur_boissons_id INT NOT NULL,
                quantite_1 INT,
                quantite_min INT,
                quantite_max INT,
                PRIMARY KEY (boisson_id)
);


CREATE UNIQUE INDEX boissons_idx
 ON Boissons
 ( nom );

CREATE TABLE Ingredients (
                ingredient_id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prix_unitaire DOUBLE PRECISION NOT NULL,
                date_limite DATE NOT NULL,
                fournisseur_ingredient_id INT NOT NULL,
                quantite INT,
                quantite_max INT,
                quantite_min INT,
                PRIMARY KEY (ingredient_id)
);


CREATE TABLE Pizza (
                pizza_id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                format VARCHAR(20) NOT NULL,
                prix_ht DOUBLE PRECISION NOT NULL,
                ingredient_id INT NOT NULL,
                PRIMARY KEY (pizza_id)
);


CREATE INDEX pizza_idx
 ON Pizza
 ( nom );

CREATE TABLE Fiche (
                pizza_id INT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                format VARCHAR(150) NOT NULL,
                recette VARCHAR(2000) NOT NULL,
                ingredient_id INT NOT NULL,
                time TIME,
                PRIMARY KEY (pizza_id)
);


CREATE INDEX fiche_pizza__idx
 ON Fiche
 ( nom );

CREATE TABLE Commande (
                id_commande INT AUTO_INCREMENT NOT NULL,
                date DATE NOT NULL,
                montant_ht DOUBLE PRECISION NOT NULL,
                promo DOUBLE PRECISION,
                montant_ttc DOUBLE PRECISION NOT NULL,
                taxe DOUBLE PRECISION NOT NULL,
                livraison BOOLEAN NOT NULL,
                payer BOOLEAN NOT NULL,
                client_id INT NOT NULL,
                a_emporter BOOLEAN NOT NULL,
                pizzeria_id INT NOT NULL,
                livraison_id INT NOT NULL,
                adminCommande_id INT NOT NULL,
                PRIMARY KEY (id_commande)
);


CREATE INDEX commande_idx
 ON Commande
 ( id_commande );

CREATE TABLE Livraison (
                livraison_id INT AUTO_INCREMENT NOT NULL,
                date_livraison DATE NOT NULL,
                heure_livraison TIME NOT NULL,
                livreur_id INT NOT NULL,
                id_commande INT NOT NULL,
                pizzeria_depart_id INT NOT NULL,
                client_id INT NOT NULL,
                PRIMARY KEY (livraison_id)
);


CREATE INDEX livraison_idx
 ON Livraison
 ( livreur_id );

ALTER TABLE Commande ADD CONSTRAINT clients_commande_fk
FOREIGN KEY (client_id)
REFERENCES Clients (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Livraison ADD CONSTRAINT clients_livraison_fk
FOREIGN KEY (client_id)
REFERENCES Clients (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Livraison ADD CONSTRAINT salarié_livraison_fk
FOREIGN KEY (livreur_id)
REFERENCES Salari (salarie_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Commande ADD CONSTRAINT salarié_commande_fk1
FOREIGN KEY (adminCommande_id)
REFERENCES Salari (salarie_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Gerance ADD CONSTRAINT salarié_gerance_fk
FOREIGN KEY (responsable_id)
REFERENCES Salari (salarie_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Commande ADD CONSTRAINT pizzeria_commande_fk
FOREIGN KEY (pizzeria_id)
REFERENCES Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Livraison ADD CONSTRAINT pizzeria_livraison_fk
FOREIGN KEY (pizzeria_depart_id)
REFERENCES Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Gerance ADD CONSTRAINT pizzeria_gerance_fk
FOREIGN KEY (pizzeria_id)
REFERENCES Pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Commandes_fournisseurs ADD CONSTRAINT gerance_commandes_fournisseurs_fk
FOREIGN KEY (pizzeria_id, responsable_id)
REFERENCES Gerance (pizzeria_id, responsable_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fournisseur_ ADD CONSTRAINT commandes_fournisseurs_fournisseurs__fk
FOREIGN KEY (commande_id)
REFERENCES Commandes_fournisseurs (commande_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Ingredients ADD CONSTRAINT fournisseurs__ingrédients_fk
FOREIGN KEY (fournisseur_ingredient_id)
REFERENCES Fournisseur_ (fournisseur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Boissons ADD CONSTRAINT fournisseurs__boissons_fk
FOREIGN KEY (fournisseur_boissons_id)
REFERENCES Fournisseur_ (fournisseur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Desserts ADD CONSTRAINT fournisseurs__desserts_fk
FOREIGN KEY (fournisseur_dessert_id)
REFERENCES Fournisseur_ (fournisseur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Pizza ADD CONSTRAINT ingrédients_pizza_fk
FOREIGN KEY (ingredient_id)
REFERENCES Ingredients (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fiche ADD CONSTRAINT ingrédients_fiche_pizza__fk
FOREIGN KEY (ingredient_id)
REFERENCES Ingredients (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fiche ADD CONSTRAINT pizza_fiche_pizza__fk
FOREIGN KEY (pizza_id)
REFERENCES Pizza (pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Livraison ADD CONSTRAINT commande_livraison_fk
FOREIGN KEY (id_commande)
REFERENCES Commande (id_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Commande ADD CONSTRAINT livraison_commande_fk
FOREIGN KEY (livraison_id)
REFERENCES Livraison (livraison_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
