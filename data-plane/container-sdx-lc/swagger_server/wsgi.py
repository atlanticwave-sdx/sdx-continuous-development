""" run and manage the app from the command line """
from flask.cli import FlaskGroup
from app import app


cli = FlaskGroup(app)


if __name__ == '__main__':
    cli()

