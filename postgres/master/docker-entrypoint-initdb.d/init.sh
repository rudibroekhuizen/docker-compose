#/bin/bash

echo "include_dir = '/conf.d'" >> /pgdata/postgresql.conf
echo "host replication postgres 0.0.0.0/0 trust" >> "$PGDATA/pg_hba.conf"
