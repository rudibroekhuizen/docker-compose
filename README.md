# docker-compose
Docker compose 

docker-compose-em.yml:
sysctl -q -w vm.max_map_count=262144
docker exec dockercompose_metricbeat_1 sh -c './scripts/import_dashboards -es $ELASTICSEARCH_URL'
