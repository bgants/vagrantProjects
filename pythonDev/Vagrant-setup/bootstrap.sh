#!/bin/sh -e

#Ok this is ther version of anaconda we want to install
anaconda=Anaconda3-4.0.0-Linux-x86_64.sh

#Ok get your some anaconda then
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/$anaconda

export DEBIAN_FRONTEND=noninteractive

PROVISIONED_ON=/etc/vm_provision_on_timestamp

if [ -f "$PROVISIONED_ON" ]
then
  echo "VM was already provisioned at: $(cat $PROVISIONED_ON)"
  echo "To run system updates manually login via 'vagrant ssh' and run 'apt-get update && apt-get upgrade'"
  echo "" 
  exit
fi

if [ -s $anaconda ]
then
  chmod +x $anaconda
  ./$anaconda -b -p /opt/anaconda
  cat >> /home/vagrant/.bashrc << END
  # For anaconda
  PATH=/opt/anaconda/bin:$PATH
END
else
  echo "ERROR: Anaconda installer is not found"
fi
