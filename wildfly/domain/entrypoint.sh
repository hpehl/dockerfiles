#!/bin/sh

# Create default app server users
if [[ ! -z "${WILDFLY_MANAGEMENT_USER}" ]] && [[ ! -z "${WILDFLY_MANAGEMENT_PASSWORD}" ]]
then
    ${JBOSS_HOME}/bin/add-user.sh --silent -e -u ${WILDFLY_MANAGEMENT_USER} -p ${WILDFLY_MANAGEMENT_PASSWORD}
    sed -i "s/@WILDFLY_MANAGEMENT_USER@/${WILDFLY_MANAGEMENT_USER}/" ${JBOSS_HOME}/domain/configuration/host-slave.xml
    sed -i "s/@WILDFLY_MANAGEMENT_PASSWORD@/`echo ${WILDFLY_MANAGEMENT_PASSWORD} | base64`/" ${JBOSS_HOME}/domain/configuration/host-slave.xml
fi

if [[ ! -z "${WILDFLY_APPLICATION_USER}" ]] && [[ ! -z "${WILDFLY_APPLICATION_PASSWORD}" ]]
then
    ${JBOSS_HOME}/bin/add-user.sh --silent -e -a -u ${WILDFLY_APPLICATION_USER} -p ${WILDFLY_APPLICATION_PASSWORD}
fi

# Set server group
sed -i "s/@SERVER_GROUP@/${SERVER_GROUP}/" ${JBOSS_HOME}/domain/configuration/host-slave.xml

# Unset the temporary env variables
unset ${WILDFLY_MANAGEMENT_USER} ${WILDFLY_MANAGEMENT_PASSWORD}
unset ${WILDFLY_APPLICATION_USER} ${WILDFLY_APPLICATION_PASSWORD}

exec ${JBOSS_HOME}/bin/domain.sh "$@"