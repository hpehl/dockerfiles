Dockerfiles to setup a WildFly domain:

- `domainController`: The domain controller (dc) with five servers. The domain controller defines three server groups:
  - deployment
  - staging
  - production
- `hostA`: First host with three servers
- `hostB`: Second host with three servers
- `hostC`: Third host with two servers
- `hostD`: Fourth host with two servers

In order to setup and run the domain, you have to first start the dc and then link the host containers to the dc using the name "dc" (using another name won't work):

    docker run -name wildfly-dc -d hpehl/wildfly-domain:dc
    docker run -name hostA -link wildfly-dc:dc -d hpehl/wildfly-domain:hostA
    docker run -name hostB -link wildfly-dc:dc -d hpehl/wildfly-domain:hostB
    docker run -name hostC -link wildfly-dc:dc -d hpehl/wildfly-domain:hostC
    docker run -name hostD -link wildfly-dc:dc -d hpehl/wildfly-domain:hostD

Notes:

- The dc exposes the standard ports
  - 8080 for HTTP
  - 9990 for HTTP based management and
  - 9999 for native management
- The hosts expose just port 8080
- The dc defines the user `admin:passw0rd_`
