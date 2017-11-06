#/bin/bash
set -e

if [ $ROLE = "slave" ]; then

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

  pg_ctl -D "$PGDATA" -w start

#elif [ $ROLE = "master" ]; then

#  echo $ROLE > /tmp/aap

fi
#sudo -u postgres /usr/lib/postgresql/9.6/bin/pg_ctl -D "$PGDATA" promote
