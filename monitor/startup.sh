#!/bin/sh

# Do not change the names and links as they are used in the WildFly config files
docker run -d -p 8083:8083 -p 8086:8086 --name="influx" hpehl/metrics-monitor
docker run -d -p 9990:9990 --name="master" --link influx:influx hpehl/metrics-wildfly:master
docker run -d -p 8080:8080 --name="slave" --link influx:influx --link=master:master hpehl/metrics-wildfly:slave
