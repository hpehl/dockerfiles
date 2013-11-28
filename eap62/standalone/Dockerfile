# Starts an EAP standalone instance

FROM hpehl/eap62

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

# Add user
RUN /jboss-eap-6.2/bin/add-user.sh admin passw0rd_  --silent

# Add files
ADD launch.sh /
RUN chmod +x /launch.sh

# and launch
ENTRYPOINT /launch.sh
EXPOSE 8080 9990 9999
