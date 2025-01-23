import random
from dataclasses import dataclass
from datetime import datetime, timedelta
from typing import Optional

from faker import Faker

# Initialize Faker
fake = Faker("fr_CH")
Faker.seed(4321)

# Configuration
NUM_CANDIDATS = 200
NUM_RECRUTEURS = 10
NUM_OFFRES = 50
APPLICATIONS_PER_CANDIDATE = 5
DOMAINS_PER_CANDIDATE = 2
DOMAINS_PER_OFFER = 1
DOMAINES = [
    "Developpement informatique",
    "Finance",
    "Marketing",
    "Santé",
    "Enseignement",
]
DIPLOMES = ["Aucun", "Maturité Gymnasiale", "CFC", "Bachelor", "Master", "Doctorat"]


@dataclass
class Adresse:
    latitude: float
    longitude: float
    rue: str
    ville: str
    npa: str
    pays: str = "Suisse"


@dataclass
class Personne:
    nom: str
    prenom: str
    email: str


@dataclass
class Recruteur(Personne):
    pass


@dataclass
class Candidat(Personne):
    adresse: Adresse
    age: int
    genre: str
    numerotel: str
    anneesexp: int
    domaines: list[tuple[int, str]]  # List of (domain_id, diploma)


@dataclass
class Offre:
    adresse: Adresse
    descriptionoffre: str
    nomposte: str
    anneesexprequises: int
    date_publication: datetime
    date_cloture: Optional[datetime]
    domaines: list[tuple[int, str]]  # List of (domain_id, required_diploma)


@dataclass
class Candidature:
    id_candidat: int
    id_offre: int
    date_postulation: datetime
    statut: str


