from asyncpg import PostgresError
from fastapi import Request

from db import database
from routes import router
from routes.utils import error


@router.get("/interactions", tags=["interactions"])
async def get_interactions(request: Request):
    try:
        # TODO: Create views for each interaction type and make 3 queries here
        query = "SELECT * FROM interaction"
        data = await database.fetch_all(query=query)
        return [dict(record) for record in data]

    except PostgresError as e:
        return error(str(e))
