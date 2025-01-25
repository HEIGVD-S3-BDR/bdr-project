from typing import Annotated
import random

from asyncpg import PostgresError
from fastapi import Form, Request, Query
from fastapi.responses import HTMLResponse, RedirectResponse

from config import templates
from db import database
from models import CandidatCreate, CandidatUpdate
from routes import router


@router.get("/")
async def home(request: Request) -> HTMLResponse:
    return RedirectResponse("/candidats", status_code=301)


@router.get("/candidats", tags=["candidats"])
async def get_candidats(
    request: Request, 
    idoffre: int | None = None, 
    gender: list[str] = Query([], alias="gender"),
    minAge: int | None = None,
    maxAge: int | None = None,
    minExp: int | None = None,
    maxExp: int | None = None,
    ) -> HTMLResponse:
    try:
        base_query = "SELECT * FROM View_Candidat"
        filters = []

        # If idoffre is provided, apply the filter for idoffre
        if idoffre is not None:
            filters.append("INNER JOIN Candidat_Offre ON View_Candidat.id = Candidat_Offre.idcandidat")
            filters.append(f"WHERE Candidat_Offre.idoffre = :idoffre")
        
        # If gender is provided, apply the gender filter
        if gender:
            gender_condition = " OR ".join([f"View_Candidat.genre = '{g}'" for g in gender])
            if filters:
                filters.append(f"AND ({gender_condition})")
            else:
                filters.append(f"WHERE ({gender_condition})")

        # If minAge or maxAge is provided, apply the age filter
        if minAge is not None or maxAge is not None:
            age_conditions = []
            if minAge is not None:
                age_conditions.append(f"View_Candidat.age >= :minAge")
            if maxAge is not None:
                age_conditions.append(f"View_Candidat.age <= :maxAge")
            
            age_condition = " AND ".join(age_conditions)
            if filters:
                filters.append(f"AND ({age_condition})")
            else:
                filters.append(f"WHERE ({age_condition})")

         # If minExp or maxExp is provided, apply the experience filter
        if minExp is not None or maxExp is not None:
            exp_conditions = []
            if minExp is not None:
                exp_conditions.append(f"View_Candidat.anneesExp >= :minExp")
            if maxExp is not None:
                exp_conditions.append(f"View_Candidat.anneesExp <= :maxExp")
            
            exp_condition = " AND ".join(exp_conditions)
            if filters:
                filters.append(f"AND ({exp_condition})")
            else:
                filters.append(f"WHERE ({exp_condition})")

        # Combine the base query with filters
        query = f"{base_query} {' '.join(filters)}"

        # Prepare the values for query substitution
        values = {}
        if idoffre is not None:
            values["idoffre"] = idoffre
        if minAge is not None:
            values["minAge"] = minAge
        if maxAge is not None:
            values["maxAge"] = maxAge
        if minExp is not None:
            values["minExp"] = minExp
        if maxExp is not None:
            values["maxExp"] = maxExp

        # Log the query and values for debugging
        print("Generated SQL Query: %s", query)
        print("Bound Values: %s", values)

        # Fetch the data from the database
        data = await database.fetch_all(query=query, values=values)

        # Convert to dictionary format
        data = [dict(record) for record in data]

        # Return the template with the filtered data and gender filter state
        return templates.TemplateResponse(
            request=request, name="candidats.html",
            context=dict(
                candidats=data, 
                gender=gender, 
                minAge=minAge, 
                maxAge=maxAge, 
                minExp=minExp, 
                maxExp=maxExp
            )
        )

    except PostgresError as e:
        return templates.TemplateResponse(
            request=request, name="error.html", context=dict(error=str(e))
        )



@router.get("/candidats/{id}", tags=["candidats"])
async def get_candidats_detail(request: Request, id: int) -> HTMLResponse:
    try:
        query_candidat = "SELECT * FROM View_Candidat WHERE id = :id;"
        query_offres_candidat = """SELECT co.*, o.*, vos.*
        FROM Candidat_Offre co
        INNER JOIN View_Offre o ON co.idoffre = o.id
        INNER JOIN View_Offre_Score vos ON co.idoffre = vos.idoffre
            AND vos.idCandidat = co.idcandidat
        WHERE co.idcandidat = :id
        """
        async with database.transaction():
            candidat = await database.fetch_one(
                query=query_candidat, values=dict(id=id)
            )
            offres = await database.fetch_all(
                query=query_offres_candidat, values=dict(id=id)
            )

        if candidat is None:
            # TODO: Return Not found
            return templates.TemplateResponse(
                request=request,
                name="error.html",
                context=dict(error="Candidat not found"),
            )

        data = dict(
            candidat=dict(candidat),
            offres=[dict(record) for record in offres],
        )
        return templates.TemplateResponse(
            request=request, name="candidat.html", context=dict(data=data)
        )

    except PostgresError as e:
        return templates.TemplateResponse(
            request=request, name="error.html", context=dict(error=str(e))
        )


@router.get("/candidat-new", tags=["candidats"])
async def get_candidats_new(request: Request) -> HTMLResponse:
    offres = await database.fetch_all(query="SELECT * FROM Offre;")
    return templates.TemplateResponse(
        request=request,
        name="candidat-update.html",
        context=dict(
            method="post",
            candidat=None,
            offres=[dict(record) for record in offres],
            linked_offres=[],
        ),
    )


