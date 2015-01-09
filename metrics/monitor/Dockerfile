# TODO

FROM fedora

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

RUN yum -y install wget
RUN yum -y install sudo
RUN wget -q http://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm
RUN sudo rpm -ivh influxdb-latest-1.x86_64.rpm

ADD config.toml /config/config.toml
ADD run.sh /run.sh
RUN chmod +x /*.sh

# Admin server
EXPOSE 8083

# HTTP API
EXPOSE 8086

# HTTPS API
EXPOSE 8084

VOLUME ["/data"]

CMD ["/run.sh"]