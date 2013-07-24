#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/tasks.sh

load_rvm
install_gems
cleanup
run_tests
run_metrics

rake deploy:demo
