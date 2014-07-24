Dockerfile based on [jboss/wildfly](https://registry.hub.docker.com/u/jboss/wildfly/) to setup a WildFly standalone server. The standalone server exposes the following ports

- 8080 for HTTP
- 9990 for management

Start WildFly using 

    docker run -p 8080:8080 -p 9990:9990 --name="wildfly" -d hpehl/wildfly-standalone

You can connect to the management interfaces (CLI / console) using `admin:passw0rd_`. 
