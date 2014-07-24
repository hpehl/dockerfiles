FROM jboss/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

# Add user
RUN /opt/wildfly/bin/add-user.sh admin passw0rd_  --silent
ENTRYPOINT ["/opt/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
