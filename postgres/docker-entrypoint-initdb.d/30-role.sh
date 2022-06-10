#/bin/bash

set -e

if [ $ROLE = "slave" ]; then

  # Stop Postgres
  pg_ctl -D "$PGDATA" -m fast -w stop

  # Make sure standby's data directory is empty
  rm -r "$PGDATA"/*

  # Pull pgdata files
  pg_basebackup \
    --write-recovery-conf \
    --pgdata=$PGDATA \
    --wal-method=fetch \
    --host=$POSTGRES_MASTER \
    --username=$REPLICATION_USER \
    --port=5432 \
    --progress \
    --verbose

  # Start Postgres
  pg_ctl -D "$PGDATA" -w start

fi
