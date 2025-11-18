CREATE TABLE Parti (
    nom VARCHAR(50) NOT NULL,
    nb_adherants INT UNSIGNED NOT NULL,
    categorie ENUM('gauche','droite','extreme gauche','extreme droite','centre') NOT NULL,
    PRIMARY KEY (nom)
);

CREATE TABLE Conton (
    nom VARCHAR(50) NOT NULL,
    nb_electeurs INT NOT NULL,
    departement VARCHAR(50) NOT NULL,
    montant DECIMAL(10,0) NOT NULL,
    PRIMARY KEY (nom)
);

CREATE TABLE Candidat (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    parti VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (parti) REFERENCES Parti(nom)
        ON DELETE CASCADE
    	ON UPDATE CASCADE
);


CREATE TABLE Candidatures (
    date DATE NOT NULL,
    adjoint INT UNSIGNED NOT NULL,
    candidat INT UNSIGNED NOT NULL,
    conton VARCHAR(50),
    PRIMARY KEY (date, adjoint, candidat),
    FOREIGN KEY (adjoint) REFERENCES Candidat(id)
        ON DELETE CASCADE
    	ON UPDATE CASCADE,
    FOREIGN KEY (conton) REFERENCES Conton(nom)
        ON DELETE CASCADE
    	ON UPDATE CASCADE,
    FOREIGN KEY (candidat) REFERENCES Candidat(id)
    	ON DELETE CASCADE
    	ON UPDATE CASCADE
);

CREATE TABLE Resultats (
    date DATE NOT NULL,
    id_candidat INT UNSIGNED NOT NULL,
    tour TINYINT UNSIGNED NOT NULL,
    resultat DECIMAL(10,0) NOT NULL,
    PRIMARY KEY (date,id_candidat,tour),
    FOREIGN KEY (id_candidat) REFERENCES Candidat (id)
    	ON DELETE CASCADE
    	ON UPDATE CASCADE
);

COMMIT;
