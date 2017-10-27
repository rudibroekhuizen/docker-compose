# stop postgres instance and reset PGDATA,
# confs will be copied by pg_basebackup
pg_ctl -D "$PGDATA" -m fast -w stop

# make sure standby's data directory is empty
rm -r "$PGDATA"/*

pg_basebackup \
  --write-recovery-conf \
  --pgdata="$PGDATA" \
  --xlog-method=fetch \
  --host=master \
  --username=postgres \
  --port=5432 \
  --progress \
  --verbose

# useless postgres start to fullfil docker-entrypoint.sh stop
pg_ctl -D "$PGDATA" -o "-c listen_addresses=''" -w start
