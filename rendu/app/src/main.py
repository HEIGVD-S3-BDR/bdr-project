from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from starlette.routing import WebSocketRoute

from config import hotreload
from db import connect, database
from routes import router

app = FastAPI(
    routes=[WebSocketRoute("/hot-reload", hotreload, name="hot-reload")],
    on_startup=[hotreload.startup, connect],
    on_shutdown=[hotreload.shutdown, database.disconnect],
)
app.mount("/static", StaticFiles(directory="static", html=True), name="static")
app.include_router(router)
