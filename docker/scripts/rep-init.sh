mongo --host mongo1t:27027 --eval 
      '
      db = (new Mongo("localhost:27027")).getDB("test");
      config = {
      "_id" : "rs0",
      "members" : [
        {
          "_id" : 0,
          "host" : "mongo1t:27027"
        },
        {
          "_id" : 1,
          "host" : "mongo2:27028"
        },
        {
          "_id" : 2,
          "host" : "mongo3:27029"
        }
      ]
      };
      rs.initiate(config);
      '      
