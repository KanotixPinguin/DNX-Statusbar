#!/bin/bash

CONTAINER="${1:-owrx-8015}"

echo
echo "=== DNX STATUSBAR INSTALL ==="
echo "Container: $CONTAINER"
echo

docker cp dnx_status.js \
"$CONTAINER":/usr/lib/python3/dist-packages/htdocs/static/dnx_status.js

docker exec "$CONTAINER" sh -c '
grep -q dnx_status.js /usr/lib/python3/dist-packages/htdocs/index.html || \
sed -i "s#</body>#<script src=\"/static/static/dnx_status.js\"></script>\n</body>#" \
/usr/lib/python3/dist-packages/htdocs/index.html
'

docker restart "$CONTAINER"

echo
echo "DNX Statusbar installed."
echo
