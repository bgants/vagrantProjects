#!/bin/bash


# MongoDB public GPG Key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

#Create the /etc/apt/sources.list.d/mongodb-org-3.2.list list file 
#for appropriate for your version of Ubuntu:
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update

#Install the latest stable version of MongoDB and start it up.
sudo apt-get install -y mongodb-org

