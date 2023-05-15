""" flask app with connexion and resty resolver """ 


import os
import connexion
from flask_injector import FlaskInjector
from connexion.resolver import RestyResolver
from flask_cors import CORS
from database.MongoProvider import MongoProvider
from injector import Binder


def configure(binder: Binder) -> Binder:
    """ binder function """
    binder.bind(
        MongoProvider
    )


def main():
    """ main function """
    app = connexion.App(__name__, specification_dir='./swagger/')
    CORS(app.app)
    app.add_api('swagger.yaml', resolver=RestyResolver('api'))
    FlaskInjector(app=app.app, modules=[configure])
    app.run(port=int(os.environ.get('PORT', 8080)))


if __name__ == '__main__':
    main()
