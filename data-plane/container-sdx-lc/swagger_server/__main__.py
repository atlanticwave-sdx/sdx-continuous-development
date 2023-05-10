""" Flask main program """
import os
from flask import Flask
from swagger_ui_bundle import swagger_ui_3_path
import connexion
from swagger_server.database import db
from swagger_server import encoder
# from apis.rest import api, init_routes
# from config import settings
# from extensions import db, docs, exc, jwt, session
# from utils.log import configure_logging
# from utils.db_utils import DbUtils

options = {"swagger_path": swagger_ui_3_path}


def configure_app(flask_app):
    """ configure appp """
    flask_app.config.from_object(
        f"swagger_server.config.{os.getenv('APPLICATION_ENV', 'Development')}")


def init_app(flask_app: Flask):
    """ database init """
    db.init_app(flask_app)


def create_app():
    """ create appp """
    _app = connexion.App(__name__, specification_dir="./swagger/")
    _app.app.json_encoder = encoder.JSONEncoder
    _app.add_api(
        "swagger.yaml", arguments={"title": "TO-DO list"}, options=options,
    )
    configure_app(_app.app)
    init_app(_app.app)
    return _app


if __name__ == '__main__':
    app = create_app()
    app.run(port=app.app.config["PORT"])

