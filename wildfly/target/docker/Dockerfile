FROM jboss/wildfly:8.2.0.Final
MAINTAINER docker-maven-plugin@jolokia.org
COPY maven /opt/jboss/wildfly/
VOLUME ["/opt/jboss/wildfly"]
CMD ["/opt/jboss/wildfly/bin/domain.sh","-b","0.0.0.0","-bmanagement","0.0.0.0"]
