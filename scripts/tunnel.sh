#!/usr/bin/env bash
# Inputs: host, port
function checkOpen() {
   perlCode='exit(! defined( IO::Socket::INET->new(PeerHost => "'$1'", PeerPort => '$2', Timeout => 3)))'
   perl -MIO::Socket::INET -e "$perlCode"
}

function showUsage() {
  echo "* Usage: script TUNNEL_DST_PORT  TUNNEL_DST_USER"
  echo "* TUNNEL_DST_PORT is the port on the edge box to which we will connect. This port is what was either"
  echo "  set as an environment variable or argument to start-tunnel.sh"
  echo "* TUNNEL_DST_USER  is the user name on the host that connected using start-tunnel.sh."
  echo "* If TUNNEL_DST_PORT is set, it will be taken as a the port argument if an argument is not provided."
  echo "* If TUNNEL_DST_USER is set, it will be taken as a default for port if an argumentis not provided."
  echo "* It's recommended to set TUNNEL_WAN_IP, TUNNEL_USER_NAME, TUNNEL_WAN_PORT, TUNNEL_LAN_IP, "
  echo "  TUNNEL_LAN_PORT, TUNNEL_DST_PORT, and TUNNEL_DST_USER in your .bashrc."
  echo "* The companion for this script is start-tunnel.sh."
  echo "* It is also necessary to set up SSH key authentication between this box and the edge box to use "
  echo "  this script. See the man page for ssh-copy-id for more information."
}

if [ "$#" -gt "0" ] && [ "$1" == "-h" ]; then
  showUsage
  exit 0
fi

PORT_TO_USE=$1
if [ -z "$TUNNEL_WAN_IP" ]; then
  echo "The environment variable TUNNEL_WAN_IP must be set. You should probably define it in your .bashrc"
  showUsage
  exit 1
fi

if [ -z "$TUNNEL_USER_NAME" ]; then
  echo "The environment variable TUNNEL_USER_NAME must be set. You should probably define it in your .bashrc"
  showUsage
  exit 1
fi

if [ -z "$TUNNEL_WAN_PORT" ]; then
  echo "The environment variable TUNNEL_WAN_PORT must be set. You should probably define it in your .bashrc"
  showUsage
  exit 1
fi

if [ "$#" -gt 0 ]; then
  TUNNEL_DST_PORT=$1
fi
if [ -z "$TUNNEL_DST_PORT" ]; then
  echo "The environment variable TUNNEL_DST_PORT must be set or the username must be provided as an argument."
  echo "Consider adding TUNNEL_DST_PORT to .bashrc if you're tired of typing it."
  showUsage
  exit 1
fi

if [ "$#" -gt 1 ]; then
  TUNNEL_DST_USER=$2
fi
if [ -z "$TUNNEL_DST_USER" ]; then
  echo "The environment variable TUNNEL_DST_USER must be set or the username must be provided as an argument."
  echo "Consider adding TUNNEL_DST_USER to .bashrc if you're tired of typing it."
  showUsage
  exit 1
fi

if [ $(checkOpen $TUNNEL_WAN_IP $TUNNEL_WAN_PORT; echo $?) -eq 0 ]; then
   ssh -p $TUNNEL_WAN_PORT $TUNNEL_USER_NAME@$TUNNEL_WAN_IP -t "ssh $TUNNEL_DST_USER@localhost -p $TUNNEL_DST_PORT"
elif [ $(checkOpen $TUNNEL_LAN_IP $TUNNEL_LAN_PORT; echo $?) -eq 0 ]; then
   ssh -p $TUNNEL_LAN_PORT $TUNNEL_USER_NAME@$TUNNEL_LAN_IP -t "ssh $TUNNEL_DST_USER@localhost -p $TUNNEL_DST_PORT"
else
   echo "Couldn't connect to proxy host."
fi
