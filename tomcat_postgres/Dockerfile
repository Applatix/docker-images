#
# Dockerfile to create Applatix tomcat postgres image
#
# https://github.com/Applatix/docker-images/tree/master/tomcat_postgres
#

# Pull base image.
FROM ubuntu:16.04
MAINTAINER Dinar Dalvi <dinar@applatix.com>

# Install.
RUN \
	sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y build-essential && \
	apt-get install -y software-properties-common && \
	sudo add-apt-repository ppa:openjdk-r/ppa && \
	sudo apt-get update && \ 
	sudo apt-get -y install openjdk-8-jdk && \  
	sudo update-alternatives --config java && \
	sudo apt-get install -y maven && \
	sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  		sudo apt-key add -
		sudo apt-get update && \
	sudo apt-get install postgresql-9.4 && \
	sudo groupadd tomcat && \
	sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat && \
	cd /tmp && \
	sudo curl -O http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.5/bin/apache-tomcat-8.5.5.tar.gz && \
	sudo mkdir /opt/tomcat && \
	sudo tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1 && \
	cd /opt/tomcat && \
	sudo chgrp -R tomcat /opt/tomcat && \
	sudo chmod -R g+r conf && \
	sudo chmod g+x conf && \
	sudo chown -R tomcat webapps/ work/ temp/ logs/ && \
	sudo systemctl start tomcat 




# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Define default command.
CMD ["bash"]
