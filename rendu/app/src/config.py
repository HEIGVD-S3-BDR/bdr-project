import arel
from fastapi.templating import Jinja2Templates
from jinja2 import pass_context

DEVELOPMENT = 1
DATABASE_URL = "postgresql://bdr:bdr@database:5432/db"

hotreload = arel.HotReload(
    paths=[
        arel.Path("static"),
        arel.Path("src/templates"),
    ],
)

templates = Jinja2Templates(directory="src/templates")


@pass_context
def is_current(context, path):
    request = context["request"]
    return "current" if request.url.path == path else ""


templates.env.globals["is_current"] = is_current
templates.env.globals["DEVELOPMENT"] = DEVELOPMENT
templates.env.globals["hotreload"] = hotreload
