from flask import Flask
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

from src.config import Config

db = SQLAlchemy()
login_manager = LoginManager()
login_manager.login_view = "public.index"
login_manager.login_message_category = "danger"

def create_app(config=Config):
    app = Flask(__name__)
    app.config.from_object(config)

    CORS(app=app)
    db.init_app(app=app)
    login_manager.init_app(app=app)

    from src.public.routes import public
    from src.admin.routes import admin

    app.register_blueprint(public)
    app.register_blueprint(admin)

    return app