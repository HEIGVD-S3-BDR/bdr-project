import functools

from flask import (
    Blueprint,
    flash,
    g,
    redirect,
    render_template,
    request,
    session,
    url_for,
)

from .db import get_db

bp = Blueprint("auth", __name__, url_prefix="/auth")


def login_required(view):
    """View decorator that redirects anonymous users to the login page."""

    @functools.wraps(view)
    def wrapped_view(**kwargs):
        if g.customer is None:
            return redirect(url_for("auth.login"))

        return view(**kwargs)

    return wrapped_view


@bp.before_app_request
def load_logged_in_customer():
    """If a customer id is stored in the session, load the user object from
    the database into ``g.customer``."""
    customer_id = session.get("customer_id")

    if customer_id is None:
        g.customer = None
    else:
        db = get_db()
        g.customer = db.execute(
            "SELECT * FROM pagila.customer WHERE customer_id = %s", (customer_id,)
        ).fetchone()


@bp.route("/login", methods=("GET", "POST"))
def login():
    """Log in a registered customer by adding the customer id to the session."""
    if request.method == "POST":
        email = request.form["email"]

        db = get_db()
        error = None
        customer = db.execute(
            "SELECT * FROM pagila.customer WHERE email = %s", (email,)
        ).fetchone()

        if customer is None:
            error = "Incorrect email."

        if error is None:
            # store the customer id in a new session and return to the index
            session.clear()
            session["customer_id"] = customer.customer_id
            return redirect(url_for("index"))

        flash(error)

    return render_template("auth/login.html")


@bp.route("/logout")
def logout():
    """Clear the current session, including the stored user id."""
    session.clear()
    return redirect(url_for("index"))
