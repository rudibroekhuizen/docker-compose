#/bin/bash
set -e

sudo -u postgres /usr/lib/postgresql/9.6/bin/pg_ctl -D $PGDATA promote
