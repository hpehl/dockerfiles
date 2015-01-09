FROM jboss/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

ADD domain.xml /opt/jboss/wildfly/domain/configuration/
ADD host.xml /opt/jboss/wildfly/domain/configuration/
ADD wildfly-* /tmp/

RUN unzip -q /tmp/wildfly-monitor-module.zip -d /opt/jboss/wildfly

CMD ["/opt/jboss/wildfly/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]