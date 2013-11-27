# Starts a WildFly domain controller named "simpsons"
#   - using three groups (development, staging, production)
#   - and five servers (homer, marge, bart, lisa, maggie)

FROM hpehl/wildfly

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

# Add user
RUN /wildfly/bin/add-user.sh admin passw0rd_  --silent
RUN /wildfly/bin/add-user.sh dc passw0rd_  --silent

# Add files
ADD domain.xml /wildfly/domain/configuration/
ADD host.xml /wildfly/domain/configuration/
ADD launch.sh /
RUN chmod +x /launch.sh

# and launch
ENTRYPOINT /launch.sh
EXPOSE 8080 9990 9999
