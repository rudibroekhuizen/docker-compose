Elasticsearch, Kibana, Metricbeat

```shell
# Set map_count
sysctl -q -w vm.max_map_count=262144

# Import dashboards
docker exec 001_metricbeat_1 sh -c './scripts/import_dashboards -es $ELASTICSEARCH_URL'
```
