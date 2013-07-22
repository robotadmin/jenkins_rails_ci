#!/usr/bin/env bash

source ../config/all.sh

DEPENDENCIES="nodejs postgresql sqlite3 libsqlite3-dev libxml2 build-essential libxslt-dev libxml2-dev"

sudo apt-get update
sudo apt-get install python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y $DEPENDENCIES
