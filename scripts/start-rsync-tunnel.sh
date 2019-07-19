#!/bin/bash

# Inputs: host, port
function checkOpen() {
   perlCode='exit(! defined( IO::Socket::INET->new(PeerHost => "'$1'", PeerPort => '$2', Timeout => 3)))'
   perl -MIO::Socket::INET -e "$perlCode"
}

if [ $(checkOpen $TUNNEL_WAN_IP $TUNNEL_WAN_PORT; echo $?) -eq 0 ]; then
  PORT=$TUNNEL_WAN_PORT
  IP=$TUNNEL_WAN_IP
elif [ $(checkOpen $TUNNEL_LAN_IP $TUNNEL_LAN_PORT; echo $?) -eq 0 ]; then
  PORT=$TUNNEL_LAN_PORT
  IP=$TUNNEL_LAN_IP
else
   echo "Couldn't connect to proxy host."
fi

mkdir -p /tmp/rsync-share
ssh -p $PORT $TUNNEL_USER@$IP -t "mkdir -p /tmp/rsync-share"

while [ 1 ]; do
  rsync --delete -avuz -e "ssh -p $PORT" $TUNNEL_USER@$IP:/tmp/rsync-share /tmp/rsync-share/
  sleep 5
done
