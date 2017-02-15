#!/bin/bash


#cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-chrome/selenium-nodeBase

#docker build -t applatix/ubuntu1604-selenium-node-base .

#echo "done building now pushing the image.."

#docker push applatix/ubuntu1604-selenium-node-base

#sleep 5 

#echo "building remaining images .."

#cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-chrome/chrome-49

#docker build -t applatix/ubuntu1604-chrome49 .

#sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-chrome/chrome-50

docker build -t applatix/ubuntu1604-chrome50 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-chrome/chrome-51

docker build -t applatix/ubuntu1604-chrome51 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-chrome/chrome-52

docker build -t applatix/ubuntu1604-chrome52 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-chrome/chrome-53

docker build -t applatix/ubuntu1604-chrome53 .

sleep 3

cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-chrome/chrome-54

docker build -t applatix/ubuntu1604-chrome54 .

#sleep 3

#cd /Users/dinar_dalvi/applatix_code/docker-images/selenium/ubuntu-16.04-chrome/chrome-latest

#docker build -t applatix/ubuntu1604-chromelatest .

#sleep 3

echo "done building now uploading "

#docker push applatix/ubuntu1604-chrome49

#sleep 5

docker push applatix/ubuntu1604-chrome50

sleep 5

docker push applatix/ubuntu1604-chrome51

sleep 5

docker push applatix/ubuntu1604-chrome52

sleep 5

docker push applatix/ubuntu1604-chrome53

sleep 5

docker push applatix/ubuntu1604-chrome54

sleep 5

#docker push applatix/ubuntu1604-chromelatest

sleep 5

echo "done"

