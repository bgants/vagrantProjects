#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive


#Install Java 8 
add-apt-repository ppa:webupd8team/java -y
apt-get update
apt-get -y upgrade
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
apt-get -y install oracle-java8-installer

echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment

#Don't really like this part becuse I have no control over what/where version 
#as it changes etc..
wget "http://apache.cs.utah.edu/kafka/0.11.0.0/kafka_2.11-0.11.0.0.tgz" -O /opt/kafka.tgz

cd /opt
tar -zxvf kafka.tgz
rm kafka.tgz
chown -R vagrant:vagrant kafka*/
