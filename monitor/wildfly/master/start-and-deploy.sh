#!/bin/bash

JBOSS_HOME=/opt/jboss/wildfly
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh

function wait_for_server() {
    until `$JBOSS_CLI -c "ls /" &> /dev/null`; do
        sleep 1
    done
}

echo "=> Starting WildFly server"
$JBOSS_HOME/bin/domain.sh -b 0.0.0.0 -bmanagement 0.0.0.0 >/dev/null &

echo "=> Waiting for the server to boot"
wait_for_server

echo "=> Deploying JEE quickstart applications"
$JBOSS_CLI -c --file=/tmp/deployments.cli
