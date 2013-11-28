#!/bin/bash
IPADDR=$(ip a s | sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')
/jboss-eap-6.2/bin/standalone.sh -Djboss.bind.address=$IPADDR -Djboss.bind.address.management=$IPADDR
