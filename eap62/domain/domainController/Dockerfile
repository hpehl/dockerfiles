# Starts an EAP domain controller named "simpsons"
#   - using three groups (development, staging, production)
#   - and five servers (homer, marge, bart, lisa, maggie)

FROM hpehl/eap62

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

# Add user
RUN /jboss-eap-6.2/bin/add-user.sh admin passw0rd_  --silent
RUN /jboss-eap-6.2/bin/add-user.sh dc passw0rd_  --silent

# Add files
ADD domain.xml /jboss-eap-6.2/domain/configuration/
ADD host.xml /jboss-eap-6.2/domain/configuration/
ADD launch.sh /
RUN chmod +x /launch.sh

# and launch
ENTRYPOINT /launch.sh
EXPOSE 8080 9990 9999
