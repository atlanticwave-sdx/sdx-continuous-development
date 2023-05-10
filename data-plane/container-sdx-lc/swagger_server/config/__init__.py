""" os env config """
import os
from dataclasses import dataclass
from dotenv import load_dotenv
load_dotenv()


@dataclass
class BaseConfig():
    """My base class."""
    MONGODB_CONNSTRING = os.getenv(
            'MONGODB_CONNSTRING',
            'mongodb://127.0.0.1:27017/?authSource=admin')
    DEBUG = True


@dataclass
class DevelopmentConfig(BaseConfig):
    """My Development class."""
    flask_env: str = 'development'
    debug: bool = False
    secret_key = os.getenv('SECRET_KEY', default='BAD_SECRET_KEY')


@dataclass
class TestingConfig(BaseConfig):
    """My Test class."""
    testing: bool = True


@dataclass
class ProductionConfig(BaseConfig):
    """My Production class."""
    debug: bool = False
