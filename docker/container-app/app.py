""" Main app """
from flask import Flask
from flask_restful import Api
from database.db import initialize_db
from route.routes import initialize_routes

app = Flask(__name__)
api = Api(app)


app.config['MONGODB_SETTINGS'] = {
    'db': 'sdx',
    'host': '192.168.0.10',
    'port': 27017,
    'username': 'usr_mongodb',
    'password': 'pwd_mongodb',
    'authentication_source': 'admin'
}

app.config['MONGODB_CONNECT'] = False

initialize_db(app)
initialize_routes(api)


if __name__ == "__main__":
    app.run(debug=True, port=8800)
