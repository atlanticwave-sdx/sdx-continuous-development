print('#################### Start Creating Databases ####################');

db.auth('root_user', 'root_pwd')

db = db.getSiblingDB('amlight')

db.createUser(
  {
    user: "amlight_user",
    pwd: "amlight_pwd",
    roles: [
        {
          role: "readWrite",
          db: "amlight"
        }
    ]
  }
);

db = db.getSiblingDB('sax')

db.createUser(
  {
    user: "sax_user",
    pwd: "sax_pwd",
    roles: [
        {
          role: "readWrite",
          db: "sax"
        }
    ]
  }
);

db = db.getSiblingDB('tenet')

db.createUser(
  {
    user: "tenet_user",
    pwd: "tenet_pwd",
    roles: [
        {
          role: "readWrite",
          db: "tenet"
        }
    ]
  }
);