class DataGenerator:
    def __init__(self):
        self.recruteurs: list[Recruteur] = []
        self.candidats: list[Candidat] = []
        self.offres: list[Offre] = []
        self.candidatures: list[Candidature] = []

    def generate_address(self) -> Adresse:
        return Adresse(
            latitude=float(fake.latitude()),
            longitude=float(fake.longitude()),
            rue=fake.street_address().replace("'", "''"),
            ville=fake.city().replace("'", "''"),
            npa=fake.postcode(),
            pays="Suisse",
        )

    def generate_data(self):
        # Generate recruteurs
        for _ in range(NUM_RECRUTEURS):
            self.recruteurs.append(
                Recruteur(
                    nom=fake.last_name().replace("'", "''"),
                    prenom=fake.first_name().replace("'", "''"),
                    email=fake.email(),
                )
            )

        # Generate candidats
        for _ in range(NUM_CANDIDATS):
            selected_domains = random.sample(
                range(1, len(DOMAINES) + 1), DOMAINS_PER_CANDIDATE
            )
            domain_diplomas = [
                (domain_id, random.choice(DIPLOMES)) for domain_id in selected_domains
            ]
            self.candidats.append(
                Candidat(
                    nom=fake.last_name().replace("'", "''"),
                    prenom=fake.first_name().replace("'", "''"),
                    email=fake.email(),
                    adresse=self.generate_address(),
                    age=random.randint(16, 65),
                    genre=random.choice(["Homme", "Femme", "Autre"]),
                    numerotel=fake.phone_number(),
                    anneesexp=random.randint(0, 40),
                    domaines=domain_diplomas,
                )
            )

        # Generate offres
        current_year = datetime.now().year
        start_date = datetime(current_year, 1, 1)

        for _ in range(NUM_OFFRES):
            selected_domains = random.sample(
                range(1, len(DOMAINES) + 1), DOMAINS_PER_OFFER
            )
            domain_diplomas = [
                (domain_id, random.choice(DIPLOMES)) for domain_id in selected_domains
            ]
            date_publication = fake.date_between_dates(
                date_start=start_date, date_end=start_date + timedelta(days=180)
            )

            max_closure_date = date_publication + timedelta(days=360)

            date_cloture = (
                fake.date_between_dates(
                    date_start=date_publication
                    + timedelta(days=30),  # Minimum 30 days after publication
                    date_end=max_closure_date,
                )
                if random.choice([True, False])
                else None
            )

            self.offres.append(
                Offre(
                    adresse=self.generate_address(),
                    descriptionoffre=fake.catch_phrase().replace("'", "''"),
                    nomposte=fake.job().replace("'", "''"),
                    anneesexprequises=random.randint(0, 10),
                    date_publication=date_publication,
                    date_cloture=date_cloture,
                    domaines=domain_diplomas,
                )
            )

        # Generate candidatures with multiple applications per candidate
        statuses = ["En attente", "En cours", "Refusé"]
        candidat_ids = list(
            range(NUM_RECRUTEURS + 1, NUM_RECRUTEURS + NUM_CANDIDATS + 1)
        )
        offre_ids = list(range(1, NUM_OFFRES + 1))
        # Create a set to track unique candidate-offer pairs
        used_pairs = set()
        # For each candidate, generate multiple applications
        for candidat_id in candidat_ids:
            # Randomly select offers for this candidate
            available_offers = random.sample(
                offre_ids, min(APPLICATIONS_PER_CANDIDATE, len(offre_ids))
            )

            for offre_id in available_offers:
                # Skip if this pair has already been used
                if (candidat_id, offre_id) in used_pairs:
                    continue

                used_pairs.add((candidat_id, offre_id))
                offer = self.offres[offre_id - 1]
                status = random.choice(statuses)

                if offer.date_cloture:
                    date_postulation = fake.date_between_dates(
                        date_start=offer.date_publication,
                        date_end=offer.date_cloture,
                    )
                else:
                    date_postulation = offer.date_publication + timedelta(
                        days=random.randint(1, 60)
                    )

                self.candidatures.append(
                    Candidature(
                        id_candidat=candidat_id,
                        id_offre=offre_id,
                        date_postulation=date_postulation,
                        statut=status,
                    )
                )

    def generate_sql(self) -> str:
        sql_commands = []

        # Insert recruteurs
        for recruteur in self.recruteurs:
            sql = f"""-- recruteur
BEGIN;
INSERT INTO Personne (nom, prenom, email)
VALUES ('{recruteur.nom}', '{recruteur.prenom}', '{recruteur.email}');
INSERT INTO Recruteur (idPersonne)
VALUES ((SELECT MAX(id) FROM Personne));
COMMIT;"""
            sql_commands.append(sql)

        # Insert candidats
        for i, candidat in enumerate(self.candidats):
            candidat_id = NUM_RECRUTEURS + i + 1
            insert_domaines_for_candidat = []
            for domain_id, diploma in candidat.domaines:
                insert_domaines_for_candidat.append(
                    f"INSERT INTO Domaine (id, nom) VALUES ({domain_id}, '{DOMAINES[domain_id - 1]}') ON CONFLICT (nom) DO NOTHING;"
                )
                insert_domaines_for_candidat.append(
                    f"INSERT INTO Candidat_Domaine (idCandidat, idDomaine, diplomePossede) VALUES ({candidat_id}, {domain_id}, '{diploma}');"
                )

            sql = f"""-- candidat
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES ({candidat.adresse.latitude}, {candidat.adresse.longitude}, '{candidat.adresse.rue}',
        '{candidat.adresse.ville}', '{candidat.adresse.npa}', '{candidat.adresse.pays}');
INSERT INTO Personne (nom, prenom, email)
VALUES ('{candidat.nom}', '{candidat.prenom}', '{candidat.email}');
INSERT INTO Candidat (idPersonne, age, genre, numeroTel, anneesExp, idAdresse)
VALUES ((SELECT MAX(id) FROM Personne), {candidat.age}, '{candidat.genre}',
        '{candidat.numerotel}', {candidat.anneesexp}, (SELECT MAX(id) FROM Adresse));
{chr(10).join(insert_domaines_for_candidat)}
COMMIT;"""
            sql_commands.append(sql)

        # Insert offres
        for i, offre in enumerate(self.offres):
            offre_id = i + 1
            date_cloture = (
                "NULL" if offre.date_cloture is None else f"'{offre.date_cloture.isoformat()}'"
            )

            insert_domaines_for_offre = []
            for domain_id, diploma_required in offre.domaines:
                insert_domaines_for_offre.append(
                    f"INSERT INTO Domaine (id, nom) VALUES ({domain_id}, '{DOMAINES[domain_id - 1]}') ON CONFLICT (nom) DO NOTHING;"
                )
                insert_domaines_for_offre.append(
                    f"INSERT INTO Offre_Domaine (idOffre, idDomaine, diplomeRecherche) VALUES ({offre_id}, {domain_id}, '{diploma_required}');"
                )

            sql = f"""-- offre
BEGIN;
INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
VALUES ({offre.adresse.latitude}, {offre.adresse.longitude}, '{offre.adresse.rue}',
        '{offre.adresse.ville}', '{offre.adresse.npa}', '{offre.adresse.pays}');
INSERT INTO Offre (idAdresse, descriptionOffre, nomPoste, anneesExpRequises, datePublication, dateCloture)
VALUES ((SELECT MAX(id) FROM Adresse), '{offre.descriptionoffre}', '{offre.nomposte}',
        {offre.anneesexprequises}, '{offre.date_publication.isoformat()}', {date_cloture});
{chr(10).join(insert_domaines_for_offre)}
COMMIT;"""
            sql_commands.append(sql)

        # Insert candidatures
        for candidature in self.candidatures:
            sql = f"""-- candidature
BEGIN;
INSERT INTO Candidat_Offre (idCandidat, idOffre, datePostulation, statut)
VALUES ({candidature.id_candidat}, {candidature.id_offre},
        '{candidature.date_postulation.isoformat()}', '{candidature.statut}');
COMMIT;"""
            sql_commands.append(sql)

        return "\n\n".join(sql_commands)

def main():
    generator = DataGenerator()
    generator.generate_data()
    print(generator.generate_sql())

if __name__ == "__main__":
    main()
