#!/usr/bin/env bash

if [ -d /vagrant ]
then
ROOT_DIR=/vagrant
else
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=`echo ${ROOT_DIR%/*}`
fi

SECRET_KEYS_DIR=$ROOT_DIR/secret_keys
PUB_KEYS_DIR=$ROOT_DIR/pub_keys
PROVISION_SCRIPTS=$ROOT_DIR/provision_scripts
CI_SCRIPTS=$ROOT_DIR/ci_scripts

RUBIES="2.0.0 1.9.3"
DEFAULT_RUBY="2.0.0"

function display_task {
    lightblue='\e[0;36m'
    nocolor='\e[0m'
    echo -e "${lightblue}"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo ">>>>>> $1 ..........."
    echo -e "${nocolor}"
}

function sudo_cmd {
    green='\e[0;32m'
    nocolor='\e[0m'
    echo -e "${green}[$(date)] sudo $@ ${nocolor}"
    sudo $@
}
