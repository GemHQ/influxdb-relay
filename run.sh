set -e

docker run --name influxdb-relay -p 9096:9096 influxdb-relay

