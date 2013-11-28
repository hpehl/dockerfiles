# Starts a WildFly standalone instance

FROM hpehl/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

# Add user
RUN /wildfly/bin/add-user.sh admin passw0rd_  --silent

# Add files
ADD launch.sh /
RUN chmod +x /launch.sh

# and launch
ENTRYPOINT /launch.sh
EXPOSE 8080 9990 9999
