""" topology """
from flask import Response, request
from flask_restful import Resource
from database.models import Topology


class TopologiesApi(Resource):
    ''' Topologies '''
    def get(self):
        ''' topology list '''
        topologies = Topology.objects().to_json()
        return Response(topologies, mimetype="application/json", status=200)

    def post(self):
        ''' topology create '''
        body = request.get_json()
        topology = Topology(**body).save()
        topology_id = topology.id
        return {'id': str(topology_id)}, 200


class TopologyApi(Resource):
    ''' topology '''
    def put(self, topology_id):
        ''' topology update '''
        body = request.get_json()
        Topology.objects.get(id=topology_id).update(**body)
        return '', 200
    
    def delete(self, topology_id):
        ''' topology delete '''
        topology = Topology.objects.get(id=topology_id).delete()
        return topology, 200

    def get(self, topology_id):
        ''' topology get '''
        topology = Topology.objects.get(id=topology_id).to_json()
        return Response(topology, mimetype="application/json", status=200)
