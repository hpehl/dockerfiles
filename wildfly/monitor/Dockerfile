FROM hpehl/wildfly-domain

MAINTAINER Harald Pehl <hpehl@redhat.com>

# Add monitor subsystem
ADD wildfly-monitor-module.zip /tmp/
RUN unzip -q /tmp/wildfly-monitor-module.zip -d /opt/jboss/wildfly

# Add monitor specific config files
ADD domain/configuration/* /opt/jboss/wildfly/domain/configuration/

# Change the ownership of added files/dirs to `jboss`
USER root
RUN chown -R jboss:jboss /opt/jboss/wildfly
RUN chmod +x /opt/jboss/wildfly/bin/entrypoint.sh
USER jboss
