#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../config/all.sh

mkdir -p ~jenkins/.ssh/
chown -R jenkins ~jenkins
chown -R jenkins ~jenkins/.ssh

for KEY in `ls $SECRET_KEYS_DIR`
  do
    echo "cp $SECRET_KEYS_DIR/$KEY to ~jenkins/.ssh"
    cp $SECRET_KEYS_DIR/$KEY ~jenkins/.ssh/
done

chown -R jenkins ~jenkins/.ssh
chmod 600 ~jenkins/.ssh/*

if [ -z "$(grep bitbucket ~jenkins/.ssh/known_hosts)" ]
then
    su jenkins -c "ssh-keyscan -t rsa bitbucket.org >> ~jenkins/.ssh/known_hosts"
fi

if [ -z "$(grep heroku ~jenkins/.ssh/known_hosts)" ]
then
    su jenkins -c "ssh-keyscan -t rsa heroku.com >> ~jenkins/.ssh/known_hosts"
fi
