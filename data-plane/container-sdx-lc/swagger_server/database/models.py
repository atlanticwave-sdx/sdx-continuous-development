''' models '''
# pylint: disable=no-member
import datetime
from flask_bcrypt import generate_password_hash, check_password_hash
from .db import db


class Topology(db.Document):
    ''' Topology class '''
    reference = db.StringField(required=True, unique=True)
    name = db.StringField(required=True, unique=True)
    version = db.IntField()
    model_version = db.StringField(required=True)
    timestamp = db.DateTimeField(default=datetime.datetime.utcnow)
    added_by = db.ReferenceField('User')


class User(db.Document):
    ''' user class '''
    email = db.EmailField(required=True, unique=True)
    password = db.StringField(required=True, min_length=6)
    topology = db.ListField(db.ReferenceField(
        'Topology', reverse_delete_rule=db.PULL))

    def hash_password(self):
        ''' hash '''
        self.password = generate_password_hash(self.password).decode('utf8')

    def check_password(self, password):
        ''' check '''
        return check_password_hash(self.password, password)


User.register_delete_rule(Topology, 'added_by', db.CASCADE)
