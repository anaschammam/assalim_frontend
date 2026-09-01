#!/bin/sh
set -e

BACKEND_HOST="${BACKEND_HOST:-assalim-backend.railway.internal}"
BACKEND_PORT="${BACKEND_PORT:-8080}"

echo "Waiting for backend DNS: ${BACKEND_HOST}..."
until getent hosts "${BACKEND_HOST}" > /dev/null 2>&1; do
  sleep 2
done
echo "Backend DNS ready."

exec /docker-entrypoint.sh nginx -g "daemon off;"
