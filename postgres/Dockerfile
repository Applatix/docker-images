#
# Dockerfile to create Applatix tomcat postgres image
#
# https://github.com/Applatix/docker-images/tree/master/postgres
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER Dinar Dalvi <dinar@applatix.com>

RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#  There are some warnings (in red) that show up during the build. You can hide them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
# Install required packages
RUN \
	sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y wget curl build-essential software-properties-common python-software-properties nano 



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

#ADD tomcat.service /etc/systemd/system/
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

COPY m3-java-capstone-1.0.war /opt/tomcat/webapps/m3-java-capstone-1.0.war




#install postgres

# Add the PostgreSQL PGP key to verify their Debian packages.
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

# Add PostgreSQL's repository. It contains the most recent stable release of PostgreSQL, ``9.3``.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && apt-get install -y postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.3`` package when it was ``apt-get installed``
USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.

RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker &&\
    createdb -O postgres npgeek -E 'UTF8'
    

#RUN    /etc/init.d/postgresql start &&\
#    psql --command "ALTER USER Postgres WITH PASSWORD 'postgres1';" &&\
#    CREATE DATABASE npgeek  WITH OWNER postgres ENCODING 'UTF8'; 





USER root

ADD init.sql /tmp/init.sql 
RUN chmod 755 /tmp/init.sql


#ADD init.sql /docker-entrypoint-initdb.d/init.sql
#RUN chmod 755 /docker-entrypoint-initdb.d/init.sql

ADD run.sh /bin
RUN chmod +x /bin/run.sh
RUN chmod 755 /bin/run.sh

# Adjust PostgreSQL configuration so that remote connections to the database are possible.

add pg_hba.conf /etc/postgresql/9.3/main/

#RUN echo "host all  all    0.0.0.0/0  trust" >> /etc/postgresql/9.3/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

#RUN mkdir -p /etc/postgresql && chown -R postgres /var/run/postgresql

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql/data"]

CMD ["bash"]
# Define default command.

#CMD ["/bin/run.sh"]

#CMD ["/opt/tomcat/bin/catalina.sh", "run"]

#CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]

