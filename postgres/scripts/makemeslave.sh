# Stop Postgres
sudo -u postgres /usr/lib/postgresql/9.6/bin/pg_ctl -D "$PGDATA" -m fast -w stop

# Make sure standby's data directory is empty
rm -r "$PGDATA"/*

sudo -u postgres pg_basebackup \
  --write-recovery-conf \
  --pgdata=$PGDATA \
  --xlog-method=fetch \
  --host=$POSTGRES_MASTER \
  --username=$REPLICATION_USER \
  --port=5432 \
  --progress \
  --verbose

# useless postgres start to fullfil docker-entrypoint.sh stop
sudo -u postgres /usr/lib/postgresql/9.6/bin/pg_ctl -D "$PGDATA" -w start
