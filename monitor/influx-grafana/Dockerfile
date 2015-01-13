# Starts InfluxDB

FROM fedora

MAINTAINER Harald Pehl <hpehl@redhat.com>

# Install
RUN yum -y install tar wget sudo nginx supervisor 
RUN wget -q http://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm && rpm -ivh influxdb-latest-1.x86_64.rpm && rm influxdb-latest-1.x86_64.rpm
RUN mkdir -p /opt/grafana && cd /opt/grafana && wget http://grafanarel.s3.amazonaws.com/grafana-1.9.0-rc1.tar.gz && tar xzvf grafana-1.9.0-rc1.tar.gz --strip 1 && rm grafana-1.9.0-rc1.tar.gz

# Configure
ADD supervisord.conf /etc/supervisord.conf
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD influx/run.sh /opt/influxdb/run.sh
RUN chmod +x /opt/influxdb/run.sh
ADD influx/config.toml /opt/influxdb/shared/config.toml
ADD grafana/config.js /opt/grafana/config.js

EXPOSE 80
EXPOSE 8083
EXPOSE 8086

VOLUME ["/data"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]