Dockerfiles based on [jboss/wildfly](https://registry.hub.docker.com/u/jboss/wildfly/) to setup a 'Simpsons' domain:

#### Server Groups

- development
- staging
- production

#### Hosts / Servers

- simpsons (dc)
  - homer (development)
  - bart (&uarr; +50 - development)
  - maggie (+100 - staging)
  - marge (+150 - production)
  - lisa (&uarr; +200 - production)
- apu
  - anu (development)
  - manjula (+50 - staging)
  - sashi (&uarr; +100 - production)
- van-hauten
  - kirk (&uarr; - development)
  - luanna (+50 - staging)
  - millhouse (+100 - production)
- skinner
  - agnes (development)
  - seymour (&uarr; +50 - production)
- chief-wiggum
  - ralph (&uarr; - development)
  - staging (clancy +50 - staging)

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
