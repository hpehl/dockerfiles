# Container based on Ubuntu with Java 7 and EAP 6.2 CR3
# EAP is downloaded and extracted to /jboss-eap-6.2

FROM ubuntu

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install unzip

# Install JDK 7
RUN apt-get -y install python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get -y update
RUN echo "oracle-java7-installer  shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
RUN apt-get -y install oracle-java7-installer

# Provide EAP
ADD jboss-eap-6.2.0.CR3.zip /
RUN unzip jboss-eap-6.2.0.CR3.zip
RUN rm jboss-eap-6.2.0.CR3.zip
