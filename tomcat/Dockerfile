#
# Dockerfile to create Applatix tomcat postgres image
#
# https://github.com/Applatix/docker-images/tree/master/tomcat_postgres
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER Dinar Dalvi <dinar@applatix.com>

RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8

RUN rm /bin/sh && ln -s /bin/bash /bin/sh


# Install ``python-software-properties``, ``software-properties-common``
#  There are some warnings (in red) that show up during the build. You can hide them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
# Install JDK 8.
RUN \
	sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y wget curl build-essential software-properties-common python-software-properties nano && \
	add-apt-repository ppa:openjdk-r/ppa && \
	apt-get update && \ 
	apt-get -y install openjdk-8-jdk && \  
	update-alternatives --config java && \
	export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre && \
	export JRE_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre 

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre

#install TOMCAT

RUN \		
	groupadd tomcat && \
	useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat && \
	cd /tmp && \
	curl -O http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.9/bin/apache-tomcat-8.5.9.tar.gz && \
	mkdir /opt/tomcat && \
	tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1 && \
	cd /opt/tomcat && \
	chgrp -R tomcat /opt/tomcat && \
	chmod -R g+r conf && \
	chmod g+x conf && \
	chown -R tomcat webapps/ work/ temp/ logs/ 
	
	 
# Add admin/admin user
ADD tomcat-users.xml /opt/tomcat/conf/

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
EXPOSE 8009

ADD tomcat.service /etc/systemd/system/
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat


# Define default command.
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

