# Stop Postgres
pg_ctl -D "$PGDATA" -m fast -w stop

# Make sure standby's data directory is empty
rm -r "$PGDATA"/*

pg_basebackup \
  --write-recovery-conf \
  --pgdata=$PGDATA \
  --xlog-method=fetch \
  --host=$POSTGRES_MASTER \
  --username=$REPLICATION_USER \
  --port=5432 \
  --progress \
  --verbose

# useless postgres start to fullfil docker-entrypoint.sh stop
#pg_ctl -D "$PGDATA" -o "-c listen_addresses=''" -w start
pg_ctl -D "$PGDATA" -w start
