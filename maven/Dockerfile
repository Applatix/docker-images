#
# Dockerfile to create Applatix maven image
#
# https://github.com/Applatix/docker-images/tree/master/maven
#

# Pull base image.
FROM ubuntu:14.04
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
	sudo apt-get install -y maven

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Define default command.
CMD ["bash"]
