''' models '''
# pylint: disable=no-member
import datetime
from .db import db


class Topology(db.Document):
    ''' Topology class '''
    name = db.StringField(required=True, unique=True)
    version = db.IntField()
    model_version = db.StringField(required=True)
    timestamp = db.DateTimeField(default=datetime.datetime.utcnow)
