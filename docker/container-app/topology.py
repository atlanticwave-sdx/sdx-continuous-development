"""NApp responsible for sdx topology management."""
from flask import Flask
from flask_restx import Resource, Api

app = Flask(__name__)
api = Api(app)


class Topology(Resource):
    """ topology mock """
    # pylint: disable=R0201
    def get(self):
        """ return json data """
        return {
            "id": "urn:sdx:topology:amlight.net",
            "name": "AmLight-OXP",
            "version": 1,
            "model_version": "1.0.0",
            "timestamp": "2000-01-23T04:56:07Z",
            "links": [
                {
                    "id": "urn:sdx:link:amlight:B1:B2",
                    "name": "amlight_B1_B2",
                    "ports": [
                        "urn:sdx:port:amlight.net:B1:2",
                        "urn:sdx:port:amlight.net:B2:2",
                    ],
                    "type": "inter",
                    "bandwidth": 125000000,
                    "residual_bandwidth": 100,
                    "latency": 146582.15146899645,
                    "packet_loss": 59.621339166831824,
                    "availability": 56.37376656633328,
                    "status": "up",
                    "state": "enabled"
                },
                {
                    "id": "urn:sdx:link:amlight:A1:B1",
                    "name": "amlight_A1_B1",
                    "ports": [
                        "urn:sdx:port:amlight.net:A1:1",
                        "urn:sdx:port:amlight.net:B1:3",
                    ],
                    "type": "inter",
                    "bandwidth": 125000000,
                    "residual_bandwidth": 100,
                    "latency": 146582.15146899645,
                    "packet_loss": 59.621339166831824,
                    "availability": 56.37376656633328,
                    "status": "up",
                    "state": "enabled"
                },
                {
                    "id": "urn:sdx:link:amlight:A1:B2",
                    "name": "amlight_A1_B2",
                    "ports": [
                        "urn:sdx:port:amlight.net:A1:2",
                        "urn:sdx:port:amlight.net:B2:3",
                    ],
                    "type": "inter",
                    "bandwidth": 125000000,
                    "residual_bandwidth": 100,
                    "latency": 146582.15146899645,
                    "packet_loss": 59.621339166831824,
                    "availability": 56.37376656633328,
                    "status": "up",
                    "state": "enabled"
                },
                {
                    "id": "urn:sdx:link:nni:Miami:Sanpaolo",
                    "name": "nni_Miami_Sanpaolo",
                    "ports": [
                        "urn:sdx:port:amlight:B1:1",
                        "urn:sdx:port:sax:B1:1",
                    ],
                    "type": "inter",
                    "bandwidth": 125000000,
                    "residual_bandwidth": 100,
                    "latency": 146582.15146899645,
                    "packet_loss": 59.621339166831824,
                    "availability": 56.37376656633328,
                    "status": "up",
                    "state": "enabled"
                },
                {
                    "id": "urn:sdx:link:nni:BocaRaton:Fortaleza",
                    "name": "nni_BocaRaton_Fortaleza",
                    "ports": [
                        "urn:sdx:port:amlight.net:B2:1",
                        "urn:sdx:port:sax:B2:1",
                    ],
                    "type": "inter",
                    "bandwidth": 125000000,
                    "residual_bandwidth": 100,
                    "latency": 146582.15146899645,
                    "packet_loss": 59.621339166831824,
                    "availability": 56.37376656633328,
                    "status": "up",
                    "state": "enabled"
                }
            ],
            "nodes": [
                {
                    "id": "urn:sdx:node:amlight.net:B1",
                    "location": {
                        "address": "Miami",
                        "latitude": 25.75633040531146,
                        "longitude": -80.37676058477908,
                        "ISO3166-2-lvl4": "US-FL"
                    },
                    "name": "amlight_Novi01",
                    "ports": [
                        {
                            "id": "urn:sdx:port:amlight:B1:1",
                            "name": "Novi01_1",
                            "node": "urn:sdx:node:amlight.net:B1",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        },
                        {
                            "id": "urn:sdx:port:amlight.net:B1:2",
                            "name": "Novi01_2",
                            "node": "urn:sdx:node:amlight.net:B1",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        },
                        {
                            "id": "urn:sdx:port:amlight.net:B1:3",
                            "name": "Novi01_3",
                            "node": "urn:sdx:node:amlight.net:B1",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        }
                    ],
                },
                {
                    "id": "urn:sdx:node:amlight.net:B2",
                    "location": {
                        "address": "BocaRaton",
                        "latitude": 26.381437356374075,
                        "longitude": -80.10225977485742,
                        "ISO3166-2-lvl4": "US-FL"
                    },
                    "name": "amlight_Novi02",
                    "ports": [
                        {
                            "id": "urn:sdx:port:amlight.net:B2:1",
                            "name": "Novi02_1",
                            "node": "urn:sdx:node:amlight.net:B2",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        },
                        {
                            "id": "urn:sdx:port:amlight.net:B2:2",
                            "name": "Novi02_2",
                            "node": "urn:sdx:node:amlight.net:B2",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        },
                        {
                            "id": "urn:sdx:port:amlight.net:B2:3",
                            "name": "Novi02_3",
                            "node": "urn:sdx:node:amlight.net:B2",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        }
                    ],
                },
                {
                    "id": "urn:sdx:node:amlight.net:A1",
                    "location": {
                        "address": "redclara",
                        "latitude": 30.34943181039702,
                        "longitude": -81.66666016473143,
                        "ISO3166-2-lvl4": "US-FL"
                    },
                    "name": "amlight_Novi100",
                    "ports": [
                        {
                            "id": "urn:sdx:port:amlight.net:A1:1",
                            "name": "Novi100_1",
                            "node": "urn:sdx:node:amlight.net:A1",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        },
                        {
                            "id": "urn:sdx:port:amlight.net:A1:2",
                            "name": "Novi100_2",
                            "node": "urn:sdx:node:amlight.net:A1",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        }
                    ],
                },
                {
                    "id": "urn:sax:node:ampath.net:B1",
                    "location": {
                        "address": "Sao Paulo, Brazil",
                        "latitude": -23.549421623110316,
                        "longitude": -46.63699698680052,
                        "ISO3166-2-lvl4": "BR-SP"
                    },
                    "name": "sax_sw1",
                    "ports": [
                        {
                            "id": "urn:sax:port:ampath.net:B1:1",
                            "name": "Saxsw1_1",
                            "node": "urn:sax:node:ampath.net:B1",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        },
                        {
                            "id": "urn:sax:port:ampath.net:B1:2",
                            "name": "Saxsw1_2",
                            "node": "urn:sax:node:ampath.net:B1",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        }
                    ],
                },
                {
                    "id": "urn:tenet:node:tenet.ac.za:B1",
                    "location": {
                        "address": "Cape Town, Western Cape",
                        "latitude": -34.00315245,
                        "longitude": 18.467604352310875,
                        "ISO3166-2-lvl4": "ZA-WC"
                    },
                    "name": "tenet_sw1",
                    "ports": [
                        {
                            "id": "urn:tenet:port:tenet.ac.za:B1:1",
                            "name": "Tenetsw1_1",
                            "node": "urn:tenet:node:tenet.ac.za:B1",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        },
                        {
                            "id": "urn:tenet:port:tenet.ac.za:B1:2",
                            "name": "Tenetsw1_2",
                            "node": "urn:tenet:node:tenet.ac.za:B1",
                            "type": "10GE",
                            "status": "up",
                            "state": "enabled"
                        }
                    ],
                }
            ],
        }


api.add_resource(Topology, '/topology')

if __name__ == '__main__':
    app.run(debug=True)
