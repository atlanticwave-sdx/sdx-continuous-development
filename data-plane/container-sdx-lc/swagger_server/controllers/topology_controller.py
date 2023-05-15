import connexion
import six

from swagger_server.models.error_message import ErrorMessage  # noqa: E501
from swagger_server.models.new_topology import NewTopology  # noqa: E501
from swagger_server.models.topology import Topology  # noqa: E501
from swagger_server import util


def add_topology(body):  # noqa: E501
    """Send a new topology to SDX-LC

    Create a topology # noqa: E501

    :param body: placed for adding a new topology
    :type body: dict | bytes

    :rtype: Topology
    """
    if connexion.request.is_json:
        body = NewTopology.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def delete_topology(topology_id):  # noqa: E501
    """delete_topology

    Delete a specific topology # noqa: E501

    :param topology_id: The id of the topology to delete
    :type topology_id: str

    :rtype: None
    """
    return 'do some magic!'


def find_topology(tags=None, limit=None):  # noqa: E501
    """find_topology

    Returns topology from the system that the user has access to  # noqa: E501

    :param tags: tags to filter by
    :type tags: List[str]
    :param limit: maximum number of results to return
    :type limit: int

    :rtype: List[Topology]
    """
    return 'do some magic!'


def show_topology_by_id(topology_id):  # noqa: E501
    """show_topology_by_id

    Info for a specific topology # noqa: E501

    :param topology_id: The id of the topology to retrieve
    :type topology_id: str

    :rtype: Topology
    """
    return 'do some magic!'
