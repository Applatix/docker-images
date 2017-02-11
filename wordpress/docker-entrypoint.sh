#!/bin/bash
set -euo pipefail

cd /var/www/

#rm -rf html/

unzip  -o /tmp/html.zip -d /var/www/

ls /var/www/html
	

exec "$@"