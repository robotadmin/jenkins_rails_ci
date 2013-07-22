#!/usr/bin/env bash

source ~/.bash_profile
rvm reload
gem install bundler
bundle install --without production
rake test:ci
rake deploy:demo
