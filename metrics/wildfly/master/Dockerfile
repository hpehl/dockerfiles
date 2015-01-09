FROM jboss/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

RUN /opt/jboss/wildfly/bin/add-user.sh admin passw0rd_  --silent
RUN /opt/jboss/wildfly/bin/add-user.sh dc passw0rd_  --silent

ADD domain.xml /opt/jboss/wildfly/domain/configuration/
ADD host.xml /opt/jboss/wildfly/domain/configuration/
ADD wildfly-* /tmp/

RUN unzip -q /tmp/wildfly-monitor-module.zip -d /opt/jboss/wildfly

CMD ["/opt/jboss/wildfly/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]