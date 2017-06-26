FROM postgres:9.6

RUN apt-get update && \
apt-get install -y sudo vim.tiny curl wget net-tools iputils-ping && \
echo "include_dir = 'conf.d'" >> /pgdata/postgresql.conf

EXPOSE 5432
