# WildFly Monitor Demo

Quick demo of the monitoring features in WildFly based on sample JEE applications. The monitoring is done using the [wildfly-monitor](https://github.com/rhq-project/wildfly-monitor) subsystem with InfluxDB configured as a storage adapter (see https://github.com/rhq-project/wildfly-monitor/wiki/InfluxDB for more details).

## Docker Images

### InfluxDB & Grafana

The monitoring is done using InfluxDB and Grafana. Use the docker image `hpehl/influx-grafana` to start an InfluxDB instance and a [Grafana](http://grafana.org/) dashboard with metrics for the monitored resources.

    docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 --name=influx -e PRE_CREATE_DB=monitor hpehl/influx-grafana

### WildFly

WildFly is started in standalone mode based on the official `jboss/wildfly` docker image.

## Setup

TBD

## Grafana Dashboard

TBD

## JMeter

TBD
