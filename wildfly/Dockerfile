FROM jboss/wildfly:8.2.0.Final

MAINTAINER Harald Pehl <hpehl@redhat.com>

# Add monitor specific config files for standalone and domain
ADD standalone/configuration/* /opt/jboss/wildfly/standalone/configuration/
ADD domain/configuration/* /opt/jboss/wildfly/domain/configuration/

# Add the docker entrypoint script
ADD entrypoint.sh /opt/jboss/wildfly/bin/entrypoint.sh

# Change the ownership of added files/dirs to `jboss`
USER root
RUN chown -R jboss:jboss /opt/jboss/wildfly
RUN chmod +x /opt/jboss/wildfly/bin/entrypoint.sh
USER jboss

# Default values for the environment variables used in entrypoint.sh
ENV SERVER_GROUP main-server-group
ENV WILDFLY_MANAGEMENT_USER admin
ENV WILDFLY_MANAGEMENT_PASSWORD admin

EXPOSE 8080
EXPOSE 9990
EXPOSE 9999

# Set default command and line args for standalone mode
ENTRYPOINT ["/opt/jboss/wildfly/bin/entrypoint.sh"]
CMD ["-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
