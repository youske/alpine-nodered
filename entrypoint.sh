#!/bin/sh -e
if [ "$1" = 'node-red' ] ; then
  chown -R nodered .
  exec gosu nodered "$@"
fi
exec "$@"
