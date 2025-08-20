#!/bin/bash

SVC="httpd"
ARTIFACT="2137_barista_cafe"
URL="https://www.tooplate.com/zip-templates/$ARTIFACT.zip
yum install zip unzip $SVC -y

mkdir /tmp/webfiles
cd /tmp/webfiles
wget $URL
unzip $ARTIFACT.zip
cp -r $ARTIFACT/* /var/www/html

rm -rf /tmp/webfiles

systemctl start $SVC
systemctl enable $SVC
