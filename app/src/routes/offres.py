from datetime import datetime
from typing import Annotated
import random

from asyncpg import PostgresError
from fastapi import Form, Request
from fastapi.responses import HTMLResponse, RedirectResponse

from config import templates
from db import database
from models import OffreCreate
from routes import router

@router.get("/offres", tags=["offres"])
async def get_offres(
    request: Request, idCandidat: int | None = None,
    statut: str = "all", datePublication: str = "", name: str = ""
)-> HTMLResponse:
    try:
        # Base query to select from View_Offre
        base_query = "SELECT * FROM View_Offre"
        filters = []
        values = {}

        # If idCandidat is provided, add the join and filter for idCandidat
        if idCandidat is not None:
            filters.append(f"INNER JOIN Candidat_Offre ON View_Offre.id = Candidat_Offre.idoffre")
            filters.append(f"WHERE Candidat_Offre.idCandidat = :idCandidat")
            values['idCandidat'] = idCandidat

        # If statut is provided (open or closed), apply the corresponding filter
        if statut != "all":
            status_condition = "datecloture IS NULL" if statut == "open" else "datecloture IS NOT NULL"
            if filters:
                filters.append(f"AND View_Offre.{status_condition}")
            else:
                filters.append(f"WHERE View_Offre.{status_condition}")

        # If name is provided, add a LIKE condition to the query
        if name:
            if filters:
                filters.append(f"AND View_Offre.nomposte ILIKE :name")
            else:
                filters.append(f"WHERE View_Offre.nomposte ILIKE :name")
            values['name'] = f"%{name}%"  # Ensuring proper LIKE search for starting letters

        # If datePublication filter is applied, modify the query to include ordering
        if datePublication == "recent":
            order_by = "ORDER BY datepublication DESC"  # Most recent first
        elif datePublication == "oldest":
            order_by = "ORDER BY datepublication ASC"  # Oldest first
        else:
            order_by = ""  # Default, no ordering if no filter provided

        # Combine the base query with filters and ordering
        query = f"{base_query} {' '.join(filters)} {order_by}"

        # Fetch the data from the database
        data = await database.fetch_all(query=query, values=values)

        return templates.TemplateResponse(
            request=request, 
            name="offres.html", 
            context=dict(offres=data, idCandidat=idCandidat, statut=statut, datePublication=datePublication, name=name)
        )

    except PostgresError as e:
        return templates.TemplateResponse(
            request=request, name="error.html", context=dict(error=str(e))
        )



@router.get("/offres/{id}", tags=["offres"])
async def get_offres_detail(request: Request, id: int) -> HTMLResponse:
    try:
        query_offre = "SELECT * FROM View_Offre WHERE id = :id;"
        query_offre_candidats = """SELECT * FROM Candidat_Offre co
        INNER JOIN View_Candidat c ON co.idcandidat = c.id
        INNER JOIN View_Candidat_Score vcs on co.idcandidat = vcs.idcandidat
        WHERE co.idoffre = :id;
        """
        async with database.transaction():
            offre = await database.fetch_one(query=query_offre, values=dict(id=id))
            candidats = await database.fetch_all(
                query=query_offre_candidats, values=dict(id=id)
            )

        if offre is None:
            # TODO: Return Not found
            return templates.TemplateResponse(
                request=request,
                name="error.html",
                context=dict(error="Offre not found"),
            )

        data = dict(
            offre=dict(offre),
            candidats=[dict(record) for record in candidats],
        )
        return templates.TemplateResponse(
            request=request, name="offre.html", context=dict(data=data)
        )

    except PostgresError as e:
        return templates.TemplateResponse(
            request=request, name="error.html", context=dict(error=str(e))
        )


@router.get("/offre-new", tags=["offres"])
async def get_offres_new(request: Request) -> HTMLResponse:
    return templates.TemplateResponse(
        request=request,
        name="offre-update.html",
        context=dict(method="post", offre=None),
    )


@router.get("/offre/{id}/edit", tags=["offres"])
async def get_offres_update(request: Request, id: int) -> HTMLResponse:
    try:
        query = "SELECT * FROM View_Offre WHERE id = :id;"
        data = await database.fetch_one(query=query, values=dict(id=id))
        return templates.TemplateResponse(
            request=request,
            name="offre-update.html",
            context=dict(method="put", offre=dict(data)),
        )

    except PostgresError as e:
        return templates.TemplateResponse(
            request=request, name="error.html", context=dict(error=str(e))
        )


