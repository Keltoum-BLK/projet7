INSERT INTO "public"."boissons"("boisson_id", "nom", "prix_unitaire", "quantite_1", "quantite_min", "quantite_max", "fournisseur_id") VALUES(1, 'COCA COLA ZERO Cannette ', 1.5, 112, 100, 700, 1) RETURNING "boisson_id", "nom", "prix_unitaire", "quantite_1", "quantite_min", "quantite_max", "fournisseur_id";
INSERT INTO "public"."boissons"("boisson_id", "nom", "prix_unitaire", "quantite_1", "quantite_min", "quantite_max", "fournisseur_id") VALUES(2, 'COCA ZERO 1,5l ', 4, 100, 80, 200, 1) RETURNING "boisson_id", "nom", "prix_unitaire", "quantite_1", "quantite_min", "quantite_max", "fournisseur_id";