#!/bin/bash



echo "building remaining images .."

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-firefox/firefox-44

docker build -t applatix/ubuntu1604-firefox44 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-firefox/firefox-45

docker build -t applatix/ubuntu1604-firefox45 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-firefox/firefox-46

docker build -t applatix/ubuntu1604-firefox46 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-firefox/firefox-47

docker build -t applatix/ubuntu1604-firefox47 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-firefox/firefox-48

docker build -t applatix/ubuntu1604-firefox48 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-firefox/firefox-49

docker build -t applatix/ubuntu1604-firefox49 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-firefox/firefox-50

docker build -t applatix/ubuntu1604-firefox50 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-firefox/firefox-latest

docker build -t applatix/ubuntu1604-firefoxlatest .

sleep 3

echo "done building now uploading "

docker push applatix/ubuntu1604-firefox44

sleep 5

docker push applatix/ubuntu1604-firefox45

sleep 5

docker push applatix/ubuntu1604-firefox46

sleep 5

docker push applatix/ubuntu1604-firefox47

sleep 5

docker push applatix/ubuntu1604-firefox48

sleep 5

docker push applatix/ubuntu1604-firefox49

sleep 5

docker push applatix/ubuntu1604-firefox50

sleep 5 

docker push applatix/ubuntu1604-firefoxlatest

sleep 5

echo "done"

