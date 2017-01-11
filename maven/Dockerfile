#
# Java 8 and maven JRE Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/openjdk-7-jre
#

# Pull base image.
FROM ubuntu:14.04

# Install Java.
RUN \
  sudo apt-get install software-properties-common && \
  sudo apt-get update && \
  sudo add-apt-repository ppa:openjdk-r/ppa && \
  sudo apt-get update && \
  sudo apt-get install openjdk-8-jdk  && \
  sudo update-alternatives --config java


# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Define default command.
CMD ["bash"]