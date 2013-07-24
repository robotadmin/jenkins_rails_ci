#!/usr/bin/env bash

function load_rvm {
    source ~/.bash_profile
    rvm reload
}

function install_gems {
    gem install bundler
    bundle install --without production
    gem install syntax # get syntax highlighting
}

function cleanup {
    [ -d "jenkins" ] && rm -rf jenkins
    mkdir jenkins
}

# using ci_reporter gem to generate xml output that jenkins understands.
function run_tests {
    export RAILS_ENV=test
    rake db:migrate
    rake db:test:prepare
    export CI_REPORTS=jenkins/results
    export COVERAGE=true
    export SPEC_OPTS="--format html"
    rake ci:setup:rspec spec > jenkins/rspec.html
    export SPEC_OPTS="--tag js --format html"
    xvfb-run rake ci:setup:rspec spec > jenkins/rspec_js.html
}

function run_metrics {
    mkdir jenkins/metrics
    rails_best_practices -f html --output-file jenkins/metrics/rails_best_practices.html .
#    metric_fu --out jenkins/metrics
}
