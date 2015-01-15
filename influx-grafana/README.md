# InfluxDB & Grafana

Dockerfile which starts an an InfluxDB instance and a [Grafana](http://grafana.org/) dashboard.

## Initial Database

By default a database called `grafana` is created in Influx to store the grafana configuration. If you want to setup additional databases, use the environment variable `PRE_CREATE_DB`:

    docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 -e PRE_CREATE_DB=app hpehl/influx-grafana

