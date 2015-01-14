# WildFly Kubernetes Demo

## Domain Mode

In order to use the domain mode, you need to first start the domain controller. The domain controller defines two server groups called `main-server-group` and `other-server-group`.

	docker run --rm -it -p 9990:9990 --name=domain-master hpehl/wildfly-kubernetes -b 0.0.0.0 -bmanagement 0.0.0.0

The host controller defines one server called `server-one` with `auto-start=true` and `group=main-server-group`. You can start as many host controllers as you like. Use the following snippet to start one:

	docker run --rm -it -p 8080 --link domain-master:domain-controller hpehl/wildfly-kubernetes --host-config host-slave.xml -b 0.0.0.0 -bmanagement 0.0.0.0

#### Environment Variables

You can use the following environment variables for further customizations. Please use the `-e FOO=bar` option when starting the containers.

- `WILDFLY_MANAGEMENT_USER`: User for the management endpoint. Defaults to "admin"
- `WILDFLY_MANAGEMENT_PASSWORD`: Password for the management endpoint. Defaults to "admin"
- `SERVER_GROUP`: Group for the server when starting a host controller. Defaults to "main-server-group"
