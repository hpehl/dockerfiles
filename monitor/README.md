# WildFly Monitor Demo

This repository contains a couple of Dockerfiles and a [JMeter](http://jmeter.apache.org/) configuration to demonstrate the monitoring of JEE applications in a WildFly domain. The monitoring is done using the [wildfly-monitor](https://github.com/rhq-project/wildfly-monitor) subsystem with InfluxDB configured as a storage adapter (see https://github.com/rhq-project/wildfly-monitor/wiki/InfluxDB for more details).

## Setup

### WildFly

There are two docker images which setup a WildFly domain:

1. `hpehl/metrics-wildfly:master`
2. `hpehl/metrics-wildfly:slave`

| Hosts  &rarr;<br/>Groups &darr; | master (dc) | slave      |
|---------------------------------|-------------|------------|
| main-group                      | server-one  |            |
| other-group                     |             | server-two |

In order to monitor JEE resources the setup includes two deployments from the [WildFly quickstarts](https://github.com/wildfly/quickstart):

1. [helloworld-mdb](https://github.com/wildfly/quickstart/tree/master/helloworld-mdb) deployed to `main-group`
1. [kitchensink](https://github.com/wildfly/quickstart/tree/master/kitchensink) deployed to `other-group`

In addition each server JVM is monitored wrt memory and active threads. 

### Monitor

The monitoring is done using InfluxDB. The docker image `hpehl/metrics-monitor` starts an InfluxDB instance and a [Grafana](http://grafana.org/) dashboard with metrics for the monitored resources. 

### JMeter

TBD

## Getting Started

TBD