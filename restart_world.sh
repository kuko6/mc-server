#!/bin/bash

set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

WORLD_DIR="${WORLD_DIR:-./data/world}"
SERVICE="${SERVICE:-mc}"

CMD=""
if command -v docker-compose >/dev/null 2>&1; then
  echo "using docker-compose"
  CMD="docker-compose"
# elif command -v podman-compose >/dev/null 2>&1; then
#   echo "using podman-compose"
#   CMD="podman-compose"
else
  echo "docker-compose isnt available exists"
  # echo "neither podman-compose nor docker-compose exists"
  exit 1
fi

if [[ -n "$($CMD ps -q "$SERVICE" 2>/dev/null || true)" ]]; then
  $CMD down
fi
echo "Deleting old world"
rm -rf -- "${WORLD_DIR}"
$CMD up -d
