db.auth('admin-user', 'admin-password')

db = db.getSiblingDB('sdx')

db.createUser(
  {
    user: "lmarinve",
    pwd: "lmarinve_2022",
    roles: [
        {
          role: "readWrite",
          db: "sdx"
        }
    ]
  }
);
