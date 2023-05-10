""" Initializing mongo db """
import logging
import os

import pymongo

DB_NAME = os.environ.get("AMLIGHT_DB")
USER_COLLECTION = os.environ.get("USER_COLLECTION")
TOPOLOGY_COLLECTION = os.environ.get("TOPOLOGY_COLLECTION")
MONGODB_CONNSTRING = os.environ.get("MONGODB_CONNSTRING")
ROOT_MONGO_USER = os.environ.get("ROOT_MONGO_USER")
ROOT_MONGO_PASS = os.environ.get("ROOT_MONGO_PASS")


class DbUtils():
    """ Initializing db class """
    def __init__(self):
        self.db_name = DB_NAME
        self.user_collection = USER_COLLECTION
        self.topology_collection = TOPOLOGY_COLLECTION
        self.mongo_client = pymongo.MongoClient(MONGODB_CONNSTRING)
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.DEBUG)
        self.logger.debug("Trying to load db: %s", self.db_name)
        self.logger.debug("Client: %s", self.mongo_client)
        self.logger.debug("string: %s", MONGODB_CONNSTRING)
        self.sdxdb = self.mongo_client[self.db_name]

    def initialize_db(self):
        """Init database"""
        self.logger.debug("######## Initializing Mongo DB ########")
        self.logger.debug("Initializing ... %s from DB", self.db_name)

        if self.db_name not in self.mongo_client.list_database_names():
            self.logger.debug("%s db does not exist!", self.db_name)
            self.sdxdb = self.mongo_client[self.db_name]
            self.logger.debug("DB %s initialized!", self.sdxdb)

        if self.user_collection not in self.sdxdb.list_collection_names():
            self.logger.debug(
                    "%s collection does not exist!", self.user_collection)
            user_colt = self.mongo_client[self.db_name][self.user_collection]
            self.logger.debug("Collection %s initialized!", user_colt)
        if self.topology_collection not in self.sdxdb.list_collection_names():
            self.logger.debug(
                    "%s collection does not exist from DB",
                    self.topology_collection)
            tp_colt = self.mongo_client[self.db_name][self.topology_collection]
            self.logger.debug("Collection %s initialized!", tp_colt)
        self.logger.debug("DB %s initialized", self.db_name)
        self.logger.debug(
                "Collections %s initialized", self.sdxdb.list_collection_names(
                    ))

    def add_key_value_pair_to_db(self, key, value):
        """Add key value pair to database"""
        obj = self.read_from_db(key)
        if obj is None:
            self.logger.debug("Adding key value pair %s:%s to DB.", key, value)
            return self.sdxdb[self.db_name][self.user_collection].insert_one(
                {key: value}
            )

        query = {"_id": obj["_id"]}
        self.logger.debug("Updating DB entry %s:%s.", key, value)
        result = self.sdxdb[self.db_name][self.user_collection].replace_one(
            query, {key: value}
        )
        return result

    def read_from_db(self, key):
        """Given a user specified key, return the value stored in database"""
        return self.sdxdb[self.db_name][self.user_collection].find_one(
            {key: {"$exists": 1}}
        )
