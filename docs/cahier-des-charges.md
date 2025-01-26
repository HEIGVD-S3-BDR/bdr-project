---
title: "Cahier des Charges"
subtitle: "Projet BDR"
author: [Leonard Cseres, Aude Laydu, Tristan Gerber]
date: \today
# geometry: margin=3.5cm
# toc: true
papersize: a4
lang: fr
---

```{=latex}
\hspace{4cm}
\tableofcontents
\pagebreak
```

## 1. Objectif de l'application

Développer une application pour permettre aux recruteurs de gérer efficacement les processus de recrutement, incluant la gestion des candidats et des postes.

## 2. Fonctionnalités principales

### 2.1 Gestion des candidats

- Ajout et modification de candidats.
- Informations personnelles (Nom, âge, genre, localisation, numéro de téléphone, email)
- Information en lien avec les postulations (Domaine, diplome, années d'expérience)
- Statut du candidat (en attente, embauché, rejeté).
- Recherche par filtres: Genre, Age, Années d'expérience
- Suivi des offres auxquelles il a postulé

### 2.2 Gestion des offres d'emploi

- Création et modification d'offres (titre, description, domaine, diplôme requis, expérience requise, localisation).
- Suivi des candidatures par poste.
- Statut de l'offre (Ouverte, clôturée)
- Clôture des offres
- Tri des candidats par pertinence pour un poste donné selon un score de compatiblité candidat-offre basé sur différents facteurs.
- Recherche par filtres: Statut de l'offre, date de publication, nom de l'offre.

### 2.4 Suivi du processus de recrutement

- Vue d'ensemble des candidats par poste
- Vue d'ensemble des postes par candidat
