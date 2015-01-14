# WildFly Domain

This repository contains a Dockerfile to setup a WildFly domain. It's based on the idea to have a generic docker image which is used to start both a domain controller and an arbitrary number of host controllers.

## Domain Controller

In order to setup a domain, you need to start the domain controller. The domain controller defines two server groups called `main-server-group` and `other-server-group`, but does not include any servers.

	docker run --rm -it -p 9990:9990 --name=domain-master hpehl/wildfly-domain --host-config host-master.xml -b 0.0.0.0 -bmanagement 0.0.0.0

## Host Controller

The host controller defines one server called `server-one` with `auto-start=true` and `group=main-server-group`. You can change the server group using an environment variable given at runtime:

	docker run --rm -it -p 8080 --link domain-master:domain-controller hpehl/wildfly-kubernetes --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0
    docker run --rm -it -p 8080 --link domain-master:domain-controller -e SERVER_GROUP=other-server-group hpehl/wildfly-kubernetes --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0


## Environment Variables

Here's a list of all environment variables which are processed by the docker image:

- `WILDFLY_MANAGEMENT_USER`: User for the management endpoint. Defaults to "admin"
- `WILDFLY_MANAGEMENT_PASSWORD`: Password for the management endpoint. Defaults to "admin"
- `SERVER_GROUP`: Group for the server when starting a host controller. Defaults to "main-server-group"
