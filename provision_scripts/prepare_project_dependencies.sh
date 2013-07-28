#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../config/all.sh

DEPENDENCIES="nodejs postgresql sqlite3 libsqlite3-dev libxml2 build-essential libxslt-dev libxml2-dev xvfb firefox"

sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y $DEPENDENCIES