@router.post("/offres", tags=["offres"])
async def post_offres(request: Request, data: Annotated[OffreCreate, Form()]):
    try:
        insert_full_query = """
        WITH inserted_adresse AS (
            INSERT INTO Adresse (latitude, longitude, rue, ville, npa, pays)
            VALUES (:latitude, :longitude, :rue, :ville, :npa, :pays)
            RETURNING id AS idadresse
        )
        INSERT INTO Offre (
            idadresse, descriptionoffre, nomposte, anneesexprequises
        )
        SELECT
            inserted_adresse.idadresse,
            :descriptionoffre,
            :nomposte,
            :anneesexprequises
        FROM inserted_adresse;
        """

        await database.execute(
            query=insert_full_query,
            values=dict(
                **data.dict(),
                latitude=random.uniform(-90, 90),
                longitude=random.uniform(-180, 180),
            ),
        )

        return RedirectResponse("/offres", status_code=303)
    except PostgresError as e:
        return templates.TemplateResponse(
            request=request,
            name="offre-update.html",
            context=dict(method="post", offre=data, error=str(e)),
        )


@router.post("/offres/{id}/edit", tags=["offres"])
async def put_offres(request: Request, id: int, data: Annotated[OffreCreate, Form()]):
    try:
        # Retrieve the current idAdresse associated with the Offre
        get_idadresse_query = """
        SELECT idadresse
        FROM Offre
        WHERE id = :id;
        """

        res = await database.fetch_one(query=get_idadresse_query, values=dict(id=id))
        if not res:
            return templates.TemplateResponse(
                request=request,
                name="offre-update.html",
                context=dict(method="put", offre=data, error="offre adresse not found"),
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
        updated_offre AS (
            UPDATE Offre
            SET descriptionoffre = :descriptionoffre,
                nomposte = :nomposte,
                anneesexprequises = :anneesexprequises,
                datecloture = :datecloture
            WHERE id = :id
            RETURNING id AS idoffre
        )
        UPDATE Offre
        SET idAdresse = updated_adresse.idadresse
        FROM updated_adresse, updated_offre
        WHERE Offre.id = :id;
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
        return RedirectResponse("/offres", status_code=303)

    except PostgresError as e:
        return templates.TemplateResponse(
            request=request,
            name="offre-update.html",
            context=dict(method="put", offre=data, error=str(e)),
        )


@router.post("/offres/{id}/close", tags=["offres"])
async def close_offres(request: Request, id: int):
    close_query = """
    UPDATE Offre
    SET datecloture = :datecloture
    WHERE id = :id
    """
    try:
        await database.execute(
            query=close_query, values=dict(id=id, datecloture=datetime.utcnow())
        )
        return RedirectResponse(url=f"/offres/{id}", status_code=303)

    except PostgresError as e:
        return templates.TemplateResponse(
            request=request,
            name="error.html",
            context=dict(error=str(e)),
        )

@router.get("/offres/{idoffre}/pertinence", tags=["offres"])
async def get_candidats_pertinence(request: Request, idoffre: int) -> HTMLResponse:
    try:
        query = """
        SELECT cs.idCandidat, cs.score, c.nom, c.prenom, c.email, c.age, c.genre, c.numerotel, c.anneesExp
        FROM get_candidats_pertinents(:idoffre) cs
        JOIN View_Candidat c ON cs.idCandidat = c.id
        ORDER BY cs.score DESC;
        """
        candidats = await database.fetch_all(query, values={"idoffre": idoffre})
        
        query_offre = "SELECT * FROM View_Offre WHERE id = :idoffre;"
        offre = await database.fetch_one(query_offre, values={"idoffre": idoffre})
        
        return templates.TemplateResponse(
            "offre-pertinence.html",
            {"request": request, "offre": dict(offre), "candidats": [dict(c) for c in candidats]},
        )
    except PostgresError as e:
        return templates.TemplateResponse(
            request=request,
            name="error.html",
            context=dict(error=str(e)),
        )