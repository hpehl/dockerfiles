#!/bin/sh

docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 --name=influx -e PRE_CREATE_DB=monitor hpehl/influx-grafana
docker run -d -p 8080:8080 -p 9990:9990 --name=wildfly --hostname=monitor-demo --link influx:influx hpehl/wildfly-monitor
