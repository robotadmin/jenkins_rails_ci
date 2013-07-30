#!/usr/bin/env bash

git add remote
if [ -d ~jenkins/jenkins_backup ]
then
    cd ~jenkins/jenkins_backup
else
    mkdir ~jenkins/jenkins_backup
fi
sudo su jenkisn -c "cat >> ~jenkins/.gitignore" <<EOF

EOF

sudo cp -vr *.xml *.key jobs/*/config.xml plugins/ updates/ userContent/ users/ ~jenkins/
git add *.xml
