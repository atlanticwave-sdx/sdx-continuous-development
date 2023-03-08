"""NApp responsible for sdx topology management."""
from flask import Flask


app = Flask(__name__)


@app.route('/')
def index():
    return 'Hello World!'
