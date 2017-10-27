#/bin/bash

#echo "include_dir = '/conf.d'" >> /pgdata/postgresql.conf


if [ -n "$REPLICATE_FROM" ];then
echo "$REPLICATE_FROM" > /tmp/piet
fi

echo "$HOSTNAME" > /tmp/hostname
