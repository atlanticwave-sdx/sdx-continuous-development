''' Mongo db init '''
from flask_mongoengine import MongoEngine

db = MongoEngine()


def initialize_db(app):
    ''' db init '''
    db.init_app(app)
