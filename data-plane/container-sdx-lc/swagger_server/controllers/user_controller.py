""" user controller """
# import six
import os
import connexion
from flask_injector import inject
from swagger_server.models.new_user import NewUser  # noqa: E501
from swagger_server.models.user import User  # noqa: E501
# from swagger_server import util
from swagger_server.database.mongo_provider import MongoProvider

data_provider = MongoProvider()


@inject
def add_user(body):  # noqa: E501
    """Create a new user to SDX-LC

    Create a user # noqa: E501

    :param body: placed for adding a new user
    :type body: dict | bytes

    :rtype: User
    """
    if connexion.request.is_json:
        body = NewUser.from_dict(connexion.request.get_json())  # noqa: E501
    return data_provider.create_user(body)


@inject
def delete_user(user_id):  # noqa: E501
    """delete_user

     # noqa: E501

    :param user_id: Numeric ID of the user to delete.
    :type user_id: str

    :rtype: None
    """
    return data_provider.delete_user(user_id)


def find_user(tags=None, limit=None):  # noqa: E501
    """find_user

    Returns users from the system that the user has access to  # noqa: E501

    :param tags: tags to filter by
    :type tags: List[str]
    :param limit: maximum number of results to return
    :type limit: int

    :rtype: List[User]
    """
    return 'do some magic!'


@inject
def read_user(user_id):  # noqa: E501
    """read_user

    Fetch a user from the database # noqa: E501

    :param user_id: Numeric ID of the user to get.
    :type user_id: str

    :rtype: User
    """
    return data_provider.read_user(user_id)


@inject
def update_user(body):  # noqa: E501
    """Update a user in SDX-LC

    Update a user # noqa: E501

    :param body: placed for adding a new user
    :type body: dict | bytes

    :rtype: User
    """
    if connexion.request.is_json:
        body = User.from_dict(connexion.request.get_json())  # noqa: E501
    return data_provider.update_user(body)
