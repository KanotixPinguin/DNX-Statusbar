#!/bin/bash

if [ -z "$1" ]; then
 echo
 echo "Usage:"
 echo "bash uninstall.sh <container-name>"
 echo
 echo "Examples:"
 echo "bash uninstall.sh owrx-8010"
 echo "bash uninstall.sh owrx-8011"
 echo "bash uninstall.sh owrx-8015"
 echo
 exit 1
fi

CONTAINER="$1"

echo
echo "=== DNX STATUSBAR REMOVE ==="
echo "Container: $CONTAINER"
echo

docker exec "$CONTAINER" sed -i '/dnx_status.js/d' /usr/lib/python3/dist-packages/htdocs/index.html

docker exec "$CONTAINER" rm -f /usr/lib/python3/dist-packages/htdocs/static/dnx_status.js

docker restart "$CONTAINER"

echo
echo "DNX Statusbar removed."
echo
