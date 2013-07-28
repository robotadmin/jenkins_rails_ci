#!/usr/bin/env bash

JENKINS_CLI="/var/cache/jenkins/war/WEB-INF/jenkins-cli.jar"
JENKINS_PLUGINS="Git thinBackup ansicolor"

wget 2> /dev/null --quiet -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
if [ -z "$(grep jenkins /etc/apt/sources.list)" ]
  then
    sudo echo "deb http://pkg.jenkins-ci.org/debian binary/" >> /etc/apt/sources.list
    echo "Added jenkins to aptitude sources list"
fi
sudo apt-get update
sudo apt-get install -y jenkins
sudo usermod -a -G shadow jenkins

for PLUGIN in $JENKINS_PLUGINS
  do
    sudo su jenkins -c "java -jar $JENKINS_CLI -s http://localhost:8080/ install-plugin $PLUGIN"
done
