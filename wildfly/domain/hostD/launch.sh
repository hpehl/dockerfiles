#!/bin/bash
IPADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')

# $DC_... variables brought to you by linking this container to a container running a wildfly domain controller
#   1) The container running the domain controller: 
#      docker run -name wildfly-dc -d hpehl/wildfly-domain:dc
#   2) This container 
#      docker run -name hostX -link wildfly-dc:dc -d hpehl/wildfly-domain:hostX
/wildfly/bin/domain.sh -Djboss.dc.address=${DC_PORT_9999_TCP_ADDR} -Djboss.bind.address=$IPADDR -Djboss.bind.address.management=$IPADDR
