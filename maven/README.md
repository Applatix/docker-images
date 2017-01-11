
Steps to build

On command line under the repo:

1) docker build -t applatix/maven .
2) run docker images and get the ID
3) docker tag <ID> applatix/maven:v1
4) docker images to check if the tag is applied
5) docker login to Applatix repo on Docker Hub
6) docker push applatix/maven:v1

Everytime a new image is built please follow these steps. 