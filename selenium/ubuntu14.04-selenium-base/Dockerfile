
FROM ubuntu:14.04
MAINTAINER dinar dalvi <dinar@applatix.com>

USER root
#================================================
# Customize sources for apt-get
#================================================
RUN  echo "deb http://archive.ubuntu.com/ubuntu trusty main universe\n" > /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu trusty-updates main universe\n" >> /etc/apt/sources.list \
  && echo "deb http://security.ubuntu.com/ubuntu trusty-security main universe\n" >> /etc/apt/sources.list

#===================
# Timezone settings
# Possible alternative: https://github.com/docker/docker/issues/3359#issuecomment-32150214
#===================
ENV TZ "UTC"
RUN echo "${TZ}" > /etc/timezone \
  && dpkg-reconfigure --frontend noninteractive tzdata

#========================
# Miscellaneous packages
# Includes minimal runtime used for executing non GUI Java programs
# VNC and Xvfb
#========================

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

#==============
# VNC and Xvfb
#==============

RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    bzip2 \
    ca-certificates \
    sudo \
    unzip \
    nano \
    apt-utils \
    wget \
    xvfb \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* 
  
RUN \
	sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y build-essential && \
	apt-get install -y software-properties-common && \
	add-apt-repository ppa:openjdk-r/ppa && \
	apt-get update && \ 
	apt-get -y install openjdk-8-jdk && \  
	update-alternatives --config java 

RUN sed -i 's/securerandom\.source=file:\/dev\/random/securerandom\.source=file:\/dev\/urandom/' ./usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/java.security

 # Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

#==========
# Selenium
#==========
RUN  mkdir -p /opt/selenium \
  && wget --no-verbose https://selenium-release.storage.googleapis.com/3.0/selenium-server-standalone-3.0.1.jar -O /opt/selenium/selenium-server-standalone.jar

#========================================
# Add normal user with passwordless sudo
#========================================
RUN  useradd seluser --shell /bin/bash --create-home \
  && sudo usermod -a -G sudo seluser \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'seluser:secret' | chpasswd

