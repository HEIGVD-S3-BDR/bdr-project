from typing import Annotated

from asyncpg import PostgresError
from fastapi import Form, Request
from fastapi.responses import HTMLResponse, RedirectResponse

from config import templates
from db import database
from models import CandidatCreate
from routes import router


@router.get("/")
async def home(request: Request) -> HTMLResponse:
    return templates.TemplateResponse(request=request, name="base.html")


@router.get("/candidats", tags=["candidats"])
async def get_candidats(request: Request, idoffre: int | None = None) -> HTMLResponse:
    try:
        if idoffre is None:
            query = "SELECT * FROM View_Candidat;"
            data = await database.fetch_all(query=query)
        else:
            query = "SELECT * FROM View_Candidat INNER JOIN Candidat_Offre ON View_Candidat.id = Candidat_Offre.idcandidat WHERE Candidat_Offre.idoffre = :idoffre;"
            data = await database.fetch_all(query=query, values=dict(idoffre=idoffre))
        data = [dict(record) for record in data]
        return templates.TemplateResponse(
            request=request, name="candidats.html", context=dict(candidats=data)
        )

    except PostgresError as e:
        return templates.TemplateResponse(
            request=request, name="error.html", context=dict(error=str(e))
        )


@router.get("/candidats/{id}", tags=["candidats"])
async def get_candidats_detail(request: Request, id: int) -> HTMLResponse:
    try:
        query_candidat = "SELECT * FROM View_Candidat WHERE id = :id;"
        query_offres_candidat = """SELECT * FROM Candidat_Offre co
        INNER JOIN Offre ON co.idoffre = Offre.id
        INNER JOIN View_Offre_Score vos on co.idoffre = vos.idOffre
        WHERE co.idcandidat = :id;
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
    return templates.TemplateResponse(
        request=request,
        name="candidat-update.html",
        context=dict(method="post", candidat=None),
    )


@router.get("/candidat/{id}/edit", tags=["candidats"])
async def get_candidats_update(request: Request, id: int) -> HTMLResponse:
    try:
        query = "SELECT * FROM View_Candidat WHERE id = :id;"
        data = await database.fetch_one(query=query, values=dict(id=id))
        return templates.TemplateResponse(
            request=request,
            name="candidat-update.html",
            context=dict(method="put", candidat=dict(data)),
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
        FROM inserted_adresse, inserted_personne;
        """

        await database.execute(
            query=insert_full_query,
            values=data.dict(),
        )

        return RedirectResponse("/candidats", status_code=303)
    except PostgresError as e:
        return templates.TemplateResponse(
            request=request,
            name="candidat-update.html",
            context=dict(method="post", candidat=data, error=str(e)),
        )


@router.post("/candidats/{id}/edit", tags=["candidats"])
async def put_candidats(
    request: Request,
    id: int,
    data: Annotated[CandidatCreate, Form()],
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
            values=dict(id=id, idadresse=idadresse, **data.dict()),
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