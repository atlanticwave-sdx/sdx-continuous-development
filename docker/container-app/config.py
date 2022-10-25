""" Environment-specific configuration variables """
import os
from dataclasses import dataclass


@dataclass
class BaseConfig:
    """My base class."""
    testing: bool = False


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
