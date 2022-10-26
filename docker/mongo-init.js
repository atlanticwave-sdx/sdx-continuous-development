db.auth('admin', 'admin')

db = db.getSiblingDB('sdx')

db.createUser(
  {
    user: "usr_mongodb",
    pwd: "pwd_mongodb",
    roles: [
        {
          role: "readWrite",
          db: "sdx"
        }
    ]
  }
);
