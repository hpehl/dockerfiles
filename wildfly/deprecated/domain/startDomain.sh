#!/bin/sh

docker run -p 8080:8080 -p 9990:9990 --name="dc" -d hpehl/wildfly-domain:dc
docker run --name="hostA" --link=dc:dc -d hpehl/wildfly-domain:hostA
docker run --name="hostB" --link=dc:dc -d hpehl/wildfly-domain:hostB
docker run --name="hostC" --link=dc:dc -d hpehl/wildfly-domain:hostC
docker run --name="hostD" --link=dc:dc -d hpehl/wildfly-domain:hostD
