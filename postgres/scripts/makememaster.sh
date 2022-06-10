#/bin/bash
set -e

sudo -u postgres /usr/lib/postgresql/12/bin/pg_ctl -D $PGDATA promote
