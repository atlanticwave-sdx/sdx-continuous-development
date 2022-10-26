''' routes '''
from .topology import TopologiesApi, TopologyApi


def initialize_routes(api):
    ''' routes api '''
    api.add_resource(TopologiesApi, '/api/topology')
    api.add_resource(TopologyApi, '/api/topology/<id>')
