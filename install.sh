#!/bin/bash

if [ -z "$1" ]; then
 echo
 echo "Usage:"
 echo "bash install.sh <container-name>"
 echo
 echo "Examples:"
 echo "bash install.sh owrx-8010"
 echo "bash install.sh owrx-8011"
 echo "bash install.sh owrx-8015"
 echo
 exit 1
fi

CONTAINER="$1"

echo
echo "=== DNX STATUSBAR INSTALL ==="
echo "Container: $CONTAINER"
echo

docker cp dnx_status.js "$CONTAINER":/usr/lib/python3/dist-packages/htdocs/static/dnx_status.js

docker exec "$CONTAINER" sh -c 'grep -q dnx_status.js /usr/lib/python3/dist-packages/htdocs/index.html || sed -i "s#</body>#<script src=\"/static/static/dnx_status.js\"></script>\n</body>#" /usr/lib/python3/dist-packages/htdocs/index.html'

docker restart "$CONTAINER"

echo
echo "DNX Statusbar installed."
echo
