#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../config/all.sh

sudo su jenkins -c "curl --silent -L https://get.rvm.io | bash"
# rvm requirements - requires sudo password.
# thank you https://www.digitalocean.com/community/articles/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm
sudo apt-get install -y gawk libreadline6-dev zlib1g-dev libssl-dev libyaml-dev autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev

for RUBY in $RUBIES
  do
    sudo su jenkins -c "source ~jenkins/.bash_profile && rvm install $RUBY"
done
# http://stackoverflow.com/questions/9336596/rvm-installation-not-working-rvm-is-not-a-function
sudo su jenkins -c "source ~jenkins/.bash_profile && bash -lc 'rvm use 2.0.0 --default'"
