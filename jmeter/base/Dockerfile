# Use Ubuntu
FROM ubuntu
MAINTAINER dinar@applatix.com

USER root

# Install wget & JRE
RUN apt-get clean && \
	apt-get update && \
	apt-get -qy install \
				wget \
				curl \
				default-jre-headless \
				telnet \
				iputils-ping \
				nano \
				unzip

# Install jmeter
RUN   mkdir /jmeter \
      && cd /jmeter/ \
      && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.1.tgz  \
      && tar -xzf apache-jmeter-3.1.tgz \
      && rm apache-jmeter-3.1.tgz 
 
ADD jmeter-plugins-manager-0.11.jar /jmeter/apache-jmeter-3.1/lib/ext
ADD user.properties /jmeter/apache-jmeter-3.1/bin/user.properties


# Set Jmeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-3.1/

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH

#CMD ["bash"]
