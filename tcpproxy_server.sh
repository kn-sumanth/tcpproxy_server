#!/usr/bin/env sh
set -e
echo $@
TARGET_IP=$(getent ahosts $3 | awk '{ print $1}' | sed -n 1p)
SOURCE_IP=$(getent ahosts $1 | awk '{ print $1}' | sed -n 1p)
exec "./tcpproxy_server" "$SOURCE_IP" "$2" "$TARGET_IP" "$4" "$5"
