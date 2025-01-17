#!/bin/sh

# exit early if this script has already been run
if [ -f /data/db/.repl_init_done ]; then
  exit 0
fi

host=${HOSTNAME:-$(hostname -f)}

# start mongod for configuration
mongod --replSet rs0 &
PID=$!
# wait for mongod to be started
while ! mongo --eval 'db.version()' > /dev/null 2>&1; do sleep 0.1; done

# init replset with defaults
mongo local --eval "rs.initiate({
   _id: 'rs0',
   members: [ { _id: 0, host: '$host:27017' } ]
})"

# send stop signal to mongod
kill -2 $PID
# wait for mongod to be stopped
while mongo --eval 'db.version()' > /dev/null 2>&1; do sleep 0.1; done

# make sure this script is only run once
touch /data/db/.repl_init_done
