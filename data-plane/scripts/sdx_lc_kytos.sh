#!/bin/sh

sleep 60

while ! nc -z 192.168.0.6 27027; do   
  sleep 1 # wait 1 second before check for mongo1t again
done

while ! nc -z 192.168.0.7 27028; do   
  sleep 1 # wait 1 second before check for mongo2t again
done

while ! nc -z 192.168.0.8 27029; do   
  sleep 1 # wait 1 second before check for mongo3t again
done

tmux new-sess -d -s k1 kytosd -l 192.168.0.2 -f --database mongodb

touch /var/log/kytos.log
tail -f /var/log/kytos.log

# exec kytosd -l 192.168.0.2 -f --database mongodb

# tmux new-sess -d -s split-session ;\
#	tmux send-keys -t split-session.0 \
#	"kytosd -f --database mongodb" ENTER \
#	tmux send-keys -t split-session.1 \
#	"gunicorn 'swagger_server.__main__:main' -w 4 -b 0.0.0.0:8080" ENTER

# tmux new-sess -d -s k1 kytosd -f --database mongodb
# tail -f /var/log/kytos.log
