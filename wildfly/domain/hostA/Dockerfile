# Starts a WildFly host controller named "apu" 
# holding three servers (manjula, sashi, anu)
# 
# There some prerequisites for running this host controller
#   - There has to be a domain controller running
#   - The container of the domain controller and this container must be 
#     linked using the name "dc"
#   - The domain controller must contain the user "dc:passw0rd_" 

FROM hpehl/wildfly:latest

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

# Add files
ADD domain.xml /wildfly/domain/configuration/
ADD host.xml /wildfly/domain/configuration/
ADD launch.sh /
RUN chmod +x /launch.sh

# and launch
ENTRYPOINT /launch.sh
EXPOSE 8080
