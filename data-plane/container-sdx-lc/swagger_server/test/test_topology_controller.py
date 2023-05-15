# coding: utf-8

from __future__ import absolute_import

from flask import json
from six import BytesIO

from swagger_server.models.error_message import ErrorMessage  # noqa: E501
from swagger_server.models.new_topology import NewTopology  # noqa: E501
from swagger_server.models.topology import Topology  # noqa: E501
from swagger_server.test import BaseTestCase


class TestTopologyController(BaseTestCase):
    """TopologyController integration test stubs"""

    def test_add_topology(self):
        """Test case for add_topology

        Send a new topology to SDX-LC
        """
        body = NewTopology()
        response = self.client.open(
            '/topology',
            method='POST',
            data=json.dumps(body),
            content_type='application/json')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_delete_topology(self):
        """Test case for delete_topology

        
        """
        response = self.client.open(
            '/topology/{topologyId}'.format(topology_id='topology_id_example'),
            method='DELETE')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_find_topology(self):
        """Test case for find_topology

        
        """
        query_string = [('tags', 'tags_example'),
                        ('limit', 56)]
        response = self.client.open(
            '/topology',
            method='GET',
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_show_topology_by_id(self):
        """Test case for show_topology_by_id

        
        """
        response = self.client.open(
            '/topology/{topologyId}'.format(topology_id='topology_id_example'),
            method='GET')
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    import unittest
    unittest.main()
