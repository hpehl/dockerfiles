# WildFly Monitor Demo

This repository contains a couple of Dockerfiles and a [JMeter](http://jmeter.apache.org/) configuration to demonstrate the monitoring of JEE applications in WildFly. The monitoring is done using the [wildfly-monitor](https://github.com/rhq-project/wildfly-monitor) subsystem with InfluxDB configured as a storage adapter (see https://github.com/rhq-project/wildfly-monitor/wiki/InfluxDB for more details).

## Docker Images

### InfluxDB & Grafana

The monitoring is done using InfluxDB and Grafana. The docker image `hpehl/influx-grafana` starts an InfluxDB instance and a [Grafana](http://grafana.org/) dashboard with metrics for the monitored resources. 

    docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 --name=influx hpehl/influx-grafana

### WildFly

WildFly is started in domain mode using the [hpehl/wildfly-domain](https://registry.hub.docker.com/u/hpehl/wildfly-domain/) docker image. Please use the following commands to setup a domain with one domain controller and two host controller:

    docker run -d -p 9990:9990 --name=domain-master hpehl/wildfly-domain --host-config host-master.xml -b 0.0.0.0 -bmanagement 0.0.0.0
    docker run --rm -it -p 8080 --link domain-master:domain-controller -e SERVER_GROUP=other-server-group hpehl/wildfly-domain --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0
    docker run --rm -it -p 8080 --link domain-master:domain-controller -e SERVER_GROUP=other-server-group hpehl/wildfly-domain --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0

## Deployments

TBD

## JMeter

TBD
