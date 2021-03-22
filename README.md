# docker-mongodb-oplog

Simple mongodb image with single-node replicaset enabled.

### This image is unsecured, binds to all open interfaces and does not includes any authentication process. It it strictly meant for developement, DO NOT use for production.  

ReplicaSet name: `rs0`.

```
MONGO_URL=mongodb://<hostname>/my_database?replicaSet=rs0
MONGO_URL_OPLOG=mongodb://<hostname>/local?replicaSet=rs0
```

