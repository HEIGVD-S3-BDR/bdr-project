-- Écrire le script SQL qui permet de créer cette base de données.
-- En utilisant uniquement les notions vues au cours, implémenter le maximum de contraintes (intégrités référentielles, clés, …) et indiquer dans le rapport toutes celles qui n’ont pas pu être implémentées. Pour les intégrités référentielles, il ne faut pas oublier de définir les ON UPDATE/ON DELETE lorsque la valeur par défaut (NO ACTION) ne convient pas/n’est pas logique et indiquer dans le rapport pourquoi.

-- Drop the public schema and all its contents
DROP SCHEMA IF EXISTS public CASCADE;

-- Recreate the public schema
CREATE SCHEMA public;

CREATE TABLE Personne (
    id serial,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    CONSTRAINT PK_Personne PRIMARY KEY(id)
);

CREATE OR REPLACE FUNCTION check_personne()
RETURNS TRIGGER
LANGUAGE plpgsql 
AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM Candidat 
        WHERE idPersonne = NEW.id
    ) AND NOT EXISTS (
        SELECT 1
        FROM Recruteur
        WHERE idPersonne = NEW.id
    ) THEN
        RAISE EXCEPTION 'A person must be associated with a candidat or recruteur within the same transaction';
    END IF;
    RETURN NEW;
END;
$$;

CREATE CONSTRAINT TRIGGER trg_check_personne
AFTER INSERT ON Personne
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW 
EXECUTE FUNCTION check_personne();

CREATE TABLE Adresse (
    id serial,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    rue VARCHAR(255) NOT NULL,
    ville VARCHAR(255) NOT NULL,
    npa VARCHAR(255) NOT NULL,
    pays VARCHAR(255) NOT NULL,
    CONSTRAINT PK_Adresse PRIMARY KEY(id),
    CHECK (latitude > -90 AND latitude < 90),
    CHECK (longitude > -180 AND longitude < 180)
);

CREATE TYPE Genre AS ENUM ('Femme', 'Homme', 'Autre');

