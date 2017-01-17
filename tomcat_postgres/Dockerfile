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
	apt-get install -y wget && \
	apt-get install -y curl && \ 
	apt-get install -y build-essential && \
	apt-get install -y software-properties-common && \
	add-apt-repository ppa:openjdk-r/ppa && \
	apt-get update && \ 
	apt-get -y install openjdk-8-jdk && \  
	update-alternatives --config java && \
	apt-get install -y maven && \
	sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' && \
	wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add - && \
	apt-get update && \
	apt-get install -y postgresql postgresql-contrib && \
	
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
	chown -R tomcat webapps/ work/ temp/ logs/ && \
	update-java-alternatives -l && \
	{
		 
		echo '[Unit]'
		echo 'Description=Apache Tomcat Web Application Container'
		echo 'After=network.target'

		echo '[Service]'
		echo 'Type=forking'

		echo 'Environment=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre'
		echo 'Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid'
		echo 'Environment=CATALINA_HOME=/opt/tomcat'
		echo 'Environment=CATALINA_BASE=/opt/tomcat'
		echo "Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC' "
		echo "Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom' "

		echo 'ExecStart=/opt/tomcat/bin/startup.sh'
		echo 'ExecStop=/opt/tomcat/bin/shutdown.sh'

		echo 'User=tomcat'
		echo 'Group=tomcat'
		echo 'UMask=0007'
		echo 'RestartSec=10'
		echo 'Restart=always'

		echo '[Install]''
		echo 'WantedBy=multi-user.target'
	} > /etc/systemd/system/tomcat.service && \
	systemctl daemon-reload && \
	systemctl start tomcat 


	# Define commonly used JAVA_HOME variable
	ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

	# Define default command.
CMD ["bash"]
