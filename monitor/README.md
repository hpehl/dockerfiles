# WildFly Monitor Demo

This repository contains a couple of Dockerfiles and a [JMeter](http://jmeter.apache.org/) configuration to demonstrate the monitoring of JEE applications in WildFly. The monitoring is done using the [wildfly-monitor](https://github.com/rhq-project/wildfly-monitor) subsystem with InfluxDB configured as a storage adapter (see https://github.com/rhq-project/wildfly-monitor/wiki/InfluxDB for more details).

## Docker Images

### InfluxDB & Grafana

The monitoring is done using InfluxDB and Grafana. The docker image `hpehl/influx-grafana` starts an InfluxDB instance and a [Grafana](http://grafana.org/) dashboard with metrics for the monitored resources. 

    docker run -d -p 8083:8083 -p 8086:8086 --name=influx hpehl/influx-grafana

Grafana: TBD

### WildFly

WildFly comes preconfigured as docker image `hpehl/wildfly-monitor`. It contains the [wildfly-monitor](https://github.com/rhq-project/wildfly-monitor) subsystem and data inputs for the heap memory and threads of the server JVMs. You can choose between standalone or domain mode. In any case you must link WildFly to the previously started InfluxDB container. 

#### Standalone Mode

	docker run --rm -it -p 8080:8080 -p 9990:9990 --link influx:influx hpehl/wildfly-monitor

#### Domain Mode

In order to use the domain mode, you need to first start the domain controller. The domain controller defines an additional profile called `monitor` which contains the [wildfly-monitor](https://github.com/rhq-project/wildfly-monitor) subsystem. Furthermore two server groups called `main-server-group` and `other-server-group` are defined using that profile.  

	docker run --rm -it -p 9990:9990 --link influx:influx --name=domain-master hpehl/wildfly-monitor --domain-config domain-monitor.xml --host-config host-monitor-master.xml -b 0.0.0.0 -bmanagement 0.0.0.0

The host controller defines one server called `server-one` with `auto-start=true` and `group=main-server-group`. You can start as many host controllers as you like. Use the following snippet to start one:

	docker run --rm -it -p 8080 --link influx:influx --link domain-master:domain-controller hpehl/wildfly-monitor --domain-config domain-monitor.xml --host-config host-monitor-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0

#### Environment Variables

You can use the following environment variables for further customizations. Please use the `-e FOO=bar` option when starting the containers.

- `WILDFLY_MANAGEMENT_USER`: User for the management endpoint. Defaults to "admin"
- `WILDFLY_MANAGEMENT_PASSWORD`: Password for the management endpoint. Defaults to "admin"
- `SERVER_GROUP`: Group for the server when starting a host controller. Defaults to "main-server-group"

## Deployments

TBD

## JMeter

TBD
