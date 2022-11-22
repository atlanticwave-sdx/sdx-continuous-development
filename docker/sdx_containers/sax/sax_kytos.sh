#!/bin/sh
HOSTS_ENTRY="192.168.0.6 mongo1t"
COUNT=$(cat /etc/hosts | grep -c "$HOSTS_ENTRY")
if [ $COUNT -eq 0 ]; then
  echo "$HOSTS_ENTRY" >> /etc/hosts
fi

HOSTS_ENTRY="192.168.0.7 mongo2t"
COUNT=$(cat /etc/hosts | grep -c "$HOSTS_ENTRY")
if [ $COUNT -eq 0 ]; then
  echo "$HOSTS_ENTRY" >> /etc/hosts
fi

HOSTS_ENTRY="192.168.0.8 mongo3t"
COUNT=$(cat /etc/hosts | grep -c "$HOSTS_ENTRY")
if [ $COUNT -eq 0 ]; then
  echo "$HOSTS_ENTRY" >> /etc/hosts
fi

exec kytosd -l 192.168.0.3 -f
