
# TL;DR

Initially, this repo provided vagrant provisioning files for setting up a jenkins server for doing ruby on rails continuous integration and deployment. (including the Vagrantfile, if you are interested). It's tailored to serve my specific needs, but it is configurable (more on that below).

<!--- ----------------------------------------------------------- -->
# How to use it

<!--- ----------------------------------------------------------- -->
## For provisioning a regular server:

    git clone git@github.com:robotadmin/jenkins_rails_ci.git
    cd jenkins_rails_ci
    source bootstrap.sh

<!--- ----------------------------------------------------------- -->
## For provisioning a vagrant environment:

* copy the contents of the repo into your vagrant shared directory (which will be "shared" in /vagrant inside the virtual machine)
* add the following line to your Vagrantfile:

    config.vm.provision :shell, :path => "bootstrap.sh"

For more information about provisioning Vagrant, check out [this link](http://docs.vagrantup.com/v2/getting-started/provisioning.html)

<!--- ----------------------------------------------------------- -->
## Configurations

<!--- ----------------------------------------------------------- -->
## What bootstrap.sh does

<!--- ----------------------------------------------------------- -->
## What boostrap.sh doesn't do (aka "future work")

<!--- ----------------------------------------------------------- -->
## Helper scripts

* There are helper scripts for


<!--- ----------------------------------------------------------- -->
## Nice references on using jenkins for continuous integration and deploy for rails applications

* http://rails-jenkins.danmcclain.net/
* http://jenkins-ci.361315.n4.nabble.com/Installing-Jenkins-plugins-via-API-td4639021.html
* http://serverfault.com/questions/321167/add-correct-host-key-in-known-hosts-multiple-ssh-host-keys-per-hostnam
* https://wiki.jenkins-ci.org/display/JENKINS/Configuring+a+Rails+build

* http://stackoverflow.com/questions/5212304/authenticate-jenkins-ci-for-github-private-repository
* http://stackoverflow.com/questions/7116635/capybara-webkit-rspec-integration-specs-and-xvfb-webkit-server-fatal-io-erro