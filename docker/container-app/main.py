"""NApp responsible for sdx topology management."""
import time
from celery import Celery
from flask import Flask
# from flask_restx import Resource, Api

app = Flask(__name__)

celery = Celery(
    __name__,
    broker="redis://127.0.0.1:6379/0",
    backend="redis://127.0.0.1:6379/0"
)


@app.route('/')
def hello():
    """ main function """
    return {'hello': 'world'}


@celery.task
def divide(divisor, dividend):
    """ celery task """
    time.sleep(5)
    return divisor / dividend


if __name__ == '__main__':
    app.run(debug=True)
