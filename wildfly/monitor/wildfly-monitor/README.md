# WildFly Domain with Monitoring Subsystem

WildFly domain based on the [hpehl/wildfly-domain](https://registry.hub.docker.com/u/hpehl/wildfly-domain/) docker image. Please use the following commands to setup a domain with one domain controller and two host controller:

    docker run -d -p 9990:9990 --name=domain-master --link influx:influx hpehl/wildfly-monitor --host-config host-master.xml -b 0.0.0.0 -bmanagement 0.0.0.0
    docker run -d -p 8080 --link influx:influx --link domain-master:domain-controller -e SERVER_GROUP=other-server-group hpehl/wildfly-monitor --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0
    docker run -d -p 8080 --link influx:influx --link domain-master:domain-controller -e SERVER_GROUP=other-server-group hpehl/wildfly-monitor --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0

**Please note:**

> This docker image is hardly useful on its own, but it's part of the [WildFly monitoring demo](https://github.com/hpehl/dockerfiles/tree/master/wildfly/monitor).
