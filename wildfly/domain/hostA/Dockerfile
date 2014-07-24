# Starts a WildFly host controller named "apu" 
# holding three servers (manjula, sashi, anu)
# 
# There are some prerequisites for running this host controller
#   - There has to be a domain controller running
#   - The container of the domain controller and this container must be 
#     linked using the name "dc"
#   - The domain controller must use "dc:passw0rd_"

FROM jboss/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

# Add files
ADD domain.xml /opt/wildfly/domain/configuration/
ADD host.xml /opt/wildfly/domain/configuration/

# and launch
EXPOSE 8080
CMD ["/opt/wildfly/bin/domain.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]