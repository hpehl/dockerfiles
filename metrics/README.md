# WildFly Monitor Demo

This repository contains a couple of Dockerfiles and a [JMeter](http://jmeter.apache.org/) configuration to demonstrate the monitoring of JEE applications in a WildFly domain. 

## Setup

### WildFly

The folder [wildfly](wildfly) contains Dockerfiles to setup a WildFly domain:

| Hosts  &rarr;<br/>Groups &darr; | simpsons (dc) | apu     | van-hauten |
|---------------------------------|---------------|---------|------------|
| main-group                      |               | manjula |            |
| other-group                     |               |         | kirk       |

In order to monitor JEE resources the setup includes two deployments from the [WildFly quickstarts](https://github.com/wildfly/quickstart):

1. [helloworld-mdb](https://github.com/wildfly/quickstart/tree/master/helloworld-mdb) deployed to `main-group`
1. [kitchensink](https://github.com/wildfly/quickstart/tree/master/kitchensink) deployed to `other-group`

In addition each server JVM is monitored wrt memory and active threads. The monitoring is done using the [wildfly-monitor](https://github.com/rhq-project/wildfly-monitor) subsystem and InfluxDB configured as a storage adapter (see https://github.com/rhq-project/wildfly-monitor/wiki/InfluxDB for more details).

### Monitor

The folder [monitor](monitor) contains a Dockerfile which starts InfluxDB and a pre-poluated  [Grafana](http://grafana.org/) dashboard containing metrics for the monitored resources. 

### JMeter

TBD

## Getting Started

TBD