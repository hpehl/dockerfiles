#!/bin/sh

# Create default app server users
if [[ ! -z "${JBOSS_EAP_MANAGEMENT_USER}" ]] && [[ ! -z "${JBOSS_EAP_MANAGEMENT_PASSWORD}" ]]
then
    ${JBOSS_HOME}/bin/add-user.sh --silent -e -u ${JBOSS_EAP_MANAGEMENT_USER} -p ${JBOSS_EAP_MANAGEMENT_PASSWORD}
    sed -i "s/@JBOSS_EAP_MANAGEMENT_USER@/${JBOSS_EAP_MANAGEMENT_USER}/" ${JBOSS_HOME}/domain/configuration/host-slave.xml
    sed -i "s/@JBOSS_EAP_MANAGEMENT_PASSWORD@/`echo ${JBOSS_EAP_MANAGEMENT_PASSWORD} | base64`/" ${JBOSS_HOME}/domain/configuration/host-slave.xml
fi

# Unset the temporary env variables
unset ${JBOSS_EAP_MANAGEMENT_USER} ${JBOSS_EAP_MANAGEMENT_PASSWORD}

exec ${JBOSS_HOME}/bin/domain.sh "$@"