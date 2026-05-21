#!/bin/bash

CONTAINER="${1:-owrx-8015}"

echo
echo "=== DNX STATUSBAR REMOVE ==="
echo "Container: $CONTAINER"
echo

docker exec "$CONTAINER" sed -i '/dnx_status.js/d' \
/usr/lib/python3/dist-packages/htdocs/index.html

docker exec "$CONTAINER" rm -f \
/usr/lib/python3/dist-packages/htdocs/static/dnx_status.js

docker restart "$CONTAINER"

echo
echo "DNX Statusbar removed."
echo
