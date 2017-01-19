#!/bin/bash

# Stop on error
sudo set -e

# Variables
#DATA_DIR=/var/lib/postgresql

#start postgreSQL
echo "starting postgreSQL ... "

# CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]

sudo service postgresql restart

#postgres -c "pg_ctl -D $DATA_DIR/data -l ${DATA_DIR}/logfile start"

echo "started postgreSQL"

#start tomcat
echo "starting tomcat ... "

#echo "export JAVA_OPTS=\"-Dapp.env=dev\"" > /usr/local/tomcat/bin/setenv.sh
#sudo sh /opt/tomcat/bin/catalina.sh stop

sudo sh /opt/tomcat/bin/catalina.sh start


echo "started tomcat"

# keep the stdin
/bin/bash