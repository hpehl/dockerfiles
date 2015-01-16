#!/bin/sh

docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 --name=influx -e PRE_CREATE_DB=monitor hpehl/influx-grafana
docker run -d -p 9990:9990 --name=dc --hostname=dc --link influx:influx hpehl/wildfly-monitor --host-config host-master.xml -b 0.0.0.0 -bmanagement 0.0.0.0
docker run -d -p 8001:8080 --name=host1 --hostname=host1 --link influx:influx --link dc:domain-controller -e SERVER_GROUP=main-server-group hpehl/wildfly-monitor --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0
docker run -d -p 8002:8080 --name=host2 --hostname=host2 --link influx:influx --link dc:domain-controller -e SERVER_GROUP=other-server-group hpehl/wildfly-monitor --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0
