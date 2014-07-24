Dockerfiles based on [jboss/wildfly](https://registry.hub.docker.com/u/jboss/wildfly/) to setup a 'Simpsons' domain:

<table>
<thead>
<tr>
  <th>Hosts&nbsp;&rarr;<br>Server Groups&nbsp;&darr;</th>
  <th>simpson (dc)</th>
  <th>apu</th>
  <th>van-hauten</th>
  <th>skinner</th>
  <th>chief-wiggum</th>
</tr>
</thead>
<tbody>
<tr style="background-color: #f6f6f6">
  <td><b>development</b></td>
  <td>homer</td>
  <td>anu</td>
  <td>kirk&uarr;</td>
  <td>agnes</td>
  <td>ralph&uarr;</td>
</tr>
<tr style="background-color: #f6f6f6">
  <td>&nbsp;</td>
  <td>bart&uarr; <span style="color: #999">(+50)</span></td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td><b>staging</b></td>
  <td>maggie <span style="color: #999">(+100)</span></td>
  <td>manjula <span style="color: #999">(+50)</span></td>
  <td>luanna <span style="color: #999">(+50)</span></td>
  <td>&nbsp;</td>
  <td>clancy <span style="color: #999">(+50)</span></td>
</tr>
<tr style="background-color: #f6f6f6">
  <td><b>production</b></td>
  <td>marge <span style="color: #999">(+150)</span></td>
  <td>sashi&uarr; <span style="color: #999">(+100)</span></td>
  <td>millhouse <span style="color: #999">(+100)</span></td>
  <td>seymour&uarr; <span style="color: #999">(+50)</span></td>
  <td>&nbsp;</td>
</tr>
<tr style="background-color: #f6f6f6">
  <td>&nbsp;</td>
  <td>lisa&uarr; <span style="color: #999">(+2000)</span></td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</tbody>
</table>

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
