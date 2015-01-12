FROM jboss/wildfly:8.2.0.Final

MAINTAINER Harald Pehl <hpehl@redhat.com>

# Add monitor subsystem
ADD wildfly-camel-patch-@project.version@.tar.gz /opt/jboss/wildfly

# Add the docker entrypoint script
ADD entrypoint.sh /opt/jboss/wildfly/bin/entrypoint.sh

# Change the ownership of added files/dirs to `jboss`
USER root
RUN chown -R jboss:jboss /opt/jboss/wildfly
RUN chmod +x /opt/jboss/wildfly/bin/entrypoint.sh
USER jboss

# Set default command line args for standalone mode
ENTRYPOINT ["/opt/jboss/wildfly/bin/entrypoint.sh"]
CMD ["-c", "standalone-camel.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]