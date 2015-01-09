#!/bin/sh

docker run -p 9990:9990 --name="dc" -d hpehl/metrics-wildfly:dc
docker run -p 8080:8080 --name="hostA" --link=dc:dc -d hpehl/metrics-wildfly:hostA
docker run -p 8081:8080 --name="hostB" --link=dc:dc -d hpehl/metrics-wildfly:hostB
