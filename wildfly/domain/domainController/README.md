Dockerfiles based on [jboss/wildfly](https://registry.hub.docker.com/u/jboss/wildfly/) to setup a 'Simpsons' domain:

| Hosts&nbsp;&rarr;<br>Server Groups&nbsp;&darr; | simpson (dc)      | apu                | van-hauten       | skinner        | chief-wiggum |
|------------------------------------------------|-------------------|--------------------|------------------|----------------|--------------|
| **development**                                | homer             | anu                | kirk&uarr;       | agnes          | ralph&uarr;  |
|                                                | bart&uarr; (+50)  |                    |                  |                |              |
| **staging**                                    | maggie (+100)     | manjula (+50)      | luanna (+50)     |                | clancy (+50) |
| **production**                                 | marge (+150)      | sashi&uarr; (+100) | millhouse (+100) | seymour↑ (+50) |              |
|                                                | lisa&uarr; (+200) |                    |                  |                |              |

&uarr; means autostart = true

In order to setup and run the domain, you have to first start the domain controller (dc) and then link the host containers to the dc using the name "dc" (using another name won't work):

    docker run -p 8080:8080 -p 9990:9990 --name="dc" -d hpehl/wildfly-domain:dc
    docker run --name="hostA" --link=dc:dc -d hpehl/wildfly-domain:hostA
    docker run --name="hostB" --link=dc:dc -d hpehl/wildfly-domain:hostB
    docker run --name="hostC" --link=dc:dc -d hpehl/wildfly-domain:hostC
    docker run --name="hostD" --link=dc:dc -d hpehl/wildfly-domain:hostD

Notes:

- All hosts exposes the standard ports
  - 8080 for HTTP
  - 9990 for management
- Use `admin:passw0rd_` to connect to the management interfaces (CLI / console)
