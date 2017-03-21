#!/bin/sh -e

SPARK=spark-2.1.0-bin-hadoop2.7.tgz
SPARKBUNDLE=/mnt/bootstrap/Deps/$SPARK
SPARKDEPLOYMENTDIR="/opt/"


export DEBIAN_FRONTEND=noninteractive

PROVISIONED_ON=/etc/vm_provision_on_timestamp
if [ -f "$PROVISIONED_ON" ]
then
  echo "VM was already provisioned at: $(cat $PROVISIONED_ON)"
  echo "To run system updates manually login via 'vagrant ssh' and run 'apt-get update && apt-get upgrade'"
  echo "" 
  exit
fi

#Install Java 8 
add-apt-repository ppa:webupd8team/java -y
apt-get update
apt-get -y upgrade
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
apt-get -y install oracle-java8-installer

echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment

cp $SPARKBUNDLE $SPARKDEPLOYMENTDIR
cd $SPARKDEPLOYMENTDIR
tar -zxvf ./$SPARK
rm $SPARK

date > "$PROVISIONED_ON"
