#!/usr/bin/env bash

ROOT_DIR=$(( [ -d /vagrant ] ? /vagrant : . ))
SECRET_KEYS_DIR=$ROOT_DIR/secret_keys
PUB_KEYS_DIR=$ROOT_DIR/pub_keys
PROVISION_SCRIPTS=$ROOT_DIR/provision_scripts
CI_SCRIPTS=$ROOT_DIR/ci_scripts

RUBIES="2.0.0 1.9.3"
DEFAULT_RUBY="2.0.0"
