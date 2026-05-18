-- ============================================
-- Exercice 0 : initialisation
-- Réalisé par : Braux Hugo
-- Date : 18/05/2026
-- ============================================

CREATE TABLE STREAMER(
   id_streamer SERIAL,
   pseudo VARCHAR(50),
   url_twitch VARCHAR(50),
   PRIMARY KEY(id_streamer),
   UNIQUE(pseudo)
);

CREATE TABLE CRENEAUX(
   id_creneau SERIAL,
   date_debut_autorisee TIMESTAMP,
   date_fin_autorisee TIMESTAMP,
   id_streamer INT NOT NULL,
   PRIMARY KEY(id_creneau),
   FOREIGN KEY(id_streamer) REFERENCES STREAMER(id_streamer)
);

CREATE TABLE STREAM(
   id_stream SERIAL,
   titre VARCHAR(50),
   heure_debut TIMESTAMP,
   heure_fin TIMESTAMP,
   date_fin_effective TIMESTAMP NOT NULL,
   id_creneau INT NOT NULL,
   id_streamer INT NOT NULL,
   PRIMARY KEY(id_stream),
   FOREIGN KEY(id_creneau) REFERENCES CRENEAUX(id_creneau),
   FOREIGN KEY(id_streamer) REFERENCES STREAMER(id_streamer)
);

CREATE TABLE DEFI(
   id_defi SERIAL,
   intitule VARCHAR(50),
   montant_palier DECIMAL(12,2),
   etat_validation BOOLEAN,
   PRIMARY KEY(id_defi)
);

CREATE TABLE PARTICIPATION_DEFI(
   id_streamer INT,
   id_defi INT,
   PRIMARY KEY(id_streamer, id_defi),
   FOREIGN KEY(id_streamer) REFERENCES STREAMER(id_streamer),
   FOREIGN KEY(id_defi) REFERENCES DEFI(id_defi)
);