@router.get("/candidat/{id}/edit", tags=["candidats"])
async def get_candidats_update(request: Request, id: int) -> HTMLResponse:
    try:
        query = "SELECT * FROM View_Candidat WHERE id = :id;"
        data = await database.fetch_one(query=query, values=dict(id=id))

        offres = await database.fetch_all(query="SELECT * FROM Offre;")

        query = """
        SELECT co.idoffre
        FROM Candidat_Offre AS co
        WHERE co.idcandidat = :id;
        """
        linked_offres = await database.fetch_all(query=query, values=dict(id=id))
        linked_offres = [item["idoffre"] for item in linked_offres]

        return templates.TemplateResponse(
            request=request,
            name="candidat-update.html",
            context=dict(
                method="put",
                candidat=dict(data),
                offres=[dict(record) for record in offres],
                linked_offres=linked_offres,
            ),
        )

    except PostgresError as e:
        return templates.TemplateResponse(
            request=request, name="error.html", context=dict(error=str(e))
        )


@router.post("/candidats", tags=["candidats"])
async def post_candidats(
    request: Request,
    data: Annotated[CandidatCreate, Form()],
):
    try:
        insert_full_query = """
        WITH inserted_adresse AS (
            INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
            VALUES (:latitude, :longitude, :rue, :ville, :npa, :pays)
            RETURNING id AS idadresse
        ),
        inserted_personne AS (
            INSERT INTO Personne (nom, prenom, email)
            VALUES (:nom, :prenom, :email)
            RETURNING id AS idpersonne
        )
        INSERT INTO Candidat (
            idpersonne, age, genre, numerotel, anneesexp,
            idadresse
        )
        SELECT
            inserted_personne.idpersonne,
            :age,
            :genre,
            :numerotel,
            :anneesexp,
            inserted_adresse.idadresse
        FROM inserted_adresse, inserted_personne
        RETURNING idpersonne;
        """

        offre_candidat_insert = """
        INSERT INTO Candidat_Offre (idcandidat, idoffre, datepostulation, statut)
        VALUES (:idcandidat, :idoffre, CURRENT_DATE, 'En attente');
        """
        candidat_create_data = data.dict()
        candidat_create_data.pop("offres")
        async with database.transaction():
            idpersonne = await database.execute(
                query=insert_full_query,
                values=dict(
                    **candidat_create_data,
                    latitude=random.uniform(-90, 90),
                    longitude=random.uniform(-180, 180),
                ),
            )

            for idoffre in data.offres:
                await database.execute(
                    query=offre_candidat_insert,
                    values=dict(idcandidat=idpersonne, idoffre=idoffre),
                )

        return RedirectResponse("/candidats", status_code=303)
    except PostgresError as e:
        offres = await database.fetch_all(query="SELECT * FROM Offre;")
        return templates.TemplateResponse(
            request=request,
            name="candidat-update.html",
            context=dict(
                method="post",
                candidat=data,
                offres=[dict(record) for record in offres],
                linked_offres=[],
                error=str(e),
            ),
        )


@router.post("/candidats/{id}/edit", tags=["candidats"])
async def put_candidats(
    request: Request,
    id: int,
    data: Annotated[CandidatUpdate, Form()],
):
    try:
        get_idadresse_query = """
        SELECT idadresse
        FROM Candidat
        WHERE idpersonne = :id;
        """

        res = await database.fetch_one(query=get_idadresse_query, values=dict(id=id))
        if not res:
            return templates.TemplateResponse(
                request=request,
                name="candidat-update.html",
                context=dict(
                    method="put", candidat=data, error="Candidat adresse not found"
                ),
            )

        idadresse = res["idadresse"]

        update_full_query = """
        WITH updated_adresse AS (
            UPDATE Adresse
            SET latitude = :latitude,
                longitude = :longitude,
                rue = :rue,
                ville = :ville,
                npa = :npa,
                pays = :pays
            WHERE id = :idadresse
            RETURNING id AS idadresse
        ),
        updated_personne AS (
            UPDATE Personne
            SET nom = :nom,
                prenom = :prenom,
                email = :email
            WHERE id = :id
            RETURNING id AS idpersonne
        )
        UPDATE Candidat
        SET age = :age,
            genre = :genre,
            numerotel = :numerotel,
            anneesexp = :anneesexp
        WHERE idpersonne = :id
        RETURNING idpersonne;
        """

        await database.execute(
            query=update_full_query,
            values=dict(
                **data.dict(),
                id=id,
                idadresse=idadresse,
                latitude=random.uniform(-90, 90),
                longitude=random.uniform(-180, 180),
            ),
        )
        return RedirectResponse("/candidats", status_code=303)

    except PostgresError as e:
        return templates.TemplateResponse(
            request=request,
            name="candidat-update.html",
            context=dict(method="put", candidat=data, error=str(e)),
        )

@router.get("/candidats/{idcandidat}/pertinence", tags=["candidats"])
async def get_offres_pertinence(request: Request, idcandidat: int) -> HTMLResponse:
    try:
        query = """
        SELECT cs.idOffre, cs.score
        FROM get_offres_pertinentes(:idcandidat) cs
        JOIN View_Offre c ON cs.idOffre = c.id
        ORDER BY cs.score DESC;
        """
        offres = await database.fetch_all(query, values={"idcandidat": idcandidat})
        
        query_candidat = "SELECT * FROM View_Candidat WHERE id = :idcandidat;"
        candidat = await database.fetch_one(query_candidat, values={"idcandidat": idcandidat})
        
        return templates.TemplateResponse(
            "candidat-pertinence.html",
            {"request": request, "candidat": dict(candidat), "offres": [dict(c) for c in offres]},
        )
    except PostgresError as e:
        return templates.TemplateResponse(
            request=request,
            name="error.html",
            context=dict(error=str(e)),
        )