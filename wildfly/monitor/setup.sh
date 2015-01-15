#!/bin/sh

docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 --name=influx -e PRE_CREATE_DB=monitor hpehl/influx-grafana
docker run -d -p 9990:9990 --name=domain-master --link influx:influx hpehl/wildfly-monitor --host-config host-master.xml -b 0.0.0.0 -bmanagement 0.0.0.0
docker run -d -p 8080 --name=host1 --link influx:influx --link domain-master:domain-controller -e SERVER_GROUP=other-server-group hpehl/wildfly-monitor --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0
docker run -d -p 8080 --name=host2 --link influx:influx --link domain-master:domain-controller -e SERVER_GROUP=other-server-group hpehl/wildfly-monitor --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0
