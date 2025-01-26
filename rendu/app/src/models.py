from abc import ABC
from datetime import date
from typing import Literal

from pydantic import BaseModel


class Adresse(BaseModel):
    rue: str
    ville: str
    npa: str
    pays: str


class Personne(BaseModel, ABC):
    nom: str
    prenom: str
    email: str


class CandidatUpdate(Personne, Adresse):
    age: int
    genre: Literal["Homme", "Femme", "Autre"]
    numerotel: str
    anneesexp: int


class CandidatCreate(CandidatUpdate):
    offres: list[int]


class Candidat(CandidatCreate):
    id: int


class OffreCreate(Adresse):
    descriptionoffre: str
    nomposte: str
    anneesexprequises: int


class Offre(OffreCreate):
    id: int
    datepublication: date
    datecloture: date | None = None
