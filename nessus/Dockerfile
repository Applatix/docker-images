# Pull base image.
FROM ubuntu:16.04
MAINTAINER Dinar Dalvi <dinar@applatix.com>

USER root

RUN \
	sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y wget curl gdebi-core build-essential software-properties-common nano 

RUN cd /tmp
RUN ls -al 
RUN wget https://s3-us-west-1.amazonaws.com/ax-public/nessus/Nessus-6.10.4-ubuntu1110_amd64.deb

RUN dpkg -i Nessus-6.10.4-ubuntu1110_amd64.deb

EXPOSE 8834

ENTRYPOINT ["/opt/nessus/sbin/nessus-service"]




