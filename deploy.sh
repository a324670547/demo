#!/bin/bash

cd $TOMCAT_HOME

#stop tomcat
sh bin/shutdown.sh

#sleep 10s
sleep 10

# entry webapps
cd webapps

# create folder
mkdir hello

# unzip to hello folder
unzip -oq hello.war -d hello/

#start tomcat
sh bin/startup.sh