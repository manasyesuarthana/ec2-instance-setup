#!/bin/bash

SVC="httpd"
ARTIFACT="2137_barista_cafe"
URL="https://www.tooplate.com/zip-templates/$ARTIFACT.zip"

sudo yum install zip unzip $SVC -y

mkdir /tmp/webfiles
cd /tmp/webfiles
wget $URL
unzip $ARTIFACT.zip
sudo cp -r $ARTIFACT/* /var/www/html

sudo rm -rf /tmp/webfiles

sudo systemctl start $SVC
sudo systemctl enable $SVC
