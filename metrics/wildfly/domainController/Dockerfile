# Starts a WildFly domain controller named "simpsons"
#   - using two groups (main-group, other-group)
#   - and no servers 

FROM jboss/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

RUN /opt/wildfly/bin/add-user.sh admin passw0rd_  --silent
RUN /opt/wildfly/bin/add-user.sh dc passw0rd_  --silent

ADD domain.xml /opt/wildfly/domain/configuration/
ADD host.xml /opt/wildfly/domain/configuration/

CMD ["/opt/wildfly/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]