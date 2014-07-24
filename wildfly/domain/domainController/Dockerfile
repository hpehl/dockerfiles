# Starts a WildFly domain controller named "simpsons"
#   - using three groups (development, staging, production)
#   - and five servers (homer, marge, bart, lisa, maggie)

FROM jboss/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

RUN /opt/wildfly/bin/add-user.sh admin passw0rd_  --silent
RUN /opt/wildfly/bin/add-user.sh dc passw0rd_  --silent

ADD domain.xml /opt/wildfly/domain/configuration/
ADD host.xml /opt/wildfly/domain/configuration/

USER root
RUN chown -R wildfly:wildfly /opt/wildfly*
USER wildfly

CMD ["/opt/wildfly/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]