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
    CHECK (latitude >= -90 AND latitude <= 90),
    CHECK (longitude >= -180 AND longitude <= 180)
);

CREATE TYPE Genre AS ENUM ('Femme', 'Homme', 'Autre');

CREATE TABLE Candidat (
    idPersonne INTEGER,
    age SMALLINT NOT NULL,
    genre Genre NOT NULL,
    numeroTel VARCHAR(20) NOT NULL UNIQUE,
    anneesExp SMALLINT NOT NULL,
    idAdresse INTEGER NOT NULL UNIQUE,
    CONSTRAINT PK_Candidat PRIMARY KEY(idPersonne),
    CONSTRAINT FK_Personne FOREIGN KEY (idPersonne) REFERENCES Personne(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Adresse FOREIGN KEY (idAdresse) REFERENCES Adresse(id) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CHECK (age >= 16 AND age < 100)
);

CREATE OR REPLACE VIEW View_Candidat AS
SELECT 
    p.id,
    p.nom,
    p.prenom,
    p.email,
    c.age,
    c.genre,
    c.numeroTel,
    c.anneesExp,
    a.latitude,
    a.longitude,
    a.rue,
    a.ville,
    a.npa,
    a.pays
FROM 
    Candidat c
INNER JOIN 
    Personne p ON c.idPersonne = p.id
INNER JOIN 
    Adresse a ON c.idAdresse = a.id;

CREATE TABLE Recruteur (
    idPersonne INTEGER,
    CONSTRAINT PK_Recruteur PRIMARY KEY(idPersonne),
    CONSTRAINT FK_Personne FOREIGN KEY (idPersonne) REFERENCES Personne(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE OR REPLACE VIEW View_Recruteur AS
SELECT 
    p.id,
    p.nom,
    p.prenom,
    p.email
FROM 
    Recruteur r
INNER JOIN 
    Personne p ON r.idPersonne = p.id;

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
    datePublication DATE NOT NULL DEFAULT now(),
    dateCloture date,
    CONSTRAINT PK_Offre PRIMARY KEY(id),
    CONSTRAINT FK_Adresse FOREIGN KEY (idAdresse) REFERENCES Adresse(id) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CHECK (dateCloture IS NULL OR dateCloture > datePublication)
);

CREATE OR REPLACE VIEW View_Offre AS
SELECT 
    o.id,
    o.descriptionOffre,
    o.nomPoste,
    o.anneesExpRequises,
    o.datePublication,
    o.dateCloture,
    a.latitude,
    a.longitude,
    a.rue,
    a.ville,
    a.npa,
    a.pays
FROM 
    Offre o
INNER JOIN 
    Adresse a ON o.idAdresse = a.id;

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
    nom VARCHAR(255) UNIQUE NOT NULL,
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

-- Calculate distance based on latitude and longitude
CREATE OR REPLACE FUNCTION haversine(lat1 FLOAT, lon1 FLOAT, lat2 FLOAT, lon2 FLOAT)
RETURNS FLOAT AS $$
DECLARE
    r FLOAT := 6371; -- Earth radius
    dlat FLOAT := radians(lat2 - lat1);
    dlon FLOAT := radians(lon2 - lon1);
    a FLOAT;
    c FLOAT;
BEGIN
    a := sin(dlat / 2)^2 + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon / 2)^2;
    c := 2 * atan2(sqrt(a), sqrt(1 - a));
    RETURN r * c; -- Distance in km
END;
$$ LANGUAGE plpgsql;

-- Best candidates for an offer
CREATE OR REPLACE VIEW View_Candidat_Score AS
SELECT 
    c.idPersonne AS idCandidat,
    o.id AS idOffre,
    haversine(a1.latitude, a1.longitude, a2.latitude, a2.longitude) AS distance,
    greatest((
        CASE
            WHEN cd.diplomePossede = od.diplomeRecherche THEN 100
            WHEN cd.diplomePossede > od.diplomeRecherche THEN 80
            WHEN cd.diplomePossede < od.diplomeRecherche THEN 50
            ELSE 0
        END +
        CASE
            WHEN cd.idDomaine = od.idDomaine THEN 50
            ELSE 20
        END -
        (CASE 
            WHEN haversine(a1.latitude, a1.longitude, a2.latitude, a2.longitude) / 10 > 100 THEN 100
            ELSE haversine(a1.latitude, a1.longitude, a2.latitude, a2.longitude) / 10
        END)
    ), 0) AS score
FROM 
    Candidat c
INNER JOIN Adresse a1 ON c.idAdresse = a1.id
INNER JOIN Candidat_Domaine cd ON c.idPersonne = cd.idCandidat
INNER JOIN Offre_Domaine od ON cd.idDomaine = od.idDomaine
INNER JOIN Offre o ON o.id = od.idOffre
INNER JOIN Adresse a2 ON o.idAdresse = a2.id;


CREATE OR REPLACE FUNCTION get_candidats_pertinents(idoffre INT)
RETURNS TABLE (
    idCandidat INT,
    score FLOAT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        cs.idCandidat, 
        cs.score
    FROM 
        View_Candidat_Score cs
    WHERE 
        cs.idOffre = get_candidats_pertinents.idoffre
    ORDER BY 
        cs.score DESC;
END;
$$ LANGUAGE plpgsql;


-- Best offers for a candidate
CREATE OR REPLACE VIEW View_Offre_Score AS
SELECT 
    o.id AS idOffre,
    c.idPersonne AS idCandidat,
    haversine(a1.latitude, a1.longitude, a2.latitude, a2.longitude) AS distance,
    greatest((
        CASE
            WHEN od.diplomeRecherche = cd.diplomePossede THEN 100
            WHEN od.diplomeRecherche < cd.diplomePossede THEN 80
            WHEN od.diplomeRecherche > cd.diplomePossede THEN 50
            ELSE 0
        END::FLOAT +
        CASE
            WHEN od.idDomaine = cd.idDomaine THEN 50
            ELSE 20
        END::FLOAT -
        (CASE 
            WHEN haversine(a1.latitude, a1.longitude, a2.latitude, a2.longitude) / 10 > 100 THEN 100
            ELSE haversine(a1.latitude, a1.longitude, a2.latitude, a2.longitude) / 10
        END)
    ), 0) AS score
FROM 
    Offre o
INNER JOIN Adresse a1 ON o.idAdresse = a1.id
INNER JOIN Offre_Domaine od ON o.id = od.idOffre
INNER JOIN Candidat_Domaine cd ON cd.idDomaine = od.idDomaine
INNER JOIN Candidat c ON c.idPersonne = cd.idCandidat
INNER JOIN Adresse a2 ON c.idAdresse = a2.id;

CREATE OR REPLACE FUNCTION get_offres_pertinentes(idcandidat INT)
RETURNS TABLE (
    idOffre INT,
    score FLOAT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        os.idOffre, 
        os.score
    FROM 
        View_Offre_Score os
    WHERE 
        os.idCandidat = get_offres_pertinentes.idcandidat
    ORDER BY 
        os.score DESC;
END;
$$ LANGUAGE plpgsql;
