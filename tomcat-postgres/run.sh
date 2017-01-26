#!/bin/bash

# Stop on error
set -e


#start postgreSQL
echo "starting postgreSQL ... "

sudo service postgresql restart

echo "started postgreSQL"

echo "sleep 45 seconds to give DB the time to start"

sleep 45

echo "running insert data"

psql npgeek postgres -f /tmp/init.sql 

echo "running insert data complete"

#start tomcat
echo "starting tomcat ... "

#sh /opt/tomcat/bin/catalina.sh stop

sh /opt/tomcat/bin/catalina.sh start


echo "started tomcat"

# keep the stdin
/bin/bash