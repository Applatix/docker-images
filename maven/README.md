
##Steps to build

####On command line under the repo:

* docker build -t applatix/maven .
* run docker images and get the ID
* docker tag <ID> applatix/maven:v1
* docker images to check if the tag is applied
* docker login to Applatix repo on Docker Hub
* docker push applatix/maven:v1

######Everytime a new image is built please follow these steps. 
