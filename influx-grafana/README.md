# InfluxDB & Grafana

Dockerfile which starts an an InfluxDB instance and a [Grafana](http://grafana.org/) dashboard.

## Initial Database

By default a database called `grafana` is created in Influx to store the grafana configuration. If you want to setup additional databases, use the environment variable `PRE_CREATE_DB` (separated with `;`):

    docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 -e PRE_CREATE_DB=foo;bar hpehl/influx-grafana

## Environment Variables

Here's a list of all environment variables which are processed by the docker image:

- `INFLUXDB_INIT_USER`: User for InfluxDB. Defaults to "root".
- `INFLUXDB_INIT_PWD`: Password for the InfluxDB user. Defaults to "root".
- `PRE_CREATE_DB`: Initial databases for InfluxDB (do not include `grafana` as initial database as it's created by default).
