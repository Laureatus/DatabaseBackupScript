DROP DATABASE IF EXISTS lagersystem;
CREATE DATABASE lagersystem;
USE lagersystem;

CREATE TABLE regalreihe(
   reihe_id int NOT NULL, 
   PRIMARY KEY (reihe_id)
);

CREATE TABLE regal(
   regal_id int NOT NULL,
   reihe_id int NOT NULL,
   PRIMARY KEY (regal_id),
   FOREIGN KEY (reihe_id) references regalreihe(reihe_id)
);

CREATE TABLE tablar(
   tablar_id int NOT NULL,
   regal_id int NOT NULL,
   PRIMARY KEY (tablar_id),
   FOREIGN KEY (regal_id) references regal(regal_id)
);

CREATE TABLE menge(
   menge_id int NOT NULL,
   masseinheit VARCHAR(255) NOT NULL,
   PRIMARY KEY (menge_id)
);

CREATE TABLE produkt(
   produkt_id int NOT NULL,
   tablar_id int NOT NULL,
   menge_id int NOT NULL,
   name varchar(255) NOT NULL,
   ablaufdatum DATETIME NOT NULL,
   gekühlt boolean NOT NULL,
   PRIMARY KEY (produkt_id),
   FOREIGN KEY (menge_id) references menge(menge_id),
   FOREIGN KEY (tablar_id) references tablar(tablar_id)
);

CREATE TABLE kategorie(
   kategorie_id int NOT NULL,
   produkt_id int NOT NULL,
   name VARCHAR(255) NOT NULL,
   PRIMARY KEY (kategorie_id),
   FOREIGN KEY (produkt_id) references produkt(produkt_id)
);

CREATE TABLE mitarbeiter(
   mitarbeiter_id int NOT NULL,
   kategorie_id int NOT NULL,
   name varchar(255) NOT NULL,
   vorname varchar(255) NOT NULL,
   PRIMARY KEY (mitarbeiter_id),
   FOREIGN KEY (kategorie_id) references kategorie(kategorie_id)
);
