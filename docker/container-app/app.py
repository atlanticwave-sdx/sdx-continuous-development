""" Main app """
from flask import Flask
from flask_restful import Api
from route.routes import initialize_routes
from database.db import initialize_db

app = Flask(__name__)
api = Api(app)

app.config['MONGODB_SETTINGS'] = {
 'host': 'mongodb://localhost/sdx-topology'
}

initialize_db(app)
initialize_routes(api)


if __name__ == "__main__":
    app.run(debug=True, port=8800)