CREATE TABLE Candidat (
    idPersonne INTEGER,
    age SMALLINT NOT NULL,
    genre Genre NOT NULL,
    numeroTel VARCHAR(15) NOT NULL UNIQUE,
    anneesExp SMALLINT NOT NULL,
    idAdresse INTEGER NOT NULL UNIQUE,
    CONSTRAINT PK_Candidat PRIMARY KEY(idPersonne),
    CONSTRAINT FK_Personne FOREIGN KEY (idPersonne) REFERENCES Personne(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Adresse FOREIGN KEY (idAdresse) REFERENCES Adresse(id) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CHECK (age >= 16 AND age < 100)
);

CREATE TABLE Recruteur (
    idPersonne INTEGER,
    CONSTRAINT PK_Recruteur PRIMARY KEY(idPersonne),
    CONSTRAINT FK_Personne FOREIGN KEY (idPersonne) REFERENCES Personne(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Recruteur_Candidat (
    idRecruteur INTEGER,
    idCandidat INTEGER,
    CONSTRAINT PK_Recruteur_Candidat PRIMARY KEY(idRecruteur, idCandidat),
    CONSTRAINT FK_Recruteur FOREIGN KEY (idRecruteur) REFERENCES Recruteur(idPersonne) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_Candidat FOREIGN KEY (idCandidat) REFERENCES Candidat(idPersonne) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Interaction (
    id serial,
    dateInteraction date NOT NULL,
    notesTexte VARCHAR(255) NOT NULL,
    CONSTRAINT PK_Interaction PRIMARY KEY(id)
);

CREATE OR REPLACE FUNCTION check_interaction() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM Interaction_Email
        WHERE idInteraction = NEW.id
    ) AND NOT EXISTS (
        SELECT 1
        FROM Interaction_Appel
        WHERE idInteraction = NEW.id
    ) AND NOT EXISTS (
        SELECT 1
        FROM Interaction_Entretien
        WHERE idInteraction = NEW.id
    ) THEN
        RAISE EXCEPTION 'An interaction must be associated with a email, appel or entretien within the same transaction';
    END IF;
    RETURN NEW;
END;
$$;

CREATE CONSTRAINT TRIGGER trg_check_interaction
AFTER INSERT ON Interaction
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_interaction();

CREATE TABLE Interaction_Email (
    idInteraction INTEGER,
    objet VARCHAR(255) NOT NULL,
    CONSTRAINT PK_Interaction_Email PRIMARY KEY(idInteraction),
    CONSTRAINT FK_Interaction FOREIGN KEY (idInteraction) REFERENCES Interaction(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Interaction_Appel (
    idInteraction INTEGER,
    duree TIME NOT NULL,
    CONSTRAINT PK_Interaction_Appel PRIMARY KEY(idInteraction),
    CONSTRAINT FK_Interaction FOREIGN KEY (idInteraction) REFERENCES Interaction(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TYPE TypeEntretien AS ENUM ('Technique', 'RH', 'Autre');

CREATE TABLE Interaction_Entretien (
    idInteraction INTEGER,
    typeEntretien TypeEntretien NOT NULL,
    duree TIME NOT NULL,
    CONSTRAINT PK_Interaction_Entretien PRIMARY KEY(idInteraction),
    CONSTRAINT FK_Interaction FOREIGN KEY (idInteraction) REFERENCES Interaction(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Recruteur_Interaction (
    idRecruteur INTEGER,
    idInteraction INTEGER,
    CONSTRAINT PK_Recruteur_Interaction PRIMARY KEY(idRecruteur, idInteraction),
    CONSTRAINT FK_Recruteur FOREIGN KEY (idRecruteur) REFERENCES Recruteur(idPersonne) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_Interaction FOREIGN KEY (idInteraction) REFERENCES Interaction(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Candidat_Interaction (
    idCandidat INTEGER,
    idInteraction INTEGER,
    CONSTRAINT PK_Candidat_Interaction PRIMARY KEY(idCandidat, idInteraction),
    CONSTRAINT FK_Candidat FOREIGN KEY (idCandidat) REFERENCES Candidat(idPersonne) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_Interaction FOREIGN KEY (idInteraction) REFERENCES Interaction(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Offre (
    id serial,
    idAdresse INTEGER NOT NULL UNIQUE,
    descriptionOffre VARCHAR(255) NOT NULL,
    nomPoste VARCHAR(255) NOT NULL,
    anneesExpRequises SMALLINT NOT NULL,
    datePublication date NOT NULL,
    dateCloture date,
    CONSTRAINT PK_Offre PRIMARY KEY(id),
    CONSTRAINT FK_Adresse FOREIGN KEY (idAdresse) REFERENCES Adresse(id) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CHECK (dateCloture IS NULL OR dateCloture > datePublication)
);


CREATE TABLE Contrat_Travail (
    id serial,
    debut date NOT NULL,
    fin date,
    salaireHoraire DECIMAL(10, 2) NOT NULL,
    idOffre INTEGER NOT NULL UNIQUE,
    CONSTRAINT PK_Contrat_Travail PRIMARY KEY(id),
    CONSTRAINT FK_Contrat_Travail FOREIGN KEY (idOffre) REFERENCES Offre(id) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CHECK (fin IS NULL OR fin > debut),
    CHECK (salaireHoraire > 0)
);

CREATE OR REPLACE FUNCTION check_contrat_embauche()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
DECLARE
    v_embauche_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_embauche_count
    FROM Candidat_Offre
    WHERE idOffre = NEW.idOffre AND statut = 'Embauché';

    IF v_embauche_count = 0 THEN
        RAISE EXCEPTION 'Cannot create a work contract for an offer without an hired candidate';
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_check_contrat_embauche
BEFORE INSERT ON Contrat_Travail
FOR EACH ROW
EXECUTE FUNCTION check_contrat_embauche();

CREATE OR REPLACE FUNCTION check_fin_after_cloture() 
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if 'fin' is provided and if it's greater than 'dateCloture' from 'Offre'
    IF NEW.fin IS NOT NULL AND NEW.fin <= (SELECT dateCloture FROM Offre WHERE id = NEW.idOffre) THEN
        RAISE EXCEPTION 'The contract end date (fin) must be greater than the offer closure date (dateCloture)';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_check_fin_after_cloture
BEFORE INSERT OR UPDATE ON Contrat_Travail
FOR EACH ROW
EXECUTE FUNCTION check_fin_after_cloture();

-- May need to add values possible for this enum.
CREATE TYPE Statut AS ENUM ('En attente', 'En cours', 'Embauché', 'Refusé');

CREATE TABLE Candidat_Offre (
    idCandidat INTEGER,
    idOffre INTEGER,
    datePostulation date NOT NULL,
    statut Statut NOT NULL,
    CONSTRAINT PK_Candidat_Offre PRIMARY KEY(idCandidat, idOffre),
    CONSTRAINT FK_Candidat FOREIGN KEY (idCandidat) REFERENCES Candidat(idPersonne) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_Offre FOREIGN KEY (idOffre) REFERENCES Offre(id) ON DELETE RESTRICT ON UPDATE NO ACTION
);

CREATE OR REPLACE FUNCTION check_candidat_offre_constraints()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_datePublication date;
    v_dateCloture date;
BEGIN
    -- Get the datePublication and dateCloture from the related Offre
    SELECT datePublication, dateCloture INTO v_datePublication, v_dateCloture
    FROM Offre WHERE id = NEW.idOffre;

    -- Check if statut is 'Embauché' and dateCloture is NULL
    IF NEW.statut = 'Embauché' AND v_dateCloture IS NULL THEN
        RAISE EXCEPTION 'The offer closure date (dateCloture) must not be NULL when the status is "Embauché"';
    END IF;

    -- Check if datePostulation is between datePublication and dateCloture
    IF NEW.datePostulation < v_datePublication OR 
       (v_dateCloture IS NOT NULL AND NEW.datePostulation > v_dateCloture) THEN
        RAISE EXCEPTION 'The postulation date (datePostulation) must be between the offer publication date (datePublication) and closure date (dateCloture)';
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_check_candidat_offre_constraints
BEFORE INSERT OR UPDATE ON Candidat_Offre
FOR EACH ROW
EXECUTE FUNCTION check_candidat_offre_constraints();

CREATE TABLE Domaine (
    id serial,
    nom VARCHAR(255) NOT NULL,
    CONSTRAINT PK_Domaine PRIMARY KEY(id)
);

CREATE OR REPLACE FUNCTION check_domaine_link()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
DECLARE
    v_candidat_count INTEGER;
    v_offre_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_candidat_count
    FROM Candidat_Domaine
    WHERE idDomaine = NEW.id;

    SELECT COUNT(*) INTO v_offre_count
    FROM Offre_Domaine
    WHERE idDomaine = NEW.id;

    IF v_candidat_count = 0 AND v_offre_count = 0 THEN
        RAISE EXCEPTION 'A domain must be linked to at least one candidate or job offer';
    END IF;

    RETURN NEW;
END;
$$;

CREATE CONSTRAINT TRIGGER trg_check_domaine_link
AFTER INSERT OR UPDATE ON Domaine
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION check_domaine_link();

-- May need to add values possible for this enum
CREATE TYPE Diplome AS ENUM ('Aucun', 'Maturité Gymnasiale', 'CFC', 'Bachelor', 'Master', 'Doctorat');

CREATE TABLE Offre_Domaine (
    idOffre INTEGER,
    idDomaine INTEGER,
    diplomeRecherche Diplome NOT NULL,
    CONSTRAINT PK_Offre_Domaine PRIMARY KEY(idOffre, idDomaine),
    CONSTRAINT FK_Offre FOREIGN KEY (idOffre) REFERENCES Offre(id) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT FK_Domaine FOREIGN KEY (idDomaine) REFERENCES Domaine(id) ON DELETE RESTRICT ON UPDATE NO ACTION
);

CREATE TABLE Candidat_Domaine (
    idCandidat INTEGER,
    idDomaine INTEGER,
    diplomePossede Diplome NOT NULL,
    CONSTRAINT PK_Candidat_Domaine PRIMARY KEY(idCandidat, idDomaine),
    CONSTRAINT FK_Candidat FOREIGN KEY (idCandidat) REFERENCES Candidat(idPersonne) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_Domaine FOREIGN KEY (idDomaine) REFERENCES Domaine(id) ON DELETE RESTRICT ON UPDATE NO ACTION
);


-- Adresse 
-- 1
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays) 
VALUES (46.9481, 7.4474, 'Bundesplatz 1', 'Berne', '3011', 'Suisse');
-- 2
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays) 
VALUES (46.2044, 6.1432, 'Rue de la Confédération 8', 'Genève', '1204', 'Suisse');
-- 3
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays) 
VALUES (47.3769, 8.5417, 'Bahnhofstrasse 25', 'Zurich', '8001', 'Suisse');
-- 4
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays) 
VALUES (46.5197, 6.6323, 'Avenue d’Ouchy 15', 'Lausanne', '1006', 'Suisse');
-- 5
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays) 
VALUES (46.8025, 7.1517, 'Rue de Morat 10', 'Fribourg', '1700', 'Suisse');

BEGIN;
-- Domaine
-- 1
INSERT INTO Domaine (nom) VALUES ('Developpement informatique');
-- 2
INSERT INTO Domaine (nom) VALUES ('Finance');

-- Offre
-- 1
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES (4, 'Conseiller financier spécialisé en investissements', 'Conseiller financier', 5, '2024-06-01', NULL);
-- 2
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES (5, 'Développeur Full Stack avec expérience en technologies modernes.', 'Développeur Full Stack', 3, '2024-01-10', NULL);

-- Offre_Domaine
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (1, 2, 'Bachelor');
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (2, 1, 'Master');
COMMIT;

-- Candidats
-- 1
BEGIN;
INSERT INTO Personne (nom, prenom, email) VALUES ('Dupont', 'Jacques', 'jacques.dupont@gmail.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse) VALUES ((SELECT MAX(id) FROM Personne), 30, 'Homme', '0791234567', 7, 1);
COMMIT;
-- 2
BEGIN;
INSERT INTO Personne (nom, prenom, email) VALUES ('Martin', 'Sophie', 'sophie.martin@gmail.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse) VALUES ((SELECT MAX(id) FROM Personne), 28, 'Femme', '0791230123', 4, 2);
COMMIT;
-- 3
BEGIN;
INSERT INTO Personne (nom, prenom, email) VALUES ('Lemoine', 'Paul', 'paul.lemoine@yahoo.fr');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse) VALUES ((SELECT MAX(id) FROM Personne), 35, 'Homme', '0799876543', 10, 3);
COMMIT;

-- Candidat_Domaine
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (1, 1, 'Master');
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (2, 1, 'Bachelor');
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (3, 2, 'Master');

-- Candidat_Offre
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut) VALUES (1, 2, '2024-02-01', 'En cours');
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut) VALUES (2, 2, '2024-03-01', 'En attente');
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut) VALUES (3, 1, '2024-07-01', 'En cours');

-- Recruteurs
-- 4
BEGIN;
INSERT INTO Personne (nom, prenom, email) VALUES ('Durand', 'Claire', 'claire.durand@outlook.com');
INSERT INTO Recruteur (idPersonne) VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;
-- 5
BEGIN;
INSERT INTO Personne (nom, prenom, email) VALUES ('Bernard', 'Lucas', 'lucas.bernard@hotmail.com');
INSERT INTO Recruteur (idPersonne) VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- Recruteur_Candidat
INSERT INTO Recruteur_Candidat (idRecruteur, idCandidat) VALUES (4,1);
INSERT INTO Recruteur_Candidat (idRecruteur, idCandidat) VALUES (5,3);

-- Interaction

-- Interaction_Email
-- 1
BEGIN;
INSERT INTO Interaction (dateInteraction, notesTexte) VALUES ('2024-04-01', 'Entretien la semaine prochaine.');
INSERT INTO Interaction_Email (idInteraction, objet) VALUES ((SELECT MAX(id) FROM Interaction), 'Confirmation rendez-vous.');
COMMIT;

-- Interaction_Appel
-- 2 
BEGIN;
INSERT INTO Interaction (dateInteraction, notesTexte) VALUES ('2024-07-10', 'Demande de détails sur le poste.');
INSERT INTO Interaction_Appel (idInteraction, duree) VALUES ((SELECT MAX(id) FROM Interaction), '00:15:00');
COMMIT;

-- Interaction_Entretien
-- 3
BEGIN;
INSERT INTO Interaction (dateInteraction, notesTexte) VALUES ('2024-04-08', 'Entretien réussi, recontacter pour la phase suivante.');
INSERT INTO Interaction_Entretien (idInteraction, typeEntretien, duree) VALUES ((SELECT MAX(id) FROM Interaction), 'Technique', '00:45:00');
COMMIT;

-- Recruteur_Interaction
INSERT INTO Recruteur_Interaction (idRecruteur, idInteraction) VALUES (4,1);
INSERT INTO Recruteur_Interaction (idRecruteur, idInteraction) VALUES (4,3);
INSERT INTO Recruteur_Interaction (idRecruteur, idInteraction) VALUES (5,2);

-- Candidat_Interaction
INSERT INTO Candidat_Interaction (idCandidat, idInteraction) VALUES (1,1);
INSERT INTO Candidat_Interaction (idCandidat, idInteraction) VALUES (1,3);
INSERT INTO Candidat_Interaction (idCandidat, idInteraction) VALUES (3,2);
