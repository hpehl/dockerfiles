# Ubuntu with Java 7, WildFly Beta3

FROM ubuntu

MAINTAINER Harald Pehl <harald.pehl@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install JDK 7
RUN apt-get -y install python-software-properties
RUN  add-apt-repository ppa:webupd8team/java
RUN apt-get -y update
RUN echo "oracle-java7-installer  shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
RUN apt-get -y install oracle-java7-installer

# Download & install WildFly
RUN wget http://download.jboss.org/wildfly/8.0.0.Beta1/wildfly-8.0.0.Beta1.tar.gz
RUN tar -xf wildfly-8.0.0.Beta1.tar.gz 
