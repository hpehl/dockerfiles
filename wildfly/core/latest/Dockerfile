# Container based on Ubuntu with Java 7 and latest stable WildFly build from Hudson
# WildFly is downloaded and extracted to /wildfly

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

# Download & install WildFly
RUN wget https://ci.jboss.org/hudson/job/WildFly-latest-master/lastSuccessfulBuild/artifact/build/target/wildfly-8.x.zip
RUN unzip wildfly-8.x.zip
RUN rm wildfly-8.x.zip
RUN ln -s wildfly-8.* wildfly
