FROM jboss/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

RUN /opt/jboss/wildfly/bin/add-user.sh admin passw0rd_  --silent
RUN /opt/jboss/wildfly/bin/add-user.sh dc passw0rd_  --silent

ADD domain.xml /opt/jboss/wildfly/domain/configuration/
ADD host.xml /opt/jboss/wildfly/domain/configuration/
ADD start-and-deploy.sh /opt/jboss/wildfly/bin/
ADD deployments.cli /tmp/
ADD wildfly-* /tmp/

RUN unzip -q /tmp/wildfly-monitor-module.zip -d /opt/jboss/wildfly

USER root
RUN chown jboss:jboss /opt/jboss/wildfly/bin/start-and-deploy.sh
RUN chmod +x /opt/jboss/wildfly/bin/start-and-deploy.sh
USER jboss

CMD ["/opt/jboss/wildfly/bin/start-and-deploy.sh"]
