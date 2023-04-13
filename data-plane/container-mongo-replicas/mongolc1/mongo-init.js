
lc_db = db.getSiblingDB('sdx_lc');

lc_db.createUser(
  {
    user: "sdx_user",
    pwd: "sdx_pwd",
    roles: [{ role: "readWrite", db: "sdx_lc" }],
  },
);
db.createCollection('users');
db.createCollection('topology');
