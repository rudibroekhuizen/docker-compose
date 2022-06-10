#!/bin/bash
set -e

until psql -h primary -U postgres -c '\l' > /dev/null 2>&1; do
  echo "Primary database is unavailable, wait..."
  sleep 1
done

