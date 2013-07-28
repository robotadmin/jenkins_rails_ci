#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../config/all.sh

sudo su jenkins -c git config --global user.email $GIT_EMAIL
sudo su jenkins -c git config --global user.name $GIT_USERNAME

if [ -z "$(grep $REPO_HOSTNAME ~jenkins/.ssh/config)" ]
then
sudo su jenkins -c cat <<EOF >> ~jenkins/.ssh/config
Host bitbucket-deploy
   Hostname          $REPO_HOSTNAME
   User              git
   IdentityFile      $REPO_IDENTITYFILE
   IdentitiesOnly    yes

Host heroku-deploy
   Hostname          $HEROKU_HOSTNAME
   User              git
   IdentityFile      $HEROKU_IDENTITYFILE
   IdentitiesOnly    yes
EOF
fi

cat ~jenkins/.ssh/config
