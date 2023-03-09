''' auth route '''
import datetime
from flask import Response, request
from flask_jwt_extended import create_access_token
from flask_restful import Resource
from database.models import User


class SignupApi(Resource):
    ''' signup '''
    def post(self):
        ''' create user '''
        body = request.get_json()
        user = User(**body)
        user.hash_password()
        user.save()
        user_id = user.id
        return {'id': str(user_id)}, 200


class LoginApi(Resource):
    ''' login '''
    def get(self):
        ''' login list '''
        users = User.objects().to_json()
        return Response(users, mimetype="application/json", status=200)

    def post(self):
        ''' login method '''
        body = request.get_json()
        user = User.objects.get(email=body.get('email'))
        authorized = user.check_password(body.get('password'))
        if not authorized:
            return {'error': 'Email or password invalid'}, 401

        expires = datetime.timedelta(days=7)
        access_token = create_access_token(identity=str(user.id), expires_delta=expires)
        return {'token': access_token}, 200
