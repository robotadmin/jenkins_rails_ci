
# Provisioning of Jenkins for rails continuous integration

This project provides provisioning files for setting up a jenkins server for doing ruby on rails continuous integration and deployment, with Vagrant support. Still under active development.

<!--- ----------------------------------------------------------- -->
# Usage

<!--- ----------------------------------------------------------- -->
## Usage - Provisioning a regular server:

    git clone git@github.com:robotadmin/jenkins_rails_ci.git
    cd jenkins_rails_ci
    source bootstrap.sh

<!--- ----------------------------------------------------------- -->
### Attention -- when provisioning Amazon AWS:

If you run the machine as is in the free tier, you can get an error "java.io.IOException: error=12, Cannot allocate memory". This is due jenkins not being able to allocate memory as a result of the JVM forking process (see [this stackoverflow question for an excellent explanation](http://serverfault.com/questions/317115/jenkins-ci-cannot-allocate-memory)). There are two main steps that you should follow in order to prevent this from happening:

* First, configure a swap file (or swap partition). I added a helper script for that which is [here]().
* Second, edit /etc/default/jenkins, and add the following line to adjust the size of the JVM heap size:

    JAVA_ARGS="-Xmx128m -Xms128m"

You can experiment with the arguments a bit (see more info [here](http://javahowto.blogspot.pt/2006/06/6-common-errors-in-setting-java-heap.html)) -- 128m was really the maximum size of the JVM that I could allow in the Amazon AWS free tier.

<!--- ----------------------------------------------------------- -->
## Usage - Provisioning a vagrant environment:

* copy the contents of the repo into your vagrant shared directory (which will be "shared" in /vagrant inside the virtual machine)
* add the following line to your Vagrantfile:
    config.vm.provision :shell, :path => "bootstrap.sh"
* boot the VM normally with "vagrant init".

For more information about provisioning Vagrant, check out [this link](http://docs.vagrantup.com/v2/getting-started/provisioning.html)

I used bootstrap.sh normally to provision a Amazon AWS machine. However, [this project](https://github.com/mitchellh/vagrant-aws) looks promising, it allows you to control and provision an AWS machine based on Vagrant.


<!--- ----------------------------------------------------------- -->
## Configurations

<!--- ----------------------------------------------------------- -->
## What bootstrap.sh does

<!--- ----------------------------------------------------------- -->
## What boostrap.sh doesn't do (aka "future work")

<!--- ----------------------------------------------------------- -->
## How to configure Jenkins

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

<!--- ----------------------------------------------------------- -->
# Thanks

* Thanks [@jmmendes](https://github.com/jmmendes) for help debugging and configuring.