#!/usr/bin/env bash

if [ "$#" -lt "1" ]; then
  echo "This script is intended to make it easy to set up a repeatable reverse SSH tunnel."
  echo "* It's recommended to set TUNNEL_WAN_IP, TUNNEL_USER_NAME, and TUNNEL_WAN_PORT in your .bashrc."
  echo "* The companion for this script is tunnel.sh."
  echo "* It is also necessary to set up SSH key authentication between this box and the edge box to use "
  echo "  this script. See the man page for ssh-copy-id for more information."
  echo "* One argument is required: the port on which to open the reverse tunnel on the edge box. This is"
  echo "  an input because despite autossh, a tunnel can go stale and it's often necessary to switch ports."
  exit 1
fi
PORT_TO_USE=$1
if [ -z "$TUNNEL_WAN_IP" ]; then
  echo The environment variable TUNNEL_WAN_IP must be set. You should probably define it in your .bashrc
  exit 1
fi

if [ -z "$TUNNEL_USER_NAME" ]; then
  echo The environment variable TUNNEL_USER_NAME must be set. You should probably define it in your .bashrc
  exit 1
fi

if [ -z "$TUNNEL_WAN_PORT" ]; then
  echo The environment variable TUNNEL_WAN_PORT must be set. You should probably define it in your .bashrc
  exit 1
fi

if [ ! -z "$TUNNEL_WAN_PORT" ]; then
  LOCAL_SSH_PORT=22
fi

AUTOSSH_LOGFILE="$HOME/autossh.log" autossh -f -M 0 -p $TUNNEL_WAN_PORT -N -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -o ExitOnForwardFailure=yes -R \*:$PORT_TO_USE:localhost:$LOCAL_SSH_PORT $TUNNEL_USER_NAME@$TUNNEL_WAN_IP
