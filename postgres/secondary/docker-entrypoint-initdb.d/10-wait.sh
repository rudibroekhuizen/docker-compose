#!/bin/bash
set -e

until psql -h primary -U postgres -c '\l' > /dev/null 2>&1; do
  echo "Postgres is unavailable - sleeping"
  sleep 1
done

