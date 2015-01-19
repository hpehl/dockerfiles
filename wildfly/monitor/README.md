# WildFly Monitor Demo

Quick demo of the monitoring features in WildFly based on sample JEE applications. The monitoring is done using the [wildfly-monitor](https://github.com/rhq-project/wildfly-monitor) subsystem with InfluxDB configured as a storage adapter (see https://github.com/rhq-project/wildfly-monitor/wiki/InfluxDB for more details).

## Docker Images

### InfluxDB & Grafana

The monitoring is done using InfluxDB and Grafana. The monitor demo requires a InfluxDB called `monitor`. Start an instance using the docker image at [hpehl/influx-grafana](https://registry.hub.docker.com/u/hpehl/influx-grafana/) and these parameters:

    docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 --name=influx -e PRE_CREATE_DB=monitor hpehl/influx-grafana

### WildFly

WildFly is started in standalone mode based on the official `jboss/wildfly` docker image. It's bundled with the [wildfly-monitor](https://github.com/rhq-project/wildfly-monitor) subsystem, the WildFly [kitchensink](https://github.com/wildfly/quickstart/tree/master/kitchensink) quickstart sample and a pre-defined set of data-input configuration to monitor specific resources in WildFly: 

```xml
<subsystem xmlns="urn:org.rhq.metrics:wildfly-monitor:1.0">
    <storage-adapter name="influx" url="http://influx:8086" db="monitor" user="root" password="root"/>
    <server-monitor name="default" enabled="true" num-threads="2">
        <data-input name="heap"
                    seconds="5"
                    resource="/core-service=platform-mbean/type=memory"
                    attribute="heap-memory-usage#used"/>
        <data-input name="non-heap"
                    seconds="5"
                    resource="/core-service=platform-mbean/type=memory"
                    attribute="non-heap-memory-usage#used"/>
        <data-input name="thread-count"
                    seconds="5"
                    resource="/core-service=platform-mbean/type=threading"
                    attribute="thread-count"/>
        <data-input name="active-count"
                    seconds="5"
                    resource="/subsystem=datasources/data-source=KitchensinkQuickstartDS/statistics=pool"
                    attribute="ActiveCount"/>
        <data-input name="available-count"
                    seconds="5"
                    resource="/subsystem=datasources/data-source=KitchensinkQuickstartDS/statistics=pool"
                    attribute="AvailableCount"/>
        <data-input name="in-use-count"
                    seconds="5"
                    resource="/subsystem=datasources/data-source=KitchensinkQuickstartDS/statistics=pool"
                    attribute="InUseCount"/>
        <data-input name="creation-time"
                    seconds="5"
                    resource="/subsystem=datasources/data-source=KitchensinkQuickstartDS/statistics=pool"
                    attribute="AverageCreationTime"/>
        <data-input name="get-time"
                    seconds="5"
                    resource="/subsystem=datasources/data-source=KitchensinkQuickstartDS/statistics=pool"
                    attribute="AverageGetTime"/>
    </server-monitor>
    <diagnostics name="storage" enabled="true" seconds="10"/>
</subsystem>
```

## Get Started

1. First start the Influx and WildFly docker container. There's a shell script you can use to start and link the container. It's just a shortcut for 

		docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 --name=influx -e PRE_CREATE_DB=monitor hpehl/influx-grafana
		docker run -d -p 8080:8080 -p 9990:9990 --name=wildfly --hostname=monitor-demo --link influx:influx hpehl/wildfly-monitor 

1. Point you browser to http://localhost/ (replace localhost with `boot2docker ip` if you running OSX) and load the Grafana dashboards from `dashboards/server.json` and `dashboards/diagnostics.json`.

1. Use JMeter and the provided configuration `jmeter/monitor.jmx` to generate traffic and watch how the metrics in Grafana will update accordingly. 