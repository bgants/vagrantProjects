#!/bin/sh -e

#Bleeding edge ubuntu has Python 3 if you want the Anaconda stuff then comment out below and comment Virtual env/pip below
#Ok this is ther version of anaconda we want to install
#anaconda=Anaconda3-4.0.0-Linux-x86_64.sh

#Ok get your some anaconda then
#wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/$anaconda

export DEBIAN_FRONTEND=noninteractive

#Comment out this block and uncomment the anaconda and wget to install just Anaconda rel.
apt-get install python3-setuptools -y
easy_install3 pip       # will be a Python3 pip
pip install virtualenv  # will be py3

PROVISIONED_ON=/etc/vm_provision_on_timestamp

if [ -f "$PROVISIONED_ON" ]
then
  echo "VM was already provisioned at: $(cat $PROVISIONED_ON)"
  echo "To run system updates manually login via 'vagrant ssh' and run 'apt-get update && apt-get upgrade'"
  echo "" 
  exit
fi
