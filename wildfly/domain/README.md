# WildFly Domain

This repository contains a Dockerfile to setup a WildFly domain. It's based on the idea to have a generic docker image which is used to start both a domain controller and an arbitrary number of host controllers.

## Domain Controller

In order to setup a domain, you need to first start the domain controller. The domain controller defines two server groups called `main-server-group` and `other-server-group`, but does not include any servers.

	docker run --rm -it -p 9990:9990 --name=dc hpehl/wildfly-domain --host-config host-master.xml -b 0.0.0.0 -bmanagement 0.0.0.0

## Host Controller

The host controller defines one server called `server-one` with `auto-start=true`. When starting the host controller, you have to provide specific parameters: 

- The name of the link to the domain controller must be `domain-controller`. 
- The name of the the server group for `server-one` using the environment variable `SERVER_GROUP`:

        docker run --rm -it -p 8080 --link dc:domain-controller -e SERVER_GROUP=main-server-group hpehl/wildfly-domain --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0

## Environment Variables

Here's a list of all environment variables which are processed by the docker image:

- `WILDFLY_MANAGEMENT_USER`: User for the management endpoint. Defaults to "admin".
- `WILDFLY_MANAGEMENT_PASSWORD`: Password for the management endpoint. Defaults to "admin".
- `SERVER_GROUP`: Group for the server when starting a host controller. Mandatory when starting a host controller.
