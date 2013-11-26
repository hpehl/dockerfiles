# Starts a WildFly host controller named "apu" 
# holding three servers (manjula, sashi, anu)
# 
# There some prerequisites for running this host controller
#   - This container requires a running domain controller (dc) container. 
#     The container of the dc and this container must be linked using 
#     the name "dc"
#   - The dc container must contain the user "dc:passw0rd_" 

FROM hpehl/wildfly:8.0.0.Beta1

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

# Add files
ADD domain.xml /wildfly-8.0.0.Beta1/domain/configuration/
ADD host.xml /wildfly-8.0.0.Beta1/domain/configuration/
ADD launch.sh /
RUN chmod +x /launch.sh

# and launch
ENTRYPOINT /launch.sh
EXPOSE 8080
