#!/usr/bin/env bash

JENKINS_CLI="/var/cache/jenkins/war/WEB-INF/jenkins-cli.jar"
JENKINS_PLUGINS="Git thinBackup ansicolor"

wget 2> /dev/null --quiet -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
if [ -z "$(grep jenkins /etc/apt/sources.list)" ]
  then
    sudo bash -c "echo deb http://pkg.jenkins-ci.org/debian binary/ >> /etc/apt/sources.list"
    echo "Added jenkins to aptitude sources list"
fi
sudo_cmd apt-get update
sudo_cmd apt-get install -y jenkins
sudo_cmd usermod -a -G shadow jenkins

if [ -d $JENKINS_BACKUP ] then
    echo "copying jenkins backup from $JENKINS_BACKUP..."
    sudo_cmd cp -r $JENKINS_BACKUP/* ~jenkins/
fi

for PLUGIN in $JENKINS_PLUGINS
  do
    sudo su jenkins -c "java -jar $JENKINS_CLI -s http://localhost:8080/ install-plugin $PLUGIN"
done
