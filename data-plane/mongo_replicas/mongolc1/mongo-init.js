db.auth('admin_user', 'admin_pwd')

db = db.getSiblingDB('sdx')

db.createUser(
  {
    user: "sdx_user",
    pwd: "sdx_pwd",
    roles: [
        {
          role: "readWrite",
          db: "sdxlc"
        }
    ]
  }
);

