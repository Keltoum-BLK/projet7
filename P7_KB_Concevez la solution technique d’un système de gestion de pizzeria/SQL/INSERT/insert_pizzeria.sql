INSERT INTO "public"."pizzeria"("pizzeria_id", "nom", "adresse", "code_postal", "ville", "nbre_salaries") VALUES(1, 'OCPIZZA LA DEFENSE', '52 rue des reflets ', '92400', 'COURBEVOIE', 20) RETURNING "pizzeria_id", "nom", "adresse", "code_postal", "ville", "nbre_salaries";
INSERT INTO "public"."pizzeria"("pizzeria_id", "nom", "adresse", "code_postal", "ville", "nbre_salaries") VALUES(2, 'OCPIZZA WAGRAM ', '48 rue des resistants', '75017', 'PARIS', 30) RETURNING "pizzeria_id", "nom", "adresse", "code_postal", "ville", "nbre_salaries";
