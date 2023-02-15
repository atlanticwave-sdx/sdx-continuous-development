''' routes '''
from .topology import TopologiesApi, TopologyApi
from .auth import SignupApi, LoginApi


def initialize_routes(api):
    ''' routes api '''
    api.add_resource(TopologiesApi, '/api/topology')
    api.add_resource(TopologyApi, '/api/topology/<id>')
    api.add_resource(SignupApi, '/api/auth/signup')
    api.add_resource(LoginApi, '/api/auth/login')
