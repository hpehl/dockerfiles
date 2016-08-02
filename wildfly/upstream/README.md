# WildFly Upstream

This repository contains a Dockerfile to run the latest WildFly version (WildFly 11). 

## Usage

To boot in standalone mode

    docker run -it hpehl/wildfly-upstream

To boot in domain mode

    docker run -it hpehl/wildfly-upstream /opt/jboss/wildfly/bin/domain.sh -b 0.0.0.0 -bmanagement 0.0.0.0
    
