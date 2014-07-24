# Starts a WildFly host controller named "chief-wiggum" 
# holding three servers (clancy, ralph)
# 
# There some prerequisites for running this host controller
#   - There has to be a domain controller running
#   - The container of the domain controller and this container must be 
#     linked using the name "dc"
#   - The domain controller must contain the user "dc:passw0rd_" 

FROM jboss/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

ADD domain.xml /opt/wildfly/domain/configuration/
ADD host.xml /opt/wildfly/domain/configuration/

USER root
RUN chown -R wildfly:wildfly /opt/wildfly*
USER wildfly

CMD ["/opt/wildfly/bin/domain.sh", "-Djboss.dc.address=dc", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]