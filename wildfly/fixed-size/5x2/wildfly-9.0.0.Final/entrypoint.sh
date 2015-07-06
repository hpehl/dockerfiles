#!/bin/sh

# Create default app server users
if [[ ! -z "${WILDFLY_MANAGEMENT_USER}" ]] && [[ ! -z "${WILDFLY_MANAGEMENT_PASSWORD}" ]]
then
    ${JBOSS_HOME}/bin/add-user.sh --silent -e -u ${WILDFLY_MANAGEMENT_USER} -p ${WILDFLY_MANAGEMENT_PASSWORD}
    sed -i "s/@WILDFLY_MANAGEMENT_USER@/${WILDFLY_MANAGEMENT_USER}/" ${JBOSS_HOME}/domain/configuration/host-slave.xml
    sed -i "s/@WILDFLY_MANAGEMENT_PASSWORD@/`echo ${WILDFLY_MANAGEMENT_PASSWORD} | base64`/" ${JBOSS_HOME}/domain/configuration/host-slave.xml
fi

# Unset the temporary env variables
unset ${WILDFLY_MANAGEMENT_USER} ${WILDFLY_MANAGEMENT_PASSWORD}

exec ${JBOSS_HOME}/bin/domain.sh "$@"