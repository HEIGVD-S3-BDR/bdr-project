import asyncio

from config import DATABASE_URL
from databases import Database

database = Database(DATABASE_URL)


async def connect():
    for _ in range(6):
        try:
            await database.connect()
            print("Database connected!")
            break
        except ConnectionRefusedError:
            print("Database connection failed. Retrying in 5 seconds...")
            await asyncio.sleep(5)
