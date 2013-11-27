# Starts a EAP host controller named "van-houten" 
# holding three servers (kirk, luann, milhouse)
# 
# There some prerequisites for running this host controller
#   - There has to be a domain controller running
#   - The container of the domain controller and this container must be 
#     linked using the name "dc"
#   - The domain controller must contain the user "dc:passw0rd_" 

FROM hpehl/eap62:cr3

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

# Add files
ADD domain.xml /jboss-eap-6.2/domain/configuration/
ADD host.xml /jboss-eap-6.2/domain/configuration/
ADD launch.sh /
RUN chmod +x /launch.sh

# and launch
ENTRYPOINT /launch.sh
EXPOSE 8080
