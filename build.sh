#!/bin/bash -e

touch /var/lib/dspace/buildlock
mvn clean
mvn package -Dmirage2.on=true -Denv=build-`uname -n`
cd /opt/dspace.build/dspace/target/dspace-installer
ant fresh_install
cd /opt/dspace.build/
sudo systemctl restart tomcat
rm -f /var/lib/dspace/buildlock

