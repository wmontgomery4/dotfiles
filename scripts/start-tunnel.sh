#!/usr/bin/env bash

function showUsage() {
  echo "This script is intended to make it easy to set up a repeatable reverse SSH tunnel."
  echo "* Usage: script TUNNEL_DST_PORT"
  echo "* If TUNNEL_DST_PORT is set in the environment,it will be used if no argument is provided."
  echo "* It's recommended to set TUNNEL_WAN_IP, TUNNEL_USER, and TUNNEL_WAN_PORT in your .bashrc."
  echo "* The companion for this script is tunnel.sh."
  echo "* It is also necessary to set up SSH key authentication between this box and the edge box to use "
  echo "  this script. See the man page for ssh-copy-id for more information."
  exit 1
}

if [ "$#" -gt "0" ] && [ "$1" == "-h" ]; then
  showUsage
  exit 0
fi

if [ "$#" -gt 0 ]; then
  TUNNEL_DST_PORT=$1
fi

if [ -z "$TUNNEL_WAN_IP" ]; then
  echo "The environment variable TUNNEL_WAN_IP must be set. You should probably define it in your .bashrc"
  showUsage
  exit 1
fi

if [ -z "$TUNNEL_USER" ]; then
  echo "The environment variable TUNNEL_USER must be set. You should probably define it in your .bashrc"
  showUsage
  exit 1
fi

if [ -z "$TUNNEL_WAN_PORT" ]; then
  echo "The environment variable TUNNEL_WAN_PORT must be set. You should probably define it in your .bashrc"
  showUsage
  exit 1
fi

if [ -z "$LOCAL_SSH_PORT" ]; then
  LOCAL_SSH_PORT=22
fi

AUTOSSH_LOGFILE="$HOME/autossh.log" autossh -f -M 0 -p $TUNNEL_WAN_PORT -N -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -o ExitOnForwardFailure=yes -R \*:$PORT_TO_USE:localhost:$LOCAL_SSH_PORT $TUNNEL_USER@$TUNNEL_WAN_IP
