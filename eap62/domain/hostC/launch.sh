#!/bin/bash
IPADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')

# $DC_... variables brought to you by linking this container to a container running an EAP domain controller
#   1) The container running the domain controller: 
#      docker run -name eap62-dc -d hpehl/eap62-domain:dc
#   2) This container 
#      docker run -name hostX -link eap62-dc:dc -d hpehl/eap62-domain:hostX
/jboss-eap-6.2/bin/domain.sh -Djboss.dc.address=${DC_PORT_9999_TCP_ADDR} -Djboss.bind.address=$IPADDR -Djboss.bind.address.management=$IPADDR
