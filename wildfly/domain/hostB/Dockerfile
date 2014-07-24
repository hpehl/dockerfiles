# Starts a WildFly host controller named "van-houten" 
# holding three servers (kirk, luann, milhouse)
# 
# There some prerequisites for running this host controller
#   - There has to be a domain controller running
#   - The container of the domain controller and this container must be 
#     linked using the name "dc"
#   - The domain controller must contain the user "dc:passw0rd_" 

FROM jboss/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

# Add files
ADD domain.xml /opt/wildfly/domain/configuration/
ADD host.xml /opt/wildfly/domain/configuration/

# and launch
EXPOSE 8080
CMD ["/opt/wildfly/bin/domain.sh", "-Djboss.dc.address", "${DC_PORT_9999_TCP_ADDR}", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]