#!/bin/sh -e
[ "$1" = 'node-red' ] && { chown -R nodered . ; exec gosu nodered "$@" ; } || :
exec "$@"
