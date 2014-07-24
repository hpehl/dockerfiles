Dockerfiles based on [jboss/wildfly](https://registry.hub.docker.com/u/jboss/wildfly/) to setup a 'Simpsons' domain:

| Hosts &larr;         | simpson (dc)      | apu                | van-hauten       | skinner        | chief-wiggum |
| Server Groups &darr; |                   |                    |                  |                |              |
|----------------------|-------------------|--------------------|------------------|----------------|--------------|
| development          | homer             | anu                | kirk&uarr;       | agnes          | ralph&uarr;  |
|                      | bart&uarr; (+50)  |                    |                  |                |              |
| staging              | maggie (+100)     | manjula (+50)      | luanna (+50)     |                | clancy (+50) |
| production           | marge (+150)      | sashi&uarr; (+100) | millhouse (+100) | seymour↑ (+50) |              |
|                      | lisa&uarr; (+200) |                    |                  |                |              |

&uarr; means autostart = true

In order to setup and run the domain, you have to first start the domain controller (dc) and then link the host containers to the dc using the name "dc" (using another name won't work):

    docker run --name="wildfly-dc" -d hpehl/wildfly-domain:dc
    docker run --name="hostA" -link wildfly-dc:dc -d hpehl/wildfly-domain:hostA
    docker run --name="hostB" -link wildfly-dc:dc -d hpehl/wildfly-domain:hostB
    docker run --name="hostC" -link wildfly-dc:dc -d hpehl/wildfly-domain:hostC
    docker run --name="hostD" -link wildfly-dc:dc -d hpehl/wildfly-domain:hostD

Notes:

- The dc exposes the standard ports
  - 8080 for HTTP
  - 9990 for management
- The hosts expose just port 8080
- The dc defines the user `admin:passw0rd_`
