#!/usr/bin/env bash

if [ -d /vagrant/config/all.sh ]
    then # we are in a vagrant environment
    echo "vagrant environment!"
    source /vagrant/config/all.sh
    else # we are in a "regular" environment
    echo "non-vagrant environment!"
    source ./config/all.sh
fi

function display_task {
    lightblue='\e[1;36m'
    nocolor='\e[0m'
    echo -e "${lightblue}"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo ">>>>>> $1 ..........."
    echo -e "${nocolor}"
}

# -----------------------------------------------------
display_task "running aptitude update"
sudo apt-get update

# -----------------------------------------------------
PREREQUISITES="git-core curl wget"
display_task "installing $PREREQUISITES"
for pckg in $PREREQUISITES
  do sudo apt-get install -y $pckg
done

# -----------------------------------------------------
display_task "installing jenkins and plugins"
source $PROVISION_SCRIPTS/install_jenkins_and_plugins.sh

# -----------------------------------------------------
display_task "installing heroku toolbelt"
sudo wget  2> /dev/null --quiet -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# -----------------------------------------------------
display_task "installing project dependencies"
source $PROVISION_SCRIPTS/prepare_project_dependencies.sh

# -----------------------------------------------------
display_task "installing rvm and rubies for user jenkins"
source $PROVISION_SCRIPTS/install_rvm_and_rubies.sh

# -----------------------------------------------------
display_task "preparing ssh keys for git, user jenkins"
source $PROVISION_SCRIPTS/prepare_ssh_keys.sh

# -----------------------------------------------------
display_task "preparing git identity"
sudo su jenkins -c "source $PROVISION_SCRIPTS/prepare_git_identity.sh"

# -----------------------------------------------------
display_task "copying continuous integration scripts for jenkins"
sudo cp -r $CI_SCRIPTS ~jenkins
sudo chown jenkins ~jenkins/ci_scripts
