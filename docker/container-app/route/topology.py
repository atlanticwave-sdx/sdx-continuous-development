""" topology """
from flask import Response, request
from flask_jwt_extended import jwt_required, get_jwt_identity
from flask_restful import Resource
from database.models import Topology, User
from flask_restful import Resource


class TopologiesApi(Resource):
    ''' Topologies '''
    def get(self):
        ''' topology list '''
        topologies = Topology.objects().to_json()
        return Response(topologies, mimetype="application/json", status=200)


    @jwt_required
    def post(self):
        ''' topology create '''
        user_id = get_jwt_identity()
        body = request.get_json()
        user = User.objects.get(id=user_id)
        topology = Topology(**body, added_by=user)
        topology.save()
        user.update(push__topology=topology)
        user.save()
        topology_id = topology.id
        return {'id': str(topology_id)}, 200


class TopologyApi(Resource):
    ''' topology '''
    @jwt_required
    def put(self, topology_id):
        ''' topology update '''
        user_id = get_jwt_identity()
        topology = Topology.objects.get(id=topology_id, added_by=user_id)
        body = request.get_json()
        Topology.objects.get(id=topology_id).update(**body)
        return topology, 200

    @jwt_required
    def delete(self, topology_id):
        ''' topology delete '''
        user_id = get_jwt_identity()
        topology = Topology.objects.get(id=topology_id, added_by=user_id)
        topology.delete()
        return topology, 200

    def get(self, topology_id):
        ''' topology get '''
        topology = Topology.objects.get(id=topology_id).to_json()
        return Response(topology, mimetype="application/json", status=200)
