from flask import Blueprint, render_template, redirect, url_for, flash, session
from flask_login import current_user, login_user, login_required, logout_user

from src import db
from src.users.models import Users

admin = Blueprint("admin", __name__)

@admin.route("/admin/dashboard", methods=["GET", "POST"])
def dashboard():
    return render_template("admin/dashboard.html")