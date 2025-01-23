-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cosendey', 'Eric', 'lbesencon@example.net');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('Grosjean', 'Jean-Pierre', 'chatrianddavid@example.com');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('Deladoëy', 'Jeanne', 'helenemercier@example.com');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cattin', 'Lucie', 'bourquardsimone@example.org');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('Meyer', 'René', 'pascal85@example.com');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('Comment', 'Maria', 'annecorbat@example.com');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('Matile', 'Françoise', 'besseclara@example.com');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('Vienne', 'Nicolas', 'celinecornuz@example.net');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('Besençon', 'Caroline', 'rmonnet@example.com');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('Mercier', 'Jean-Claude', 'marie81@example.org');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-71.314512, 103.892238, 'avenue Rapraz 95',
        'Chaudet', '4841', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Vuille', 'Catherine', 'besanconnolan@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 63, 'Autre',
        '+41 49 876 98 12', 1, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (11, 5, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (11, 1, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-53.2941055, 123.629884, 'chemin Christine Bernasconi 65',
        'Comman-sur-Tinguely', '1464', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Vallélian', 'Ethan', 'emma43@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 50, 'Autre',
        '+41 21 033 35 81', 40, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (12, 3, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (12, 1, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-29.6015795, -108.912245, 'rue de Chevalley 3',
        'Beurret', '2434', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Rossellat', 'Nathalie', 'aevequoz@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 60, 'Homme',
        '+41 42 672 87 12', 35, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (13, 1, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (13, 5, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-65.498216, -11.828215, 'boulevard de Bonvin',
        'Blanc-Dessous', '1385', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Rosselet', 'Noah', 'carronsuzanne@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 54, 'Autre',
        '0846 504 415', 28, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (14, 2, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (14, 3, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (11.288413, -53.855825, 'avenue Sébastien Berberat 20',
        'Gubéran-la-Ville', '1662', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Mayor', 'Marcel', 'rosseletchantal@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 64, 'Femme',
        '+41 (0)65 837 42 73', 1, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (15, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (15, 3, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-63.5809435, -36.140781, 'rue Saudan 9',
        'Comte-près-Besançon', '9626', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cattin', 'Sara', 'rmonnard@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 60, 'Femme',
        '+41 90 448 01 75', 24, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (16, 3, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (16, 5, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (32.5038185, -146.88366, 'chemin de Deshusses 3',
        'Aeby', '8314', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Candaux', 'Ana', 'georges29@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 52, 'Femme',
        '057 070 22 48', 24, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (17, 4, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (17, 2, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (44.719804, -94.018945, 'boulevard Lisa Carron 18',
        'Menthonnex-sur-Coigny', '7588', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Rossellat', 'Roger', 'cosandeychloe@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 45, 'Autre',
        '+41 (0)52 866 06 33', 14, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (18, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (18, 1, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-72.5059145, -6.250428, 'rue Alice Cosendey 141',
        'Bourquin am Albis', '3876', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chaudet', 'François', 'nsansonnens@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 39, 'Homme',
        '+41 91 470 41 27', 19, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (19, 4, 'Master');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (19, 2, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (89.90918, 76.916907, 'rue Vonlanthen 68',
        'Bonvin-Dessous', '2212', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Blanc', 'Gabriel', 'pascal00@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 36, 'Homme',
        '+41 (0)97 136 91 33', 7, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (20, 1, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (20, 5, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-12.544295, -113.205601, 'rue Vallélian 349',
        'Courvoisier', '2716', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bouvier', 'Paul', 'elodie09@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 49, 'Femme',
        '+41 (0)67 287 07 63', 21, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (21, 5, 'Master');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (21, 2, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-71.650122, 112.39936, 'rue Bernard Jomini 75',
        'Chatriand', '1883', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Mayor', 'Jonathan', 'qniquille@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 62, 'Autre',
        '+41 (0)24 532 54 78', 0, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (22, 5, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (22, 4, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-74.0043335, 170.85641, 'rue Christophe Maire 210',
        'Boechat', '7118', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Morard', 'Stéphane', 'mcarraux@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 29, 'Femme',
        '+41 54 446 42 92', 19, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (23, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (23, 4, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (66.9289525, -8.59604, 'rue Barbey 9',
        'Dubey-sur-Rossellat', '8041', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Crevoisier', 'Marcel', 'stephanieisella@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 17, 'Autre',
        '+41 39 836 70 20', 4, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (24, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (24, 2, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (1.2821015, -159.104995, 'boulevard Chaudet',
        'Rosselat-Dessus', '9273', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Montandon', 'Anna', 'samuelbonvin@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 65, 'Autre',
        '064 650 98 82', 34, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (25, 1, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (25, 4, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-66.468894, -38.948511, 'rue de Grand',
        'Martin', '4732', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Gubéran', 'Jean-Pierre', 'hugocoigny@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 32, 'Homme',
        '+41 (0)75 766 73 33', 8, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (26, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (26, 5, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (2.791173, 105.304116, 'avenue Bujard',
        'Badan-près-Blanc', '6093', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Peitrequin', 'Emma', 'patrick68@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 62, 'Autre',
        '+41 76 186 13 59', 25, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (27, 2, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (27, 5, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (3.578325, 77.35625, 'rue Laurent Cattin 253',
        'Cornut', '3233', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Comte', 'Odette', 'noah54@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 23, 'Autre',
        '+41 (0)28 185 73 39', 21, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (28, 4, 'Master');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (28, 1, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (67.372741, -133.127344, 'avenue Monique Berberat 97',
        'Rosselat-près-Grand', '7998', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chapuis', 'Liliane', 'privetchristian@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 49, 'Autre',
        '+41 69 425 16 53', 40, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (29, 3, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (29, 4, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (10.34999, -122.348254, 'rue Bouvier 64',
        'Piccand', '3842', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Deshusses', 'Raymond', 'laetitiacurdy@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 24, 'Homme',
        '083 950 86 21', 21, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (30, 5, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (30, 3, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-84.117123, -41.116312, 'chemin Fonjallaz 4',
        'Joly', '6973', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Müller', 'Loïc', 'boechatmarcel@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 42, 'Autre',
        '+41 73 414 95 27', 11, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (31, 2, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (31, 1, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-30.492347, 39.549926, 'boulevard Manon Candaux 57',
        'Monney (SO)', '7960', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bovet', 'Jonathan', 'commanantonio@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 61, 'Homme',
        '026 123 68 54', 5, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (32, 4, 'Master');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (32, 2, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (18.798691, 4.750165, 'avenue Céline Monnet',
        'Aebi am See', '6909', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Curdy', 'Lucie', 'sara52@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 44, 'Femme',
        '071 471 96 09', 6, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (33, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (33, 1, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-69.407191, 3.015235, 'boulevard de Duroux 25',
        'Duvanel', '8627', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Quartier', 'Chloé', 'irobert@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 59, 'Homme',
        '+41 97 488 09 14', 21, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (34, 2, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (34, 1, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-63.2564585, -105.533759, 'rue Manuel Chatriant 78',
        'Duvanel', '6155', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Grand', 'Sandrine', 'julie71@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 42, 'Homme',
        '047 421 88 29', 6, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (35, 5, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (35, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-85.476357, -169.484189, 'rue Paul Wicht 75',
        'Gubéran', '8132', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Deshusses', 'Simone', 'tsansonnens@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 53, 'Autre',
        '+41 80 641 20 93', 2, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (36, 4, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (36, 3, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (86.9704785, 121.208209, 'chemin Bovet 5',
        'Saudan-près-Joye', '5039', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Dubey', 'Vanessa', 'francoisejoye@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 22, 'Femme',
        '+41 28 671 75 99', 28, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (37, 4, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (37, 2, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (15.6788445, 54.7409, 'rue Nathan Comman 228',
        'Corpataux-des-Bois', '2213', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Grojean', 'Patrick', 'manon06@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 24, 'Autre',
        '067 949 24 21', 30, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (38, 2, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (38, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (74.6735365, -56.609432, 'rue de Niquille 53',
        'Badel-Dessus', '7089', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Peitrequin', 'Anna', 'lilianefrancillon@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 57, 'Femme',
        '097 473 50 05', 35, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (39, 3, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (39, 5, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-8.348106, 149.751069, 'boulevard Emma Besençon 2',
        'Pellet', '5265', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bochud', 'Claudine', 'badanmichel@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 25, 'Femme',
        '0906 422 885', 24, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (40, 2, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (40, 3, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-41.639861, 173.077468, 'avenue Daniel Polla 4',
        'Bovet', '4767', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bovet', 'Louis', 'ymusy@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 22, 'Autre',
        '+41 44 325 02 11', 35, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (41, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (41, 1, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-32.7152865, 97.850181, 'rue Corinne Pellet 98',
        'Bahon', '9255', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Conrad', 'Madeleine', 'alain03@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 59, 'Homme',
        '+41 (0)46 126 75 45', 31, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (42, 1, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (42, 2, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-25.283513, -114.955448, 'avenue de Cossy',
        'Müller-près-Cosandey', '2615', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Barbey', 'Michel', 'xromanens@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 42, 'Femme',
        '+41 (0)93 242 20 32', 30, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (43, 1, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (43, 2, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-51.1432605, 113.363917, 'avenue Pierre Broquet 93',
        'Treboux am See', '4822', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Rappaz', 'Sébastien', 'crevoisierroland@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 16, 'Autre',
        '+41 67 493 01 37', 2, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (44, 3, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (44, 4, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (70.9611235, 120.031384, 'rue de Galland 6',
        'UnterPachoud', '7343', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Crivelli', 'Patrick', 'besanconolivier@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 18, 'Femme',
        '+41 82 503 16 94', 36, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (45, 2, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (45, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (88.551076, 62.377051, 'boulevard Aeby 2',
        'Curdy-près-Peitrequin', '3918', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Botteron', 'Bruno', 'eva93@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 63, 'Homme',
        '+41 65 633 29 56', 16, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (46, 4, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (46, 2, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-44.1146175, -37.247734, 'avenue Carraud 61',
        'Aeby', '1239', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bonvini', 'Marcel', 'humbertsuzanne@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 63, 'Autre',
        '092 003 68 57', 22, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (47, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (47, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-2.085085, -168.829023, 'chemin Roland Rapraz 63',
        'Théraulaz-près-Boechat', '5119', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Monnet', 'Isabelle', 'martyelisa@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 62, 'Femme',
        '0906 081 219', 10, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (48, 3, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (48, 2, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-44.843314, 179.361735, 'avenue de Bonvin',
        'Rappaz-les-Bains', '3512', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Coigny', 'Bruno', 'tinguelyrobert@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 51, 'Homme',
        '0841 348 206', 11, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (49, 3, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (49, 2, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (89.37394, 94.941261, 'chemin de Barbey 39',
        'Droz', '8874', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chenaux', 'Mélanie', 'aurelie92@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 41, 'Autre',
        '+41 45 902 27 45', 27, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (50, 5, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (50, 4, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (75.543008, 138.688084, 'boulevard de Carraud 71',
        'Paschoud-la-Ville', '2012', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Diesbach', 'Michael', 'claudejoye@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 57, 'Homme',
        '+41 (0)64 756 41 59', 31, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (51, 2, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (51, 1, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-11.96986, -26.015644, 'boulevard Uldry 45',
        'Bujard', '2258', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Rapraz', 'Bruno', 'lucas75@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 63, 'Femme',
        '+41 88 990 13 05', 34, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (52, 1, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (52, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-53.5408755, 5.621734, 'avenue Comman 10',
        'Piccand', '9121', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cosandey', 'Sébastien', 'hugo62@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 21, 'Homme',
        '+41 (0)71 845 42 28', 6, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (53, 2, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (53, 1, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (70.5594835, -153.653729, 'avenue Aeby',
        'Morand (GR)', '9913', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Monnard', 'Mathieu', 'albert73@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 49, 'Homme',
        '+41 (0)70 855 74 79', 40, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (54, 4, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (54, 2, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-0.6472095, 94.545941, 'boulevard Matteo Bonvin 43',
        'Rossellat-Dessous', '6273', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Fonjallaz', 'Jacqueline', 'brunobujard@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 34, 'Autre',
        '+41 (0)94 203 89 33', 19, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (55, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (55, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (16.466913, 171.90512, 'rue Josiane Aeby 97',
        'San Bahon', '2030', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Sansonnens', 'Yvette', 'romanenseva@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 65, 'Femme',
        '+41 (0)99 396 96 11', 20, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (56, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (56, 2, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (3.5436205, 67.319679, 'avenue Treboux 60',
        'Niquille', '9944', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Dubey', 'Laura', 'fchevrolet@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 56, 'Homme',
        '096 195 91 35', 14, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (57, 5, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (57, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (78.642539, -0.303255, 'rue Müller 53',
        'Cattin-près-Brandt', '6274', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cousin', 'Lisa', 'charleschopard@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 64, 'Autre',
        '+41 95 597 91 39', 38, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (58, 4, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (58, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-37.717391, 172.175266, 'avenue Eliane Rosselat 71',
        'Jacot-Descombes', '1217', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Duvanel', 'Théo', 'boichatlara@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 44, 'Femme',
        '+41 (0)25 932 57 52', 12, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (59, 3, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (59, 4, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-86.9488925, 131.171496, 'rue de Barillon',
        'Menthonnex', '6443', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Francillon', 'Lucie', 'lea48@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 64, 'Autre',
        '054 901 56 17', 10, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (60, 2, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (60, 3, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (52.8087875, 6.875681, 'chemin Vincent Mercier 38',
        'Uldry am Albis', '6144', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Barman', 'François', 'beuchatlisa@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 44, 'Homme',
        '0901 802 897', 9, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (61, 2, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (61, 3, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-31.059702, -123.048202, 'rue Droz 518',
        'Joye', '5219', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Monnard', 'Madeleine', 'candauxelisabeth@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 35, 'Femme',
        '+41 34 229 59 07', 11, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (62, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (62, 3, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-40.932987, -138.237528, 'chemin Kevin Chatriant',
        'Chatriand (GR)', '5120', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Carraux', 'Vanessa', 'pachoudsylvie@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 26, 'Femme',
        '+41 (0)72 181 18 99', 9, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (63, 3, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (63, 1, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-32.4390025, -44.454337, 'avenue Eliane Nüsslin 95',
        'Chappuis-sur-Fonjallaz', '7580', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bahon', 'Christine', 'ybarbey@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 22, 'Homme',
        '+41 (0)29 519 66 16', 34, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (64, 5, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (64, 3, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-86.368869, 129.697094, 'chemin Vienne 40',
        'Bochud (VS)', '8457', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Saudan', 'Chantal', 'wrosselat@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 47, 'Homme',
        '+41 (0)83 154 95 54', 9, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (65, 2, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (65, 1, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-68.705242, -35.485874, 'chemin Jean Beuret 96',
        'Corboz-les-Bains', '1698', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Beurret', 'Françoise', 'camillebourquin@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 30, 'Homme',
        '+41 (0)26 413 46 85', 13, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (66, 5, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (66, 2, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-32.7902405, 37.551477, 'chemin Nusslé',
        'UnterChapuis', '9243', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Menthonnex', 'Louis', 'elisa85@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 63, 'Femme',
        '+41 48 329 41 93', 13, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (67, 2, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (67, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (87.626358, -123.069868, 'rue Léa Carraux 86',
        'Bovet-les-Bains', '7655', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Boechat', 'Odette', 'dprivet@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 52, 'Femme',
        '047 802 79 70', 10, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (68, 1, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (68, 3, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-3.7099175, 77.557949, 'rue Corinne Thorens',
        'Vuille-des-Bois', '5285', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Besse', 'Madeleine', 'yvette90@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 41, 'Autre',
        '+41 (0)99 105 80 49', 40, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (69, 4, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (69, 1, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (65.400283, -120.455936, 'chemin de Bugnon 51',
        'San Délèze', '8841', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Mercier', 'Jean-Claude', 'yvette50@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 58, 'Femme',
        '+41 (0)58 215 69 12', 22, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (70, 1, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (70, 3, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (42.3716935, 124.424767, 'rue de Cattin 8',
        'Vuille', '8115', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Pellet', 'Hugo', 'fpolla@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 43, 'Autre',
        '+41 30 627 68 56', 22, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (71, 3, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (71, 4, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (4.564974, 37.759917, 'chemin Elodie Bovet 54',
        'Carraux-près-Mayor', '3169', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Charpié', 'Luca', 'yvonne57@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 59, 'Autre',
        '0878 027 228', 19, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (72, 5, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (72, 1, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (64.472061, 98.726438, 'rue de Beguin 90',
        'Courvoisier', '6132', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Mottiez', 'Anna', 'gilbert42@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 30, 'Femme',
        '0901 974 098', 14, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (73, 1, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (73, 5, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (14.795622, -42.947244, 'rue Laurence Vienne',
        'Humbert (GL)', '6579', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Carraud', 'Simone', 'romanensmonique@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 21, 'Homme',
        '037 359 92 27', 10, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (74, 5, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (74, 2, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (44.7993255, 179.797626, 'boulevard Pascal Rossellat 15',
        'UnterMarti', '3079', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Rappaz', 'Henri', 'patricia47@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 62, 'Homme',
        '089 138 21 80', 29, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (75, 2, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (75, 4, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-12.4593175, -6.79004, 'avenue Fabienne Saudan 50',
        'Vermeil-sur-Polla', '8434', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Badan', 'Laetitia', 'pierre52@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 38, 'Autre',
        '+41 (0)99 274 03 74', 13, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (76, 3, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (76, 4, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-45.569585, 153.698404, 'boulevard Laurent Chatriand 320',
        'Bavaud am Albis', '7138', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Pellet', 'Roger', 'jolylaurence@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 41, 'Autre',
        '+41 (0)71 425 00 64', 27, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (77, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (77, 1, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-16.519892, 87.574314, 'rue Humbert 38',
        'Brahier-la-Ville', '6400', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Robert', 'François', 'lara83@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 65, 'Femme',
        '030 646 70 57', 39, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (78, 2, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (78, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-30.2315465, -86.519415, 'rue Béguelin 42',
        'Marti-près-Carraux', '4923', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Beurret', 'Marcelle', 'bujardzoe@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 33, 'Autre',
        '057 925 27 18', 3, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (79, 1, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (79, 3, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (10.016787, -24.220889, 'boulevard de Théraulaz 357',
        'Humbert-près-Carraud', '8252', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Joye', 'Nicole', 'patrick25@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 49, 'Femme',
        '+41 40 956 55 96', 34, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (80, 3, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (80, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (9.9236535, 141.55269, 'rue Boillat 4',
        'Carraux-sur-Duvanel', '8837', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Mottet', 'Ethan', 'mmottet@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 58, 'Femme',
        '+41 (0)62 879 68 59', 20, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (81, 3, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (81, 5, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (81.490433, -125.803724, 'avenue Manon Chatriand 1',
        'Sainte Rey', '3524', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Uldry', 'Sara', 'kevinisella@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 28, 'Homme',
        '072 316 39 94', 37, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (82, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (82, 1, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-46.9587905, 76.889025, 'rue Bavaud 504',
        'de Dardel', '1683', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cornut', 'Jean-Claude', 'piccandnoah@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 24, 'Homme',
        '+41 52 299 58 67', 18, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (83, 2, 'Master');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (83, 1, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (39.930892, 128.580559, 'chemin Danielle Bahon 11',
        'Comman an der Aare', '3055', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Vallélian', 'Marianne', 'philippe88@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 38, 'Homme',
        '0878 320 941', 4, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (84, 1, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (84, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (68.160382, 26.32598, 'boulevard Bonvini 1',
        'Pellet', '1609', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cosendey', 'Thomas', 'eaeby@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 58, 'Autre',
        '076 590 76 73', 14, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (85, 1, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (85, 4, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (89.9472445, 145.819135, 'boulevard Madeleine Uldry 60',
        'Bavaud', '6816', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Babey', 'Mathieu', 'chatriandaurelie@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 57, 'Autre',
        '094 742 80 27', 34, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (86, 5, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (86, 4, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (27.5468185, 98.88228, 'boulevard de Polla 83',
        'Morard-la-Ville', '1971', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Humbert', 'Danielle', 'michael36@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 20, 'Homme',
        '+41 (0)74 685 03 18', 11, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (87, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (87, 3, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-39.6826715, -126.696509, 'chemin Coigny 26',
        'San Bovet', '5325', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cretton', 'Georges', 'marianne56@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 20, 'Femme',
        '0878 866 460', 26, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (88, 5, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (88, 4, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-81.563356, 53.311406, 'rue Manuel Vallélian 359',
        'Privet-sur-Godet', '1286', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Galland', 'Matteo', 'taebi@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 62, 'Autre',
        '+41 (0)25 906 35 15', 28, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (89, 5, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (89, 1, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (6.102551, 147.037826, 'rue Pascal Niquille',
        'Pasquier-Dessus', '5258', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Barillon', 'Eva', 'schenaux@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 50, 'Autre',
        '+41 (0)60 639 79 82', 27, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (90, 5, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (90, 3, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (3.752554, -93.224998, 'chemin Fabienne Nüsslin',
        'Curdy am Albis', '9646', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Gubéran', 'Olivier', 'jonathan74@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 57, 'Femme',
        '+41 (0)21 558 41 53', 13, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (91, 1, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (91, 3, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (89.222811, -117.440664, 'rue de Grand 722',
        'Corbat-Dessous', '9906', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Galland', 'Zoé', 'maxime85@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 64, 'Homme',
        '079 259 57 52', 6, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (92, 1, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (92, 3, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (11.723743, -49.124939, 'chemin Pellet 850',
        'Duroux am Rhein', '3004', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bonvini', 'Sandrine', 'laetitia00@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 46, 'Autre',
        '+41 (0)69 236 99 40', 33, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (93, 5, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (93, 2, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-63.301866, -24.29864, 'boulevard Elisabeth Corboz 62',
        'Morand', '2632', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Isella', 'Elisabeth', 'uwicht@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 16, 'Homme',
        '+41 59 730 88 79', 19, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (94, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (94, 1, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-72.1517255, -36.082616, 'chemin de Julliard 73',
        'OberGrosjean', '6860', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Jomini', 'Simone', 'ibochud@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 31, 'Homme',
        '023 468 05 87', 5, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (95, 5, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (95, 4, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-22.2276355, -126.005698, 'boulevard Vincent Cornut 74',
        'Blanc-sur-Balmat', '6420', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Beuchat', 'Marguerite', 'bernardberberat@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 40, 'Autre',
        '024 005 91 16', 9, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (96, 5, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (96, 1, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (20.5258445, -144.363025, 'rue Cornut 65',
        'Droz am See', '3275', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Vonlanthen', 'Nelly', 'crevoisiersarah@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 47, 'Autre',
        '0906 471 149', 7, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (97, 2, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (97, 5, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-87.8478685, 141.205217, 'chemin Gubéran',
        'Charpié', '1031', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Diesbach', 'Alice', 'zoedeshusses@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 48, 'Femme',
        '+41 64 864 52 02', 15, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (98, 4, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (98, 1, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-17.131653, 38.789688, 'chemin Joly 41',
        'Wicht am See', '3540', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Aeby', 'Manon', 'hprivet@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 47, 'Femme',
        '0901 699 546', 13, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (99, 3, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (99, 5, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-32.3720715, -34.427965, 'chemin Jean-Pierre Cretton 3',
        'Chatriand-sur-Wicht', '6456', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cornuz', 'Corinne', 'bernard19@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 57, 'Autre',
        '0900 398 520', 5, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (100, 4, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (100, 3, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-47.475028, -6.820218, 'rue de Carraud 14',
        'Montandon', '9326', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Montandon', 'Marguerite', 'beguinsuzanne@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 39, 'Femme',
        '+41 (0)65 756 30 32', 31, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (101, 2, 'Master');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (101, 3, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-23.3275245, -86.693533, 'chemin Joly 25',
        'Mottiez (SG)', '9493', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Wicht', 'Marianne', 'smuriset@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 25, 'Autre',
        '+41 48 830 08 74', 20, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (102, 2, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (102, 3, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (8.377616, 138.352916, 'chemin de Carraux',
        'Mercier am See', '9244', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bouvier', 'Elisa', 'evade-dardel@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 56, 'Autre',
        '064 479 13 54', 18, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (103, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (103, 1, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-24.0829355, -8.646409, 'boulevard de Martin 4',
        'Dubey-sur-Alber', '8152', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Humbert', 'Fabienne', 'paulcosendey@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 59, 'Homme',
        '073 321 12 71', 3, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (104, 5, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (104, 2, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-18.334097, -23.220837, 'rue de Cornut 21',
        'Corbat', '6762', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Duvanel', 'Claudine', 'gabrieldroz@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 28, 'Homme',
        '+41 96 325 06 50', 28, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (105, 5, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (105, 4, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-22.090837, -123.942812, 'rue Bernasconi 62',
        'Aebi-près-Nüsslin', '2694', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Pasquier', 'Elodie', 'tinguelyjose@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 61, 'Autre',
        '020 280 99 15', 33, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (106, 1, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (106, 5, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (13.1088895, -5.747093, 'boulevard Gilbert Bujard 780',
        'Droz-la-Ville', '1451', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Pellet', 'Danielle', 'veronique97@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 43, 'Homme',
        '0901 512 272', 40, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (107, 3, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (107, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (82.399535, 138.47578, 'rue Nicolas Rappaz 51',
        'Delèze (GR)', '5485', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Godet', 'Laura', 'fpiccand@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 45, 'Homme',
        '+41 (0)85 773 87 82', 20, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (108, 1, 'Master');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (108, 2, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-5.158146, -71.32054, 'boulevard de Montandon 6',
        'UnterRobert', '5679', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Müller', 'Christine', 'claudemeyer@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 59, 'Autre',
        '088 298 97 75', 7, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (109, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (109, 5, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-15.8596785, 29.753791, 'avenue Brandt 83',
        'Vallélian-sur-Botteron', '7965', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Menthonnex', 'Gabriel', 'bgrand@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 36, 'Homme',
        '+41 45 454 90 02', 2, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (110, 2, 'Master');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (110, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (46.9751545, -10.439385, 'rue Théraulaz 41',
        'OberBovet', '6418', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Privet', 'Sara', 'robadeyrobert@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 58, 'Autre',
        '0878 218 424', 16, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (111, 1, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (111, 5, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-81.1466575, -147.251175, 'rue de Peitrequin 49',
        'Treboux (GR)', '4428', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Béguelin', 'Roland', 'jean94@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 37, 'Femme',
        '+41 (0)22 181 51 22', 28, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (112, 5, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (112, 1, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-24.277882, -131.461536, 'rue Balmat 63',
        'Bovet', '7316', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chatriand', 'Roger', 'theresejoly@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 18, 'Autre',
        '+41 (0)87 974 68 09', 9, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (113, 2, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (113, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-29.959895, 151.760524, 'chemin Bovet 63',
        'Musy', '4445', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Rappaz', 'Maria', 'zgeorges@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 55, 'Autre',
        '+41 (0)81 960 80 59', 40, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (114, 1, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (114, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (44.93881, -110.424102, 'rue Josiane Beuchat 29',
        'Saint Babey', '7204', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bernasconi', 'Antonio', 'berberatmarcel@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 54, 'Homme',
        '061 278 56 90', 39, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (115, 2, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (115, 3, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-46.101854, -47.264824, 'avenue Frédéric Droz 71',
        'Rapin', '8981', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bochud', 'Christine', 'viennenicolas@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 44, 'Homme',
        '+41 (0)95 211 21 82', 22, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (116, 5, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (116, 4, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (24.987672, 137.151979, 'rue de Bavaud 1',
        'Chenaux', '7650', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Treboux', 'Robert', 'zoejoly@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 58, 'Homme',
        '055 250 21 29', 16, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (117, 4, 'Master');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (117, 1, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (49.3874905, -151.015385, 'rue Vallélian',
        'Comment', '7936', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cossy', 'Noah', 'christiancomte@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 46, 'Homme',
        '+41 (0)54 215 58 54', 35, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (118, 2, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (118, 4, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (1.7249235, -107.446816, 'rue Emma Carraud 32',
        'Godet am Albis', '4302', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Marty', 'Michael', 'maxime82@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 30, 'Autre',
        '+41 91 699 60 64', 40, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (119, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (119, 5, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (35.6710155, -1.267545, 'chemin de Paccot 23',
        'Vuille am See', '1806', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cossy', 'Sarah', 'isabellefrancillon@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 44, 'Femme',
        '082 353 03 78', 23, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (120, 4, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (120, 3, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-55.0342215, 120.483325, 'avenue Jonathan Gubéran 79',
        'Rossellat', '9701', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Fonjallaz', 'Sara', 'trebouxpatricia@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 52, 'Femme',
        '+41 (0)89 732 50 85', 9, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (121, 2, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (121, 5, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-43.383069, 30.309445, 'boulevard de Francillon 1',
        'Gilliéron am Albis', '7616', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Joly', 'Fabienne', 'krosselet@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 32, 'Femme',
        '028 838 36 50', 37, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (122, 3, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (122, 5, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (20.5170735, -94.87307, 'boulevard Frédéric Badel 44',
        'Bonvini-près-Diesbach', '8165', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Mottet', 'Véronique', 'charles70@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 33, 'Autre',
        '091 218 69 57', 29, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (123, 5, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (123, 3, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (67.6989095, -178.211539, 'boulevard Fabienne Gillièron',
        'Pasquier-Dessus', '1741', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chevalley', 'Eliane', 'bernasconicharles@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 60, 'Autre',
        '072 308 34 42', 37, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (124, 1, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (124, 2, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (51.6002585, 140.494756, 'chemin Thomas Rapin 34',
        'Maire', '6299', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Uldry', 'Arthur', 'musymichael@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 63, 'Femme',
        '+41 (0)66 153 16 48', 26, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (125, 1, 'Master');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (125, 3, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-39.287818, -132.744347, 'rue Chopard 4',
        'Galland', '5307', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Boichat', 'Sandra', 'xpachoud@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 19, 'Autre',
        '0900 246 251', 2, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (126, 3, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (126, 4, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-83.2532635, 110.713947, 'chemin Vermeil',
        'Besançon', '6051', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Maire', 'Valérie', 'elisa85@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 22, 'Autre',
        '084 970 60 41', 2, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (127, 3, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (127, 4, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (4.611207, 31.028532, 'chemin Martin 38',
        'Pellet-près-Beurret', '2863', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Crivelli', 'Michael', 'tmonnet@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 56, 'Homme',
        '+41 (0)75 024 90 63', 17, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (128, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (128, 3, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (20.737829, -21.891949, 'rue de Julliard 76',
        'Duroux am Albis', '7389', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Marti', 'Pierre', 'robertelisa@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 22, 'Autre',
        '+41 (0)28 243 16 18', 2, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (129, 1, 'Master');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (129, 3, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (25.2507955, 0.681587, 'chemin de Wicht 7',
        'Francillon-des-Bois', '2029', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chopard', 'Noah', 'elodie62@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 31, 'Autre',
        '+41 (0)69 987 79 72', 30, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (130, 2, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (130, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-89.264115, 16.416034, 'chemin de Musy 88',
        'Robert (GR)', '3607', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Balmat', 'Georges', 'loicjomini@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 49, 'Femme',
        '075 629 72 92', 21, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (131, 4, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (131, 2, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (66.672241, -73.297531, 'chemin Cattin 56',
        'UnterJacot-Descombes', '9933', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cornut', 'Florian', 'luciewicht@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 50, 'Femme',
        '095 213 23 33', 20, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (132, 1, 'Master');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (132, 5, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (30.3701525, -62.047771, 'avenue de Bernasconi 40',
        'Balmat', '6250', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Menthonnex', 'Nolan', 'rene06@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 52, 'Homme',
        '0901 071 086', 26, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (133, 2, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (133, 5, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (67.850256, -172.961235, 'rue Crivelli 22',
        'Babey', '5221', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cornut', 'Luca', 'brandtjose@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 29, 'Homme',
        '+41 88 498 73 24', 35, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (134, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (134, 5, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-16.2065235, -71.384092, 'chemin Philippe Julliard',
        'Duroux', '1294', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Mayor', 'Elisa', 'zmartin@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 21, 'Autre',
        '045 975 80 27', 35, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (135, 4, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (135, 1, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-77.9308905, -30.602882, 'boulevard Monnard 6',
        'Masseron', '3884', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Carraud', 'Germaine', 'julie23@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 26, 'Homme',
        '+41 68 526 77 71', 11, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (136, 3, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (136, 4, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-51.309411, -10.803453, 'avenue Droz 43',
        'Monney', '7613', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Menthonnex', 'Albert', 'fredericchopard@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 39, 'Autre',
        '0906 462 425', 16, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (137, 5, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (137, 3, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-25.735005, -46.138074, 'rue Cattin 50',
        'Rosselat (SO)', '5376', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Beuchat', 'Liliane', 'brandtalain@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 40, 'Homme',
        '038 413 69 85', 1, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (138, 1, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (138, 3, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (87.5059205, 111.042027, 'chemin Eva Délèze 55',
        'Saudan-sur-Bahon', '4995', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Aeby', 'Roger', 'monique49@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 40, 'Homme',
        '0878 482 069', 28, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (139, 4, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (139, 5, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-11.7825245, 126.816732, 'rue de Paschoud 2',
        'Evéquoz-près-Nüsslin', '1206', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bonvin', 'José', 'nathaliebonvini@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 61, 'Autre',
        '066 046 94 92', 13, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (140, 2, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (140, 4, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-35.630295, 137.146739, 'rue Frédéric Boechat 85',
        'Bourquin', '4862', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Romanens', 'Nathalie', 'pasquieralain@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 41, 'Autre',
        '+41 66 225 12 18', 3, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (141, 4, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (141, 3, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-0.134253, 120.012622, 'chemin Rappaz 53',
        'Quartier-près-Beuret', '1132', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Beuchat', 'Sandrine', 'aurelie44@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 18, 'Femme',
        '0846 173 094', 27, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (142, 4, 'Master');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (142, 2, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-60.608868, 25.475633, 'avenue Charlotte Marti 32',
        'Gillièron-près-Chapuis', '6477', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Nüsslin', 'Sylvie', 'daniellepachoud@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 29, 'Autre',
        '+41 90 472 13 34', 10, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (143, 4, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (143, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-74.895733, 22.313709, 'boulevard Laura Coigny 98',
        'Boillat', '9258', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Humbert', 'Arthur', 'sararapraz@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 26, 'Autre',
        '059 787 63 63', 7, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (144, 4, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (144, 5, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-63.8506775, 23.361361, 'rue Raymond Babey 53',
        'Chopard-près-Polla', '5403', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Gilliéron', 'Gilbert', 'laurence55@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 33, 'Homme',
        '026 634 93 05', 17, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (145, 1, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (145, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-9.128025, -162.968651, 'chemin Elisa Boichat 6',
        'Treboux', '6312', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chenaux', 'Chantal', 'julie31@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 19, 'Homme',
        '0900 065 974', 30, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (146, 4, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (146, 1, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-46.934491, 119.742513, 'rue de Béguelin',
        'Aeby', '2157', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bujard', 'Léa', 'ucandaux@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 45, 'Femme',
        '+41 (0)45 613 98 84', 37, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (147, 3, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (147, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (64.8940055, 15.234374, 'boulevard de Marti',
        'Barman', '4099', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Broquet', 'Théo', 'tcousin@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 40, 'Homme',
        '072 860 89 14', 30, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (148, 3, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (148, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-2.4529705, 148.68522, 'rue Carron',
        'Saudan', '3944', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Menthonnex', 'Patricia', 'bcoigny@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 20, 'Autre',
        '+41 24 600 25 13', 2, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (149, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (149, 5, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-52.5627675, 92.342207, 'chemin Laetitia Aebi 144',
        'Pellet', '1019', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Marti', 'Lara', 'manuelcousin@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 60, 'Femme',
        '+41 (0)47 155 32 49', 35, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (150, 1, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (150, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-51.4258735, -10.746094, 'rue Cosendey 58',
        'Robert (GL)', '9345', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Maire', 'Elodie', 'alicevonlanthen@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 64, 'Homme',
        '089 357 52 47', 3, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (151, 2, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (151, 4, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-51.4545325, 90.240239, 'rue de Boillat 3',
        'Besançon am Rhein', '2040', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bochud', 'Roland', 'sandracrivelli@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 16, 'Femme',
        '+41 97 615 76 50', 0, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (152, 5, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (152, 1, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (50.77319, -112.25436, 'boulevard Deshusses 915',
        'Babey', '9542', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Humbert', 'Alicia', 'tde-dardel@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 41, 'Femme',
        '+41 (0)48 769 01 63', 28, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (153, 4, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (153, 1, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-54.355858, 61.93254, 'rue Godet 12',
        'Mercier am Albis', '3849', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Niquille', 'Suzanne', 'chapuisrene@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 51, 'Autre',
        '+41 (0)42 332 24 69', 15, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (154, 2, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (154, 1, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (60.008134, 137.283388, 'rue de Beurret 81',
        'Rey', '3392', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chaudet', 'Maurice', 'ochevalley@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 28, 'Autre',
        '+41 (0)41 448 17 08', 11, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (155, 3, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (155, 4, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (40.1145505, 178.135248, 'avenue Chevrolet 965',
        'Brahier', '9988', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Comte', 'Samuel', 'gabrielcornut@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 25, 'Homme',
        '034 161 83 80', 10, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (156, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (156, 3, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-73.5904965, -153.158988, 'boulevard Boillat 48',
        'Peitrequin am See', '4357', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chatriant', 'Kevin', 'sandrinepasquier@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 49, 'Autre',
        '+41 48 371 07 53', 30, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (157, 5, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (157, 3, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (31.6351665, 25.72844, 'chemin Barillon 91',
        'Barillon', '7536', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Vuille', 'Nicole', 'jonathan98@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 61, 'Femme',
        '062 080 22 82', 20, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (158, 3, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (158, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (55.1795585, 50.470711, 'rue de Bujard 1',
        'Vienne', '7253', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Droz', 'Manon', 'rossellatjessica@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 61, 'Homme',
        '+41 (0)72 471 28 44', 34, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (159, 2, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (159, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-20.7978535, 95.428857, 'avenue Daniel Besançon 64',
        'Treboux-des-Bois', '8990', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Besançon', 'Jean', 'albert14@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 32, 'Autre',
        '072 399 31 25', 29, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (160, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (160, 5, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (16.0552335, -162.043875, 'chemin de Meyer 666',
        'Duroux', '1828', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Rossellat', 'Madeleine', 'christophenuesslin@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 52, 'Femme',
        '033 664 41 09', 11, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (161, 5, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (161, 4, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (18.2604595, 32.578313, 'avenue Masseron',
        'Peitrequin', '9408', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Charpié', 'Denise', 'anamercier@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 58, 'Autre',
        '+41 79 235 07 85', 31, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (162, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (162, 3, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (58.09255, -59.215051, 'rue Laura Nüsslin 8',
        'Humbert (LU)', '1506', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Saudan', 'Yvette', 'arthurduroux@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 60, 'Homme',
        '036 597 30 84', 17, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (163, 1, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (163, 3, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (80.8600625, 156.111878, 'chemin Vonlanthen 552',
        'Cosandey-sur-Vallélian', '1385', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Rey', 'Roland', 'davidberberat@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 42, 'Femme',
        '066 776 47 75', 1, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (164, 2, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (164, 3, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-65.4469755, -1.491844, 'rue Thérèse Matile 56',
        'Cousin-sur-Bernasconi', '5545', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Masseron', 'Sara', 'rbujard@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 48, 'Autre',
        '+41 (0)90 449 26 07', 29, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (165, 2, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (165, 4, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (51.117747, 101.035574, 'chemin de Monnard 39',
        'Piccand-près-Barbey', '8928', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Broquet', 'Loïc', 'paccotsarah@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 16, 'Homme',
        '0878 895 594', 10, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (166, 5, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (166, 1, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-35.471782, 103.311574, 'rue de Sandoz 73',
        'San Meyer', '6758', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Nüsslin', 'Jean', 'louiscattin@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 56, 'Femme',
        '077 799 70 92', 6, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (167, 5, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (167, 1, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-80.9264515, 152.921261, 'chemin Julien Joly 14',
        'Polla', '7096', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Julliard', 'Aurélie', 'patriciathorens@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 63, 'Homme',
        '+41 (0)58 121 18 02', 12, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (168, 2, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (168, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (87.329833, 112.565393, 'avenue Valérie Berberat 15',
        'Babey', '7918', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chatriant', 'Sophie', 'nuesslinhenri@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 36, 'Homme',
        '+41 21 947 49 20', 15, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (169, 2, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (169, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-89.458486, -9.214631, 'rue Grand 20',
        'Vuille', '5033', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Grand', 'Lucie', 'chapuisvalerie@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 55, 'Femme',
        '057 476 01 44', 12, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (170, 4, 'Master');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (170, 3, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (52.02977, 14.529509, 'rue Paul Broquet 89',
        'Montandon (VS)', '2497', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Deladoëy', 'Zoé', 'stephanie95@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 35, 'Homme',
        '+41 (0)83 427 97 25', 22, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (171, 4, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (171, 1, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-27.003557, 144.278871, 'rue de Cornuz 52',
        'Rapin am See', '5442', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Pachoud', 'Antonio', 'umueller@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 65, 'Homme',
        '035 432 68 94', 39, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (172, 5, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (172, 1, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-65.1083465, 87.440745, 'boulevard Thorens',
        'Droz am Albis', '2520', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Badan', 'Pierre', 'samuelmorand@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 29, 'Homme',
        '+41 (0)81 354 52 57', 40, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (173, 3, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (173, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-19.060529, 158.565255, 'boulevard Aurélie Musy 58',
        'Francillon-sur-Vuille', '7978', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Conrad', 'Mathieu', 'zgeorges@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 38, 'Femme',
        '0906 514 444', 34, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (174, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (174, 3, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-65.041073, -72.543903, 'rue Christian Francillon 4',
        'Bovet', '4408', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bourquard', 'Jonathan', 'vonlanthenvalerie@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 53, 'Femme',
        '+41 26 588 58 40', 37, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (175, 5, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (175, 3, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-49.2957465, -105.275122, 'rue de Jomini 414',
        'Gilliéron', '7529', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Badel', 'Caroline', 'christophemontandon@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 31, 'Femme',
        '+41 25 099 52 88', 22, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (176, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (176, 4, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-78.6773745, 166.030556, 'avenue de Nüsslin 1',
        'Carraud', '1857', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Godet', 'Lara', 'thierry48@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 33, 'Homme',
        '093 928 37 82', 37, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (177, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (177, 1, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-18.4223, -163.419359, 'rue Coigny 33',
        'Bujard am See', '8965', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cosendey', 'Maxime', 'ubouvier@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 54, 'Homme',
        '0900 342 429', 24, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (178, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (178, 1, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (63.852774, 40.37767, 'rue Isabelle Bonvini 572',
        'Chenaux-près-Deladoëy', '2052', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Mottet', 'Frédéric', 'qboechat@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 36, 'Autre',
        '+41 (0)53 675 81 25', 23, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (179, 4, 'Master');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (179, 3, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-2.600175, -140.470173, 'avenue Nolan Robert 33',
        'UnterMasseron', '2187', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Barillon', 'Corinne', 'wichtlaetitia@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 25, 'Homme',
        '092 053 98 22', 18, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (180, 3, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (180, 4, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (72.42858, -76.234938, 'boulevard Olivier Tinguely 31',
        'Aeby', '2244', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Pellet', 'Jessica', 'sarasandoz@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 60, 'Femme',
        '039 738 77 37', 14, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (181, 2, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (181, 3, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (89.813005, 148.270542, 'boulevard Saudan 90',
        'Vuille-sur-Bahon', '2752', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chapuis', 'Madeleine', 'carraudsamuel@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 26, 'Autre',
        '+41 92 248 33 02', 17, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (182, 1, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (182, 3, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (83.906899, -48.44895, 'rue Ana Bonvin 45',
        'Musy', '2852', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Berberat', 'Anna', 'lara94@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 57, 'Femme',
        '+41 (0)55 840 85 54', 29, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (183, 2, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (183, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-47.071269, 137.049893, 'chemin Thorens 73',
        'San Cousin', '6281', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Uldry', 'Zoé', 'fredericevequoz@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 42, 'Autre',
        '0906 438 027', 11, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (184, 5, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (184, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-18.7082645, -172.519086, 'boulevard Cosendey 42',
        'OberChevalley', '6742', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Godet', 'Zoé', 'andremonney@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 17, 'Femme',
        '+41 69 719 81 33', 15, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (185, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (185, 4, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-22.714283, 138.504118, 'avenue Pasquier 5',
        'Meyer-des-Bois', '7566', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Crivelli', 'Sandrine', 'georgettebeguin@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 54, 'Autre',
        '+41 53 083 42 19', 26, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (186, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (186, 5, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (29.800705, -159.628057, 'avenue Chapuis 16',
        'Beguin', '3569', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Mercier', 'Mélanie', 'bgrand@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 36, 'Femme',
        '0901 027 212', 6, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (187, 1, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (187, 3, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (61.9953665, 107.85208, 'rue de Cornuz 348',
        'Droz', '5399', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Evéquoz', 'Charlotte', 'helene99@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 38, 'Femme',
        '092 930 46 97', 34, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (188, 3, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (188, 1, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-36.092908, 120.690341, 'chemin Bavaud 526',
        'Matile am Albis', '6864', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Beguin', 'Madeleine', 'camilledeshusses@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 43, 'Autre',
        '+41 54 098 26 92', 31, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (189, 5, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (189, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (23.9511385, 103.948848, 'rue de Matile 175',
        'Vuille-Dessous', '7130', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Crevoisier', 'Léo', 'patrick08@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 18, 'Femme',
        '+41 (0)69 502 74 92', 40, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (190, 2, 'Master');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (190, 4, 'CFC');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-89.362823, 17.338724, 'rue Corbat 470',
        'Rappaz (SH)', '1880', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chevrolet', 'Caroline', 'bernardgillieron@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 58, 'Femme',
        '0840 903 842', 29, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (191, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (191, 5, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-46.012836, -128.977624, 'chemin Badel',
        'Bernasconi', '4274', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Chatriand', 'Michel', 'ybeurret@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 17, 'Autre',
        '0901 303 802', 39, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (192, 2, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (192, 5, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (69.2718325, 23.691827, 'rue de Conrad',
        'Galland-près-Bouvier', '2247', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bugnon', 'Arthur', 'bchappuis@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 41, 'Femme',
        '0900 424 321', 21, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (193, 5, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (193, 1, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-13.540919, 176.123784, 'rue Mottet',
        'Diesbach-la-Ville', '1271', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Crevoisier', 'Philippe', 'jean-claudemasseron@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 17, 'Femme',
        '+41 64 675 02 17', 38, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (194, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (194, 2, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-38.569359, 88.08344, 'rue de Babey 74',
        'Gillièron', '9744', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Matile', 'André', 'chantalbeguin@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 53, 'Autre',
        '0840 097 964', 40, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (195, 1, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (195, 3, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-26.6058565, 140.668089, 'avenue de Bonvini 74',
        'Nüsslin-Dessus', '6865', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Müller', 'Théo', 'fcourvoisier@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 51, 'Femme',
        '+41 (0)58 067 36 58', 36, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (196, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (196, 1, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-25.1093675, -124.149394, 'boulevard Bugnon 416',
        'Paschoud', '8114', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cornuz', 'Paul', 'jonathanevequoz@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 27, 'Femme',
        '+41 (0)33 963 48 62', 33, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (197, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (197, 2, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (53.293989, -64.476239, 'chemin de Joly 78',
        'Jomini-sur-Martin', '6845', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Gillièron', 'François', 'kaeby@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 48, 'Autre',
        '+41 (0)38 180 75 51', 13, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (198, 5, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (198, 1, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (62.8238595, -69.732283, 'avenue Thorens 3',
        'Sansonnens-près-Cousin', '8888', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Paschoud', 'Alexandre', 'andrefrancillon@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 21, 'Femme',
        '+41 89 110 06 67', 35, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (199, 1, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (199, 2, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (21.573735, 117.729565, 'rue de Nusslé 7',
        'Humbert-sur-Cretton', '6322', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Muriset', 'Bernard', 'humbertlucie@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 43, 'Homme',
        '0878 315 228', 4, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (200, 4, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (200, 3, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-45.95478, 23.124574, 'boulevard Thierry Bourquard 20',
        'Peitrequin', '3597', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Piccand', 'Anna', 'christianpachoud@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 21, 'Femme',
        '058 696 98 87', 30, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (201, 3, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (201, 2, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-73.6289775, 50.575888, 'boulevard de Jomini 32',
        'Mercier-la-Ville', '5993', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cretton', 'Gérard', 'jose11@example.net');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 63, 'Homme',
        '0878 410 399', 22, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (202, 1, 'Maturité Gymnasiale');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (202, 2, 'Master');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-45.9955595, -22.52295, 'rue Stéphane Martin 85',
        'Muriset', '4679', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bochud', 'Corinne', 'theo22@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 61, 'Autre',
        '+41 (0)96 137 33 29', 11, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (203, 5, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (203, 4, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (31.3277435, 7.204051, 'rue Besse 70',
        'Rapin-Dessous', '7691', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Treboux', 'Véronique', 'gcorpataux@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 18, 'Femme',
        '099 356 33 72', 33, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (204, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (204, 4, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (74.8082215, 16.97203, 'boulevard Crevoisier 67',
        'Berberat-les-Bains', '2428', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Polla', 'Lara', 'zoeromanens@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 65, 'Homme',
        '+41 (0)90 354 13 97', 4, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (205, 2, 'Aucun');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (205, 1, 'Doctorat');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (24.676317, -53.042742, 'rue Christian Menthonnex',
        'Muriset (ZH)', '2404', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Beguin', 'Robert', 'rolandgillieron@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 35, 'Homme',
        '+41 (0)95 553 52 38', 4, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (206, 3, 'Master');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (206, 4, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-58.561172, -3.157578, 'chemin Müller 392',
        'Badel-près-Broquet', '6690', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Dubey', 'Nelly', 'matilecharlotte@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 35, 'Autre',
        '+41 38 796 50 76', 8, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (207, 2, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (207, 5, 'Maturité Gymnasiale');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-14.41608, 130.283653, 'rue Treboux',
        'Bonvini', '2985', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Bouvier', 'Fabienne', 'ddiesbach@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 53, 'Femme',
        '+41 (0)80 071 31 45', 1, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (208, 5, 'Doctorat');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (208, 4, 'Aucun');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-86.849281, -57.832827, 'rue de Galland 427',
        'Duvanel am Albis', '5681', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Besançon', 'Sara', 'anna48@example.org');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 45, 'Femme',
        '+41 25 051 97 97', 31, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (209, 4, 'CFC');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (209, 2, 'Bachelor');
COMMIT;

-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-18.068404, 69.639899, 'rue de Comte 56',
        'Pellet', '2121', 'Suisse');
INSERT INTO Personne (nom, prenom, email)
VALUES ('Cosandey', 'Ethan', 'jmercier@example.com');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), 23, 'Femme',
        '027 388 83 53', 22, (SELECT MAX(id) FROM Adresse));
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (210, 3, 'Bachelor');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES (210, 5, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (30.8373255, -175.225872, 'boulevard Duroux 594',
        'Beuret', '7854', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'La liberté de louer autrement', 'Technicien-dentiste CFC',
        6, '2025-01-10', NULL);
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (1, 5, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (12.532312, -42.520248, 'avenue de Cattin',
        'Piccand-Dessus', '1908', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir de louer sans soucis', 'Gérant d''immeubles avec brevet fédéral',
        0, '2025-03-12', '2025-07-04');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (2, 2, 'Aucun');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-34.6870115, 140.73315, 'boulevard Liliane Duroux 89',
        'Pasquier', '3007', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''assurance d''évoluer de manière efficace', 'Maréchal-forgeron, maître',
        4, '2025-01-23', '2025-10-24');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (3, 2, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-5.172715, 174.831185, 'boulevard Odette Cornuz',
        'OberBesançon', '6006', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir d''avancer de manière efficace', 'Informaticien CFC',
        6, '2025-03-01', '2025-12-25');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (4, 2, 'Bachelor');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-77.2562635, 5.805836, 'rue de Bovet 79',
        'Pachoud (AG)', '3651', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le confort d''innover de manière sûre', 'Conseiller en énergie et en efficacité énergétique avec diplôme fédéral',
        7, '2025-02-21', NULL);
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (5, 2, 'Maturité Gymnasiale');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (46.2300825, -17.901329, 'rue Stéphanie Joly 10',
        'Bonvini', '1750', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir d''avancer en toute tranquilité', 'Praticien en denrées alimentaires AFP',
        9, '2025-03-03', '2025-07-19');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (6, 2, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (64.9326695, 129.846045, 'avenue de Piccand 4',
        'San Chapuis', '2876', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'La possibilité d''évoluer à l''état pur', 'dipl. Network Engineer NDS HF',
        8, '2025-05-03', NULL);
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (7, 1, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (39.90113, -32.507429, 'chemin Menthonnex 53',
        'Robert-la-Ville', '4949', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le droit de concrétiser vos projets autrement', 'Aide en informatique AFP',
        8, '2025-03-10', NULL);
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (8, 4, 'Bachelor');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (66.9656325, 97.076174, 'chemin Mercier 81',
        'Badel-près-Joye', '5459', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''assurance de louer avant-tout', 'Maître tableaux électriques et automation',
        0, '2025-05-15', NULL);
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (9, 1, 'Doctorat');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-43.193529, -67.213156, 'boulevard de Saudan',
        'Bonvini', '1953', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'La liberté d''atteindre vos buts de manière efficace', 'dipl. Online-Marketingmanager NDS HF',
        1, '2025-03-16', NULL);
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (10, 4, 'Bachelor');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (21.991623, 69.515843, 'rue de Bouvier',
        'Deladoëy am Albis', '2281', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''avantage de changer plus rapidement', 'Spécialiste du domain équin avec brevet fédéral',
        7, '2025-04-21', '2025-11-20');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (11, 5, 'CFC');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (80.3673415, 47.859807, 'avenue de Rosselat 97',
        'Duvanel-près-Broquet', '1052', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le confort de rouler à sa source', 'Peintre en bâtiments',
        4, '2025-02-02', '2025-04-12');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (12, 4, 'Doctorat');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-43.0243335, 61.305832, 'avenue de Aebi 67',
        'Aeby-près-Chaudet', '4950', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''assurance de louer autrement', 'Carrossier, maître',
        5, '2025-01-19', '2025-05-09');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (13, 2, 'CFC');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (62.262931, 170.880878, 'rue Monique Vienne 4',
        'Beurret', '2485', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''avantage de rouler autrement', 'Vannier créateur CFC',
        5, '2025-01-03', '2025-12-17');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (14, 4, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-1.663705, -29.139544, 'rue Rapraz',
        'Brahier-la-Ville', '3562', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le pouvoir de louer de manière sûre', 'Esthéticien diplômé',
        9, '2025-01-19', NULL);
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (15, 4, 'Doctorat');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-7.2345615, -35.031104, 'chemin Robert 9',
        'Sainte Musy', '3806', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''art de louer plus facilement', 'Responsable de ménage agricole avec brevet fédéral',
        4, '2025-03-29', NULL);
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (16, 5, 'Doctorat');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-58.6099965, 128.498527, 'rue Eric Bourquard 15',
        'Treboux', '4124', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''art d''avancer en toute tranquilité', 'Maître aviculteur',
        7, '2025-03-07', NULL);
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (17, 5, 'CFC');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-42.674754, 36.5533, 'avenue Fonjallaz 75',
        'Peitrequin am Rhein', '2785', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le pouvoir d''innover plus rapidement', 'Calorifugeur-tôlier CFC',
        1, '2025-04-03', NULL);
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (18, 5, 'Doctorat');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (52.8571865, -93.033987, 'rue Arthur Barman 4',
        'Duroux (ZG)', '9637', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le confort de rouler avant-tout', 'dipl. in Leadership und Management NDS HF',
        9, '2025-04-13', NULL);
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (19, 2, 'CFC');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (47.028165, -2.828899, 'rue de Rapraz 9',
        'Balmat', '4147', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le confort de changer autrement', 'Spécialiste en assurance-maladie avec brevet fédéral',
        0, '2025-02-27', NULL);
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (20, 4, 'CFC');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-12.2072165, 38.589, 'rue Isabelle Beurret 7',
        'Bovet (AG)', '6381', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir d''innover à la pointe', 'Monteur frigoriste CFC',
        0, '2025-06-15', NULL);
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (21, 5, 'Aucun');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (87.6069595, -165.761854, 'rue Michael Thorens 429',
        'UnterChapuis', '8246', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir d''innover en toute tranquilité', 'Agent professionnel de protection de personnes et de biens avec brevet fédéral',
        2, '2025-05-11', '2025-06-17');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (22, 3, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-63.0598855, -139.788689, 'chemin Elodie Brahier 9',
        'Godet-près-Mercier', '9566', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le confort d''avancer en toute tranquilité', 'Enquêteur de douane avec diplôme fédéral',
        9, '2025-01-31', '2025-07-28');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (23, 1, 'CFC');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-36.116505, 120.516996, 'boulevard Odette Musy',
        'Vuille-près-Monney', '7400', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''assurance d''évoluer de manière efficace', 'Sommelier avec brevet fédéral',
        3, '2025-03-21', '2025-12-22');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (24, 2, 'Bachelor');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (61.015577, -16.434091, 'rue Robert 71',
        'Meyer-sur-Gilliéron', '2512', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir de rouler naturellement', 'Spécialiste en hôtellerie CFC',
        8, '2025-04-22', '2026-04-04');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (25, 2, 'CFC');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-36.621698, 135.988524, 'boulevard Aebi 82',
        'Pasquier', '4178', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'La possibilité de concrétiser vos projets en toute tranquilité', 'Garnisseur de meubles industriels, maître',
        8, '2025-05-18', '2025-08-19');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (26, 4, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-80.646652, 147.04015, 'boulevard de de Dardel 22',
        'Saint Jacot-Descombes', '3583', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le confort d''innover de manière efficace', 'Contact Center Supervisor avec brevet fédéral',
        2, '2025-06-11', '2026-01-02');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (27, 5, 'Doctorat');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-40.5026815, 6.984, 'boulevard de Cornut 57',
        'Menthonnex-sur-Cosendey', '1006', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''assurance d''atteindre vos buts autrement', 'Aviculteur CFC (Champ professionnel de l''agriculture)',
        2, '2025-06-20', '2026-02-14');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (28, 1, 'Aucun');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-57.8296265, -122.554178, 'boulevard Paccot 59',
        'Jomini', '9431', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''assurance de changer à sa source', 'dipl. Online-Marketingmanager NDS HF',
        2, '2025-03-24', '2026-03-03');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (29, 4, 'CFC');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-23.44142, -119.231456, 'rue Rey 4',
        'Courvoisier', '7329', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le pouvoir de rouler de manière sûre', 'Constructeur de fondations CFC (champ professionnel Construction de voies de communication)',
        0, '2025-06-14', NULL);
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (30, 2, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-53.2141935, 127.712845, 'avenue Gabriel Duroux 26',
        'Vermeil-près-Balmat', '6934', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''avantage de concrétiser vos projets à sa source', 'Chef d''exploitation viticole avec brevet fédéral',
        8, '2025-03-09', '2026-01-17');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (31, 5, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (11.27581, 155.32395, 'rue Mélanie Badel 11',
        'Piccand (GL)', '6362', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir de concrétiser vos projets plus facilement', 'Chef carreleur avec brevet fédéral',
        5, '2025-02-08', NULL);
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (32, 2, 'Doctorat');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-75.321315, -110.050451, 'rue Laurent Monnet 877',
        'Romanens', '2608', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'La liberté de concrétiser vos projets plus facilement', 'agrotechnicien diplômé ES',
        1, '2025-01-10', '2026-01-04');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (33, 5, 'Maturité Gymnasiale');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-38.240753, 86.151338, 'chemin Boichat',
        'Monney', '9899', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'La possibilité d''innover à sa source', 'Coiffeur avec diplôme fédéral',
        10, '2025-03-16', '2025-12-31');
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (34, 3, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (12.078744, 50.391139, 'avenue de Rosselat 43',
        'Sainte Marty', '9514', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''assurance de louer plus rapidement', 'Opticien CFC',
        10, '2025-04-19', '2026-02-13');
INSERT INTO Domaine (id, nom) VALUES (2, 'Finance') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (35, 2, 'Maturité Gymnasiale');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-51.3863875, 97.71213, 'chemin de Blanc 40',
        'Mayor', '9230', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''assurance d''avancer avant-tout', 'Agent professionnel de sécurité et de surveillance avec brevet fédéral',
        3, '2025-04-02', NULL);
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (36, 4, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-61.069826, 30.549222, 'chemin de Bourquard',
        'Mercier am Albis', '7380', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le confort d''atteindre vos buts à la pointe', 'Nettoyeur chimique diplômé',
        3, '2025-05-03', NULL);
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (37, 1, 'Doctorat');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (60.3327675, -153.694029, 'avenue Georges Rappaz',
        'Berberat', '5527', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir d''avancer à l''état pur', 'dipl. Kommunikationstrainer NDS HF',
        6, '2025-01-29', NULL);
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (38, 5, 'CFC');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (41.583582, -120.481799, 'boulevard de Polla 4',
        'Peitrequin-les-Bains', '2574', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le droit d''avancer à la pointe', 'agrocommerçant diplômé ES',
        10, '2025-04-30', '2025-09-09');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (39, 4, 'CFC');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-89.6111705, -118.208311, 'avenue Gillièron 31',
        'Wicht-les-Bains', '6053', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''avantage d''innover à l''état pur', 'Sculpteur sur pierre CFC (Champ professionnel travail de la pierre)',
        2, '2025-01-04', NULL);
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (40, 4, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-20.78762, -160.211872, 'chemin Chappuis 6',
        'Evéquoz-sur-Corboz', '1383', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''art d''évoluer naturellement', 'Peintre en décors de théâtre',
        1, '2025-05-06', '2026-02-07');
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (41, 4, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (41.4718205, 134.795002, 'chemin de Chatriand 779',
        'Bochud-près-Comte', '9077', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''art d''atteindre vos buts naturellement', 'dipl. in Unternehmens- und Mitarbeiterführung NDS HF',
        5, '2025-04-21', NULL);
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (42, 1, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-51.2654185, -46.249558, 'avenue Roger Boillat 9',
        'Bugnon', '9829', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''assurance d''atteindre vos buts de manière efficace', 'Agent de transport et logistique avec brevet fédéral',
        9, '2025-01-16', '2025-08-06');
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (43, 5, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (28.2082665, 52.97061, 'rue Chappuis 71',
        'Cossy', '9567', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'La liberté de concrétiser vos projets de manière efficace', 'Spécialiste des branches de la boulangerie-pâtisserie-confiserie avec brevet fédéral',
        3, '2025-05-09', '2025-08-10');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (44, 1, 'Bachelor');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (49.0978825, 116.04803, 'chemin Clara Humbert 819',
        'Saint Masseron', '3742', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir de louer à sa source', 'Monteur frigoriste CFC',
        6, '2025-03-01', NULL);
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (45, 3, 'Bachelor');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-48.844878, 22.945744, 'rue Chenaux 10',
        'Uldry-la-Ville', '5112', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'La liberté d''atteindre vos buts sans soucis', 'Aide-polybâtisseur AFP',
        4, '2025-03-15', NULL);
INSERT INTO Domaine (id, nom) VALUES (4, 'Santé') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (46, 4, 'Maturité Gymnasiale');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-75.6354905, -127.381598, 'boulevard Alain Mercier 996',
        'Bourquin', '7034', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir de louer plus rapidement', 'Spécialiste des branches de la boulangerie-pâtisserie-confiserie avec brevet fédéral',
        1, '2025-06-27', NULL);
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (47, 1, 'Bachelor');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-69.563559, -36.147502, 'avenue Alber',
        'Aeby-sur-Grojean', '9644', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le plaisir d''innover à l''état pur', 'Fashion spécialiste avec brevet fédéral',
        6, '2025-04-09', NULL);
INSERT INTO Domaine (id, nom) VALUES (3, 'Marketing') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (48, 3, 'Maturité Gymnasiale');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-8.1452585, -77.366411, 'avenue de Nusslé 37',
        'Niquille-sur-Jacot-Guillarmod', '2522', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'Le confort de concrétiser vos projets autrement', 'Chef de production technique des matières synthétiques diplômé',
        7, '2025-04-03', NULL);
INSERT INTO Domaine (id, nom) VALUES (5, 'Enseignement') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (49, 5, 'Master');
COMMIT;

-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES (-63.0077555, -21.260304, 'rue de Sansonnens 56',
        'Mercier', '8152', 'Suisse');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), 'L''assurance de changer de manière efficace', 'Constructeur d’appareils industriels CFC',
        5, '2025-02-08', '2025-12-07');
INSERT INTO Domaine (id, nom) VALUES (1, 'Developpement informatique') ON CONFLICT (nom) DO NOTHING;
INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES (50, 1, 'CFC');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (11, 37,
        '2025-05-31', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (11, 5,
        '2025-04-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (11, 32,
        '2025-04-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (11, 40,
        '2025-02-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (11, 15,
        '2025-03-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (12, 36,
        '2025-05-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (12, 6,
        '2025-06-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (12, 42,
        '2025-06-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (12, 12,
        '2025-03-01', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (12, 22,
        '2025-05-26', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (13, 32,
        '2025-02-13', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (13, 26,
        '2025-07-31', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (13, 18,
        '2025-04-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (13, 30,
        '2025-06-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (13, 25,
        '2025-05-29', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (14, 45,
        '2025-03-27', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (14, 47,
        '2025-07-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (14, 21,
        '2025-08-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (14, 2,
        '2025-05-10', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (14, 5,
        '2025-02-28', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (15, 40,
        '2025-01-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (15, 34,
        '2025-10-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (15, 5,
        '2025-03-13', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (15, 17,
        '2025-05-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (15, 41,
        '2025-09-20', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (16, 46,
        '2025-04-13', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (16, 21,
        '2025-07-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (16, 11,
        '2025-11-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (16, 30,
        '2025-07-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (16, 28,
        '2025-08-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (17, 37,
        '2025-05-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (17, 28,
        '2025-09-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (17, 21,
        '2025-08-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (17, 18,
        '2025-05-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (17, 10,
        '2025-05-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (18, 29,
        '2025-08-20', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (18, 22,
        '2025-05-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (18, 34,
        '2025-10-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (18, 49,
        '2025-05-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (18, 9,
        '2025-07-05', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (19, 6,
        '2025-03-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (19, 41,
        '2025-11-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (19, 25,
        '2025-12-31', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (19, 42,
        '2025-05-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (19, 21,
        '2025-06-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (20, 34,
        '2025-11-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (20, 50,
        '2025-09-18', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (20, 49,
        '2025-04-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (20, 20,
        '2025-03-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (20, 13,
        '2025-04-28', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (21, 2,
        '2025-05-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (21, 3,
        '2025-02-01', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (21, 31,
        '2025-07-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (21, 47,
        '2025-07-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (21, 22,
        '2025-06-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (22, 47,
        '2025-08-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (22, 44,
        '2025-05-28', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (22, 34,
        '2025-08-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (22, 29,
        '2026-01-11', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (22, 46,
        '2025-05-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (23, 10,
        '2025-03-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (23, 39,
        '2025-05-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (23, 24,
        '2025-08-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (23, 1,
        '2025-01-26', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (23, 15,
        '2025-02-21', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (24, 12,
        '2025-02-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (24, 10,
        '2025-03-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (24, 26,
        '2025-06-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (24, 11,
        '2025-07-31', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (24, 13,
        '2025-05-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (25, 10,
        '2025-04-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (25, 11,
        '2025-11-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (25, 25,
        '2025-10-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (25, 7,
        '2025-06-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (25, 12,
        '2025-02-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (26, 27,
        '2025-11-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (26, 16,
        '2025-05-27', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (26, 49,
        '2025-04-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (26, 14,
        '2025-07-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (26, 40,
        '2025-02-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (27, 29,
        '2026-01-27', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (27, 25,
        '2025-06-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (27, 30,
        '2025-07-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (27, 6,
        '2025-05-13', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (27, 36,
        '2025-04-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (28, 43,
        '2025-05-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (28, 7,
        '2025-05-13', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (28, 28,
        '2025-09-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (28, 10,
        '2025-04-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (28, 31,
        '2025-08-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (29, 21,
        '2025-07-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (29, 42,
        '2025-04-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (29, 30,
        '2025-06-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (29, 46,
        '2025-03-21', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (29, 10,
        '2025-03-31', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (30, 16,
        '2025-04-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (30, 41,
        '2025-09-24', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (30, 2,
        '2025-05-18', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (30, 20,
        '2025-04-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (30, 38,
        '2025-03-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (31, 23,
        '2025-05-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (31, 6,
        '2025-06-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (31, 2,
        '2025-06-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (31, 30,
        '2025-08-07', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (31, 28,
        '2026-01-23', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (32, 42,
        '2025-06-06', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (32, 46,
        '2025-04-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (32, 7,
        '2025-05-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (32, 6,
        '2025-06-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (32, 37,
        '2025-06-29', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (33, 14,
        '2025-04-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (33, 15,
        '2025-02-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (33, 13,
        '2025-03-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (33, 12,
        '2025-04-01', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (33, 33,
        '2025-04-16', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (34, 46,
        '2025-04-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (34, 20,
        '2025-04-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (34, 42,
        '2025-06-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (34, 39,
        '2025-05-06', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (34, 3,
        '2025-04-27', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (35, 43,
        '2025-05-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (35, 25,
        '2026-03-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (35, 37,
        '2025-05-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (35, 2,
        '2025-06-29', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (35, 27,
        '2025-08-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (36, 33,
        '2025-10-21', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (36, 38,
        '2025-02-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (36, 48,
        '2025-05-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (36, 34,
        '2025-06-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (36, 25,
        '2025-09-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (37, 43,
        '2025-02-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (37, 49,
        '2025-05-23', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (37, 37,
        '2025-05-25', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (37, 27,
        '2025-10-27', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (37, 11,
        '2025-04-26', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (38, 18,
        '2025-04-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (38, 45,
        '2025-03-25', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (38, 40,
        '2025-02-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (38, 8,
        '2025-04-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (38, 49,
        '2025-05-29', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (39, 13,
        '2025-02-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (39, 9,
        '2025-05-16', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (39, 8,
        '2025-03-16', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (39, 39,
        '2025-08-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (39, 20,
        '2025-04-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (40, 49,
        '2025-05-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (40, 3,
        '2025-10-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (40, 29,
        '2025-03-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (40, 50,
        '2025-09-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (40, 35,
        '2025-08-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (41, 3,
        '2025-03-31', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (41, 41,
        '2025-06-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (41, 45,
        '2025-04-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (41, 30,
        '2025-08-04', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (41, 11,
        '2025-07-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (42, 29,
        '2025-07-07', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (42, 44,
        '2025-07-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (42, 41,
        '2025-06-25', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (42, 33,
        '2025-05-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (42, 27,
        '2025-12-31', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (43, 25,
        '2025-12-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (43, 12,
        '2025-02-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (43, 39,
        '2025-08-29', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (43, 50,
        '2025-07-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (43, 19,
        '2025-05-27', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (44, 34,
        '2025-06-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (44, 41,
        '2025-06-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (44, 10,
        '2025-04-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (44, 37,
        '2025-05-25', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (44, 46,
        '2025-05-03', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (45, 12,
        '2025-04-04', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (45, 46,
        '2025-05-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (45, 1,
        '2025-02-27', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (45, 28,
        '2025-11-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (45, 32,
        '2025-03-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (46, 50,
        '2025-04-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (46, 41,
        '2026-01-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (46, 31,
        '2025-05-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (46, 28,
        '2026-01-23', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (46, 3,
        '2025-07-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (47, 5,
        '2025-03-10', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (47, 32,
        '2025-03-03', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (47, 37,
        '2025-07-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (47, 7,
        '2025-06-12', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (47, 48,
        '2025-05-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (48, 27,
        '2025-12-27', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (48, 48,
        '2025-05-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (48, 11,
        '2025-10-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (48, 41,
        '2025-11-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (48, 35,
        '2025-08-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (49, 42,
        '2025-05-04', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (49, 24,
        '2025-11-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (49, 27,
        '2026-01-01', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (49, 5,
        '2025-02-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (49, 12,
        '2025-03-13', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (50, 41,
        '2025-10-29', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (50, 1,
        '2025-01-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (50, 5,
        '2025-03-01', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (50, 17,
        '2025-05-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (50, 31,
        '2025-12-03', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (51, 7,
        '2025-06-06', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (51, 17,
        '2025-05-05', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (51, 25,
        '2025-07-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (51, 31,
        '2025-10-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (51, 38,
        '2025-02-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (52, 39,
        '2025-06-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (52, 14,
        '2025-01-25', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (52, 23,
        '2025-03-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (52, 17,
        '2025-04-24', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (52, 41,
        '2025-12-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (53, 6,
        '2025-04-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (53, 3,
        '2025-06-08', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (53, 44,
        '2025-06-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (53, 24,
        '2025-04-13', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (53, 15,
        '2025-01-29', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (54, 27,
        '2025-08-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (54, 3,
        '2025-08-07', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (54, 5,
        '2025-03-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (54, 46,
        '2025-05-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (54, 6,
        '2025-03-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (55, 48,
        '2025-05-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (55, 10,
        '2025-04-05', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (55, 38,
        '2025-02-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (55, 28,
        '2025-11-11', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (55, 30,
        '2025-06-25', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (56, 17,
        '2025-03-25', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (56, 3,
        '2025-06-27', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (56, 4,
        '2025-07-03', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (56, 28,
        '2025-10-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (56, 48,
        '2025-05-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (57, 26,
        '2025-07-04', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (57, 22,
        '2025-06-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (57, 41,
        '2025-05-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (57, 34,
        '2025-11-25', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (57, 21,
        '2025-08-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (58, 22,
        '2025-05-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (58, 11,
        '2025-10-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (58, 45,
        '2025-03-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (58, 21,
        '2025-07-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (58, 12,
        '2025-04-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (59, 44,
        '2025-05-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (59, 31,
        '2025-06-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (59, 14,
        '2025-11-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (59, 13,
        '2025-01-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (59, 33,
        '2025-10-03', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (60, 17,
        '2025-05-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (60, 9,
        '2025-07-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (60, 27,
        '2025-08-01', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (60, 47,
        '2025-07-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (60, 43,
        '2025-06-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (61, 36,
        '2025-04-04', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (61, 24,
        '2025-09-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (61, 12,
        '2025-03-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (61, 44,
        '2025-07-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (61, 5,
        '2025-03-07', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (62, 17,
        '2025-03-25', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (62, 27,
        '2025-08-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (62, 11,
        '2025-04-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (62, 21,
        '2025-08-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (62, 13,
        '2025-03-29', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (63, 14,
        '2025-03-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (63, 21,
        '2025-07-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (63, 18,
        '2025-05-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (63, 47,
        '2025-08-25', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (63, 16,
        '2025-05-02', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (64, 48,
        '2025-04-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (64, 24,
        '2025-08-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (64, 17,
        '2025-04-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (64, 37,
        '2025-05-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (64, 11,
        '2025-10-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (65, 6,
        '2025-07-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (65, 40,
        '2025-02-10', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (65, 19,
        '2025-05-01', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (65, 27,
        '2025-10-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (65, 18,
        '2025-05-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (66, 21,
        '2025-08-06', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (66, 28,
        '2025-10-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (66, 36,
        '2025-04-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (66, 50,
        '2025-06-23', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (66, 13,
        '2025-03-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (67, 29,
        '2025-11-12', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (67, 1,
        '2025-03-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (67, 5,
        '2025-03-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (67, 28,
        '2026-01-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (67, 36,
        '2025-05-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (68, 33,
        '2025-07-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (68, 1,
        '2025-02-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (68, 40,
        '2025-02-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (68, 12,
        '2025-02-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (68, 17,
        '2025-04-26', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (69, 40,
        '2025-02-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (69, 48,
        '2025-05-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (69, 2,
        '2025-04-26', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (69, 25,
        '2025-12-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (69, 44,
        '2025-06-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (70, 41,
        '2025-05-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (70, 4,
        '2025-03-31', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (70, 26,
        '2025-07-13', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (70, 42,
        '2025-05-20', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (70, 3,
        '2025-02-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (71, 13,
        '2025-04-21', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (71, 6,
        '2025-05-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (71, 40,
        '2025-01-25', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (71, 3,
        '2025-04-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (71, 45,
        '2025-03-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (72, 45,
        '2025-04-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (72, 44,
        '2025-06-27', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (72, 7,
        '2025-06-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (72, 39,
        '2025-06-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (72, 48,
        '2025-05-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (73, 16,
        '2025-05-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (73, 38,
        '2025-03-05', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (73, 23,
        '2025-02-27', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (73, 28,
        '2025-09-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (73, 1,
        '2025-02-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (74, 30,
        '2025-07-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (74, 22,
        '2025-06-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (74, 28,
        '2025-12-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (74, 12,
        '2025-03-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (74, 17,
        '2025-04-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (75, 8,
        '2025-03-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (75, 39,
        '2025-06-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (75, 40,
        '2025-03-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (75, 43,
        '2025-03-25', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (75, 31,
        '2025-07-24', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (76, 6,
        '2025-03-24', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (76, 2,
        '2025-03-13', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (76, 44,
        '2025-06-27', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (76, 9,
        '2025-05-27', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (76, 3,
        '2025-08-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (77, 11,
        '2025-04-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (77, 13,
        '2025-04-01', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (77, 38,
        '2025-02-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (77, 40,
        '2025-03-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (77, 35,
        '2025-10-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (78, 48,
        '2025-06-07', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (78, 20,
        '2025-03-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (78, 27,
        '2025-06-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (78, 22,
        '2025-05-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (78, 40,
        '2025-01-16', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (79, 40,
        '2025-01-05', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (79, 33,
        '2025-09-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (79, 2,
        '2025-06-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (79, 18,
        '2025-04-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (79, 8,
        '2025-04-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (80, 24,
        '2025-09-13', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (80, 20,
        '2025-04-26', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (80, 19,
        '2025-04-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (80, 31,
        '2025-10-02', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (80, 33,
        '2025-06-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (81, 9,
        '2025-06-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (81, 5,
        '2025-04-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (81, 28,
        '2025-12-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (81, 16,
        '2025-05-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (81, 1,
        '2025-01-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (82, 29,
        '2025-12-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (82, 15,
        '2025-01-27', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (82, 1,
        '2025-01-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (82, 21,
        '2025-06-27', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (82, 35,
        '2025-04-29', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (83, 6,
        '2025-05-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (83, 8,
        '2025-04-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (83, 3,
        '2025-09-06', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (83, 50,
        '2025-11-16', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (83, 2,
        '2025-06-23', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (84, 3,
        '2025-02-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (84, 21,
        '2025-07-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (84, 44,
        '2025-05-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (84, 46,
        '2025-04-03', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (84, 14,
        '2025-04-06', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (85, 9,
        '2025-06-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (85, 28,
        '2026-01-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (85, 38,
        '2025-01-31', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (85, 48,
        '2025-05-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (85, 14,
        '2025-10-24', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (86, 28,
        '2025-08-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (86, 47,
        '2025-08-18', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (86, 48,
        '2025-05-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (86, 6,
        '2025-03-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (86, 17,
        '2025-04-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (87, 5,
        '2025-03-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (87, 45,
        '2025-04-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (87, 27,
        '2025-08-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (87, 11,
        '2025-10-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (87, 2,
        '2025-06-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (88, 18,
        '2025-05-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (88, 29,
        '2025-07-13', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (88, 34,
        '2025-12-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (88, 12,
        '2025-04-07', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (88, 26,
        '2025-06-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (89, 40,
        '2025-01-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (89, 2,
        '2025-06-06', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (89, 35,
        '2025-11-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (89, 30,
        '2025-07-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (89, 6,
        '2025-04-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (90, 25,
        '2026-01-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (90, 12,
        '2025-02-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (90, 21,
        '2025-06-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (90, 34,
        '2025-05-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (90, 27,
        '2025-08-01', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (91, 8,
        '2025-03-26', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (91, 19,
        '2025-06-12', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (91, 12,
        '2025-03-04', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (91, 15,
        '2025-02-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (91, 36,
        '2025-04-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (92, 37,
        '2025-06-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (92, 1,
        '2025-02-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (92, 15,
        '2025-02-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (92, 28,
        '2025-07-20', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (92, 24,
        '2025-12-20', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (93, 46,
        '2025-04-26', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (93, 12,
        '2025-04-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (93, 17,
        '2025-04-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (93, 34,
        '2025-05-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (93, 32,
        '2025-03-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (94, 43,
        '2025-02-13', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (94, 40,
        '2025-01-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (94, 22,
        '2025-05-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (94, 6,
        '2025-03-06', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (94, 30,
        '2025-06-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (95, 33,
        '2025-05-04', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (95, 29,
        '2025-06-08', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (95, 18,
        '2025-04-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (95, 16,
        '2025-04-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (95, 41,
        '2025-10-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (96, 4,
        '2025-03-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (96, 49,
        '2025-04-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (96, 1,
        '2025-01-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (96, 28,
        '2025-07-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (96, 30,
        '2025-08-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (97, 23,
        '2025-04-29', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (97, 47,
        '2025-08-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (97, 16,
        '2025-05-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (97, 21,
        '2025-07-16', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (97, 2,
        '2025-04-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (98, 36,
        '2025-05-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (98, 1,
        '2025-02-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (98, 42,
        '2025-05-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (98, 17,
        '2025-04-03', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (98, 2,
        '2025-05-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (99, 1,
        '2025-03-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (99, 38,
        '2025-02-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (99, 22,
        '2025-06-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (99, 50,
        '2025-10-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (99, 37,
        '2025-06-05', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (100, 40,
        '2025-01-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (100, 35,
        '2025-05-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (100, 31,
        '2025-05-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (100, 16,
        '2025-05-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (100, 45,
        '2025-03-26', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (101, 8,
        '2025-03-27', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (101, 44,
        '2025-05-31', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (101, 49,
        '2025-04-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (101, 29,
        '2025-08-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (101, 4,
        '2025-11-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (102, 22,
        '2025-06-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (102, 14,
        '2025-08-05', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (102, 30,
        '2025-07-04', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (102, 44,
        '2025-06-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (102, 3,
        '2025-01-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (103, 18,
        '2025-05-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (103, 29,
        '2025-12-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (103, 22,
        '2025-06-03', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (103, 20,
        '2025-03-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (103, 7,
        '2025-05-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (104, 16,
        '2025-04-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (104, 35,
        '2025-07-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (104, 31,
        '2025-08-16', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (104, 21,
        '2025-07-11', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (104, 10,
        '2025-04-29', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (105, 49,
        '2025-05-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (105, 39,
        '2025-07-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (105, 12,
        '2025-03-29', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (105, 4,
        '2025-10-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (105, 37,
        '2025-06-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (106, 32,
        '2025-03-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (106, 35,
        '2025-11-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (106, 5,
        '2025-02-27', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (106, 9,
        '2025-05-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (106, 21,
        '2025-06-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (107, 38,
        '2025-03-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (107, 7,
        '2025-06-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (107, 30,
        '2025-08-10', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (107, 22,
        '2025-05-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (107, 36,
        '2025-05-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (108, 5,
        '2025-04-21', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (108, 47,
        '2025-07-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (108, 12,
        '2025-04-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (108, 3,
        '2025-09-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (108, 45,
        '2025-03-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (109, 45,
        '2025-03-13', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (109, 24,
        '2025-08-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (109, 18,
        '2025-05-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (109, 5,
        '2025-02-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (109, 47,
        '2025-08-26', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (110, 50,
        '2025-04-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (110, 16,
        '2025-05-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (110, 10,
        '2025-04-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (110, 26,
        '2025-05-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (110, 7,
        '2025-05-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (111, 32,
        '2025-03-01', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (111, 6,
        '2025-04-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (111, 42,
        '2025-06-12', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (111, 31,
        '2025-06-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (111, 37,
        '2025-06-03', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (112, 38,
        '2025-03-12', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (112, 34,
        '2025-08-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (112, 26,
        '2025-08-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (112, 49,
        '2025-04-08', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (112, 30,
        '2025-06-20', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (113, 15,
        '2025-03-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (113, 6,
        '2025-03-28', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (113, 43,
        '2025-06-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (113, 22,
        '2025-05-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (113, 49,
        '2025-04-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (114, 20,
        '2025-03-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (114, 23,
        '2025-06-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (114, 8,
        '2025-03-31', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (114, 33,
        '2025-06-13', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (114, 32,
        '2025-03-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (115, 24,
        '2025-06-10', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (115, 29,
        '2025-06-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (115, 25,
        '2025-05-01', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (115, 43,
        '2025-06-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (115, 36,
        '2025-05-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (116, 34,
        '2025-10-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (116, 50,
        '2025-09-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (116, 20,
        '2025-03-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (116, 35,
        '2025-09-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (116, 15,
        '2025-02-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (117, 49,
        '2025-05-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (117, 36,
        '2025-04-12', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (117, 28,
        '2025-08-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (117, 15,
        '2025-03-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (117, 43,
        '2025-03-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (118, 17,
        '2025-03-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (118, 29,
        '2025-04-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (118, 42,
        '2025-05-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (118, 34,
        '2025-11-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (118, 14,
        '2025-04-18', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (119, 20,
        '2025-03-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (119, 31,
        '2025-11-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (119, 44,
        '2025-08-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (119, 18,
        '2025-04-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (119, 36,
        '2025-05-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (120, 10,
        '2025-04-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (120, 16,
        '2025-04-06', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (120, 13,
        '2025-02-08', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (120, 28,
        '2025-06-26', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (120, 20,
        '2025-04-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (121, 9,
        '2025-07-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (121, 14,
        '2025-11-03', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (121, 31,
        '2026-01-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (121, 22,
        '2025-06-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (121, 50,
        '2025-08-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (122, 33,
        '2025-05-25', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (122, 8,
        '2025-03-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (122, 43,
        '2025-02-13', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (122, 34,
        '2025-07-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (122, 10,
        '2025-04-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (123, 7,
        '2025-05-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (123, 28,
        '2025-07-03', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (123, 33,
        '2025-11-03', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (123, 6,
        '2025-04-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (123, 14,
        '2025-11-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (124, 43,
        '2025-06-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (124, 46,
        '2025-03-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (124, 35,
        '2025-12-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (124, 44,
        '2025-07-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (124, 30,
        '2025-06-25', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (125, 15,
        '2025-02-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (125, 47,
        '2025-08-16', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (125, 2,
        '2025-03-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (125, 21,
        '2025-08-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (125, 20,
        '2025-03-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (126, 36,
        '2025-05-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (126, 6,
        '2025-05-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (126, 33,
        '2025-08-31', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (126, 22,
        '2025-05-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (126, 16,
        '2025-03-31', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (127, 18,
        '2025-05-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (127, 16,
        '2025-04-08', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (127, 33,
        '2025-01-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (127, 4,
        '2025-08-21', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (127, 28,
        '2025-08-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (128, 35,
        '2025-05-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (128, 21,
        '2025-06-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (128, 17,
        '2025-03-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (128, 5,
        '2025-02-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (128, 42,
        '2025-04-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (129, 30,
        '2025-07-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (129, 45,
        '2025-04-11', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (129, 16,
        '2025-04-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (129, 27,
        '2025-10-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (129, 42,
        '2025-05-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (130, 38,
        '2025-02-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (130, 36,
        '2025-05-02', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (130, 18,
        '2025-05-26', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (130, 33,
        '2025-02-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (130, 42,
        '2025-05-10', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (131, 41,
        '2025-10-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (131, 3,
        '2025-08-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (131, 11,
        '2025-05-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (131, 36,
        '2025-04-26', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (131, 5,
        '2025-04-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (132, 21,
        '2025-06-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (132, 33,
        '2025-05-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (132, 47,
        '2025-08-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (132, 28,
        '2025-10-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (132, 42,
        '2025-06-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (133, 15,
        '2025-02-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (133, 1,
        '2025-01-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (133, 28,
        '2025-12-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (133, 48,
        '2025-05-10', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (133, 31,
        '2025-12-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (134, 2,
        '2025-04-08', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (134, 3,
        '2025-07-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (134, 17,
        '2025-03-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (134, 15,
        '2025-02-21', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (134, 45,
        '2025-03-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (135, 31,
        '2025-08-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (135, 8,
        '2025-04-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (135, 48,
        '2025-04-13', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (135, 2,
        '2025-06-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (135, 24,
        '2025-03-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (136, 18,
        '2025-04-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (136, 31,
        '2025-12-13', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (136, 41,
        '2025-07-31', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (136, 5,
        '2025-04-07', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (136, 3,
        '2025-06-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (137, 41,
        '2026-01-05', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (137, 49,
        '2025-05-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (137, 4,
        '2025-06-21', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (137, 2,
        '2025-07-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (137, 20,
        '2025-03-26', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (138, 11,
        '2025-06-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (138, 44,
        '2025-06-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (138, 18,
        '2025-04-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (138, 28,
        '2025-12-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (138, 8,
        '2025-05-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (139, 14,
        '2025-03-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (139, 26,
        '2025-08-07', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (139, 3,
        '2025-09-28', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (139, 4,
        '2025-06-06', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (139, 2,
        '2025-03-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (140, 20,
        '2025-04-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (140, 18,
        '2025-05-06', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (140, 45,
        '2025-03-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (140, 47,
        '2025-07-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (140, 27,
        '2025-08-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (141, 41,
        '2025-10-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (141, 5,
        '2025-03-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (141, 38,
        '2025-03-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (141, 36,
        '2025-05-29', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (141, 45,
        '2025-03-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (142, 6,
        '2025-06-28', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (142, 14,
        '2025-11-01', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (142, 32,
        '2025-03-08', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (142, 24,
        '2025-12-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (142, 33,
        '2025-03-01', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (143, 32,
        '2025-02-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (143, 9,
        '2025-07-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (143, 47,
        '2025-07-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (143, 7,
        '2025-05-13', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (143, 43,
        '2025-07-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (144, 28,
        '2026-01-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (144, 12,
        '2025-02-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (144, 1,
        '2025-02-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (144, 49,
        '2025-04-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (144, 7,
        '2025-06-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (145, 38,
        '2025-01-31', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (145, 43,
        '2025-08-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (145, 16,
        '2025-05-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (145, 41,
        '2025-08-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (145, 27,
        '2025-06-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (146, 47,
        '2025-08-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (146, 7,
        '2025-06-13', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (146, 16,
        '2025-05-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (146, 9,
        '2025-05-27', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (146, 27,
        '2025-08-03', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (147, 46,
        '2025-03-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (147, 20,
        '2025-04-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (147, 31,
        '2025-12-24', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (147, 5,
        '2025-03-12', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (147, 36,
        '2025-04-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (148, 21,
        '2025-07-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (148, 5,
        '2025-03-23', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (148, 49,
        '2025-05-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (148, 9,
        '2025-07-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (148, 15,
        '2025-03-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (149, 15,
        '2025-02-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (149, 6,
        '2025-06-13', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (149, 49,
        '2025-05-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (149, 27,
        '2025-11-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (149, 30,
        '2025-07-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (150, 32,
        '2025-04-07', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (150, 3,
        '2025-10-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (150, 46,
        '2025-03-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (150, 38,
        '2025-03-01', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (150, 39,
        '2025-07-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (151, 2,
        '2025-05-29', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (151, 39,
        '2025-06-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (151, 4,
        '2025-12-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (151, 43,
        '2025-04-28', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (151, 25,
        '2026-03-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (152, 27,
        '2025-07-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (152, 38,
        '2025-02-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (152, 48,
        '2025-05-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (152, 42,
        '2025-05-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (152, 21,
        '2025-06-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (153, 7,
        '2025-06-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (153, 6,
        '2025-04-10', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (153, 34,
        '2025-08-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (153, 41,
        '2026-02-02', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (153, 9,
        '2025-07-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (154, 50,
        '2025-03-25', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (154, 47,
        '2025-07-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (154, 18,
        '2025-05-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (154, 15,
        '2025-02-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (154, 37,
        '2025-06-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (155, 21,
        '2025-07-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (155, 17,
        '2025-04-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (155, 8,
        '2025-03-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (155, 11,
        '2025-08-27', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (155, 26,
        '2025-05-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (156, 4,
        '2025-07-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (156, 30,
        '2025-07-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (156, 28,
        '2025-11-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (156, 26,
        '2025-07-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (156, 10,
        '2025-04-27', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (157, 25,
        '2026-02-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (157, 29,
        '2025-10-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (157, 23,
        '2025-06-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (157, 47,
        '2025-07-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (157, 2,
        '2025-05-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (158, 31,
        '2025-11-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (158, 34,
        '2025-10-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (158, 48,
        '2025-04-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (158, 42,
        '2025-05-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (158, 13,
        '2025-05-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (159, 11,
        '2025-10-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (159, 45,
        '2025-04-05', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (159, 43,
        '2025-03-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (159, 23,
        '2025-05-16', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (159, 41,
        '2025-07-03', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (160, 48,
        '2025-04-24', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (160, 19,
        '2025-05-10', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (160, 38,
        '2025-02-27', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (160, 42,
        '2025-05-31', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (160, 28,
        '2026-01-08', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (161, 36,
        '2025-05-03', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (161, 3,
        '2025-07-01', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (161, 7,
        '2025-06-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (161, 11,
        '2025-08-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (161, 17,
        '2025-04-02', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (162, 27,
        '2025-12-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (162, 35,
        '2025-08-05', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (162, 39,
        '2025-08-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (162, 44,
        '2025-07-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (162, 43,
        '2025-03-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (163, 47,
        '2025-07-13', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (163, 19,
        '2025-04-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (163, 3,
        '2025-02-25', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (163, 16,
        '2025-05-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (163, 28,
        '2025-08-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (164, 24,
        '2025-09-21', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (164, 44,
        '2025-06-24', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (164, 4,
        '2025-10-01', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (164, 8,
        '2025-04-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (164, 29,
        '2025-09-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (165, 46,
        '2025-03-18', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (165, 25,
        '2025-04-24', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (165, 2,
        '2025-03-12', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (165, 38,
        '2025-02-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (165, 4,
        '2025-09-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (166, 10,
        '2025-05-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (166, 14,
        '2025-03-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (166, 42,
        '2025-04-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (166, 15,
        '2025-02-03', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (166, 30,
        '2025-07-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (167, 15,
        '2025-02-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (167, 38,
        '2025-02-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (167, 25,
        '2025-09-21', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (167, 47,
        '2025-07-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (167, 3,
        '2025-08-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (168, 34,
        '2025-10-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (168, 14,
        '2025-05-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (168, 2,
        '2025-03-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (168, 5,
        '2025-03-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (168, 13,
        '2025-03-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (169, 39,
        '2025-07-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (169, 30,
        '2025-06-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (169, 25,
        '2025-10-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (169, 16,
        '2025-04-17', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (169, 26,
        '2025-07-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (170, 34,
        '2025-09-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (170, 25,
        '2025-12-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (170, 28,
        '2025-12-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (170, 26,
        '2025-07-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (170, 40,
        '2025-01-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (171, 50,
        '2025-04-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (171, 46,
        '2025-04-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (171, 22,
        '2025-06-13', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (171, 6,
        '2025-05-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (171, 20,
        '2025-04-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (172, 15,
        '2025-01-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (172, 1,
        '2025-02-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (172, 50,
        '2025-10-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (172, 5,
        '2025-04-06', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (172, 46,
        '2025-05-13', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (173, 14,
        '2025-05-07', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (173, 39,
        '2025-07-28', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (173, 13,
        '2025-03-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (173, 35,
        '2025-06-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (173, 31,
        '2025-11-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (174, 17,
        '2025-04-16', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (174, 47,
        '2025-08-01', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (174, 5,
        '2025-03-29', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (174, 11,
        '2025-11-01', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (174, 44,
        '2025-05-11', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (175, 12,
        '2025-03-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (175, 16,
        '2025-04-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (175, 22,
        '2025-05-13', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (175, 26,
        '2025-08-13', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (175, 33,
        '2025-08-03', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (176, 31,
        '2025-09-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (176, 27,
        '2025-10-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (176, 2,
        '2025-06-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (176, 19,
        '2025-04-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (176, 5,
        '2025-03-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (177, 8,
        '2025-04-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (177, 21,
        '2025-07-03', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (177, 38,
        '2025-03-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (177, 30,
        '2025-07-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (177, 12,
        '2025-03-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (178, 5,
        '2025-04-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (178, 28,
        '2025-12-31', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (178, 4,
        '2025-10-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (178, 9,
        '2025-06-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (178, 12,
        '2025-03-08', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (179, 18,
        '2025-04-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (179, 45,
        '2025-03-31', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (179, 16,
        '2025-04-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (179, 8,
        '2025-03-13', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (179, 10,
        '2025-05-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (180, 35,
        '2025-12-31', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (180, 21,
        '2025-07-02', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (180, 13,
        '2025-04-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (180, 17,
        '2025-03-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (180, 3,
        '2025-06-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (181, 40,
        '2025-01-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (181, 8,
        '2025-04-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (181, 11,
        '2025-10-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (181, 13,
        '2025-03-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (181, 38,
        '2025-02-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (182, 3,
        '2025-05-02', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (182, 32,
        '2025-02-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (182, 6,
        '2025-07-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (182, 36,
        '2025-04-27', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (182, 40,
        '2025-02-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (183, 48,
        '2025-05-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (183, 42,
        '2025-05-26', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (183, 18,
        '2025-05-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (183, 43,
        '2025-01-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (183, 40,
        '2025-01-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (184, 11,
        '2025-08-21', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (184, 43,
        '2025-03-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (184, 13,
        '2025-04-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (184, 14,
        '2025-01-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (184, 40,
        '2025-02-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (185, 6,
        '2025-06-10', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (185, 14,
        '2025-05-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (185, 33,
        '2025-07-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (185, 31,
        '2025-05-27', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (185, 37,
        '2025-05-18', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (186, 33,
        '2025-07-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (186, 23,
        '2025-05-12', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (186, 8,
        '2025-04-21', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (186, 44,
        '2025-06-16', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (186, 47,
        '2025-07-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (187, 3,
        '2025-06-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (187, 16,
        '2025-05-03', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (187, 26,
        '2025-07-07', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (187, 46,
        '2025-04-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (187, 12,
        '2025-02-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (188, 22,
        '2025-05-19', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (188, 14,
        '2025-11-07', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (188, 12,
        '2025-02-11', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (188, 46,
        '2025-04-28', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (188, 34,
        '2025-09-10', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (189, 33,
        '2025-02-24', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (189, 19,
        '2025-05-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (189, 24,
        '2025-06-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (189, 8,
        '2025-03-11', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (189, 21,
        '2025-06-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (190, 7,
        '2025-06-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (190, 26,
        '2025-08-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (190, 40,
        '2025-02-26', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (190, 42,
        '2025-04-30', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (190, 49,
        '2025-05-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (191, 40,
        '2025-01-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (191, 34,
        '2025-03-22', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (191, 14,
        '2025-07-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (191, 2,
        '2025-05-23', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (191, 30,
        '2025-06-29', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (192, 3,
        '2025-01-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (192, 36,
        '2025-05-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (192, 19,
        '2025-06-03', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (192, 23,
        '2025-04-25', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (192, 34,
        '2025-07-16', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (193, 40,
        '2025-01-29', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (193, 35,
        '2026-01-14', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (193, 24,
        '2025-06-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (193, 46,
        '2025-04-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (193, 10,
        '2025-04-12', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (194, 34,
        '2025-08-20', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (194, 21,
        '2025-08-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (194, 44,
        '2025-07-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (194, 1,
        '2025-01-20', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (194, 39,
        '2025-05-14', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (195, 49,
        '2025-04-29', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (195, 44,
        '2025-06-18', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (195, 10,
        '2025-03-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (195, 17,
        '2025-03-15', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (195, 31,
        '2025-07-15', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (196, 37,
        '2025-06-27', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (196, 15,
        '2025-01-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (196, 18,
        '2025-04-17', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (196, 17,
        '2025-05-04', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (196, 4,
        '2025-09-20', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (197, 28,
        '2025-09-16', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (197, 43,
        '2025-04-28', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (197, 3,
        '2025-10-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (197, 42,
        '2025-05-07', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (197, 6,
        '2025-04-06', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (198, 4,
        '2025-04-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (198, 1,
        '2025-02-14', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (198, 43,
        '2025-07-09', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (198, 39,
        '2025-06-30', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (198, 34,
        '2025-06-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (199, 21,
        '2025-06-16', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (199, 26,
        '2025-06-17', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (199, 31,
        '2025-11-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (199, 10,
        '2025-04-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (199, 8,
        '2025-03-23', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (200, 46,
        '2025-04-18', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (200, 10,
        '2025-05-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (200, 19,
        '2025-06-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (200, 32,
        '2025-02-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (200, 8,
        '2025-03-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (201, 41,
        '2025-11-24', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (201, 24,
        '2025-06-21', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (201, 14,
        '2025-07-09', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (201, 31,
        '2025-09-07', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (201, 3,
        '2025-06-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (202, 20,
        '2025-03-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (202, 25,
        '2025-06-04', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (202, 32,
        '2025-03-28', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (202, 17,
        '2025-04-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (202, 6,
        '2025-06-08', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (203, 41,
        '2025-09-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (203, 12,
        '2025-02-07', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (203, 9,
        '2025-05-23', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (203, 34,
        '2025-08-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (203, 33,
        '2025-04-23', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (204, 31,
        '2025-12-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (204, 10,
        '2025-05-08', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (204, 12,
        '2025-02-25', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (204, 40,
        '2025-01-11', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (204, 34,
        '2025-05-22', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (205, 13,
        '2025-02-06', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (205, 7,
        '2025-07-01', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (205, 25,
        '2025-10-30', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (205, 12,
        '2025-03-15', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (205, 35,
        '2025-12-21', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (206, 28,
        '2026-01-02', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (206, 32,
        '2025-04-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (206, 9,
        '2025-06-19', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (206, 12,
        '2025-03-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (206, 43,
        '2025-01-26', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (207, 19,
        '2025-05-12', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (207, 44,
        '2025-06-18', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (207, 43,
        '2025-03-19', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (207, 22,
        '2025-05-16', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (207, 31,
        '2025-08-10', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (208, 5,
        '2025-04-02', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (208, 6,
        '2025-06-16', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (208, 16,
        '2025-04-27', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (208, 2,
        '2025-05-24', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (208, 42,
        '2025-05-25', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (209, 27,
        '2025-08-02', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (209, 4,
        '2025-04-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (209, 39,
        '2025-07-28', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (209, 26,
        '2025-06-04', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (209, 47,
        '2025-08-09', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (210, 48,
        '2025-04-18', 'Refusé');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (210, 21,
        '2025-06-22', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (210, 11,
        '2025-06-06', 'En attente');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (210, 30,
        '2025-08-12', 'En cours');
COMMIT;

-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES (210, 33,
        '2025-09-30', 'En attente');
COMMIT;
