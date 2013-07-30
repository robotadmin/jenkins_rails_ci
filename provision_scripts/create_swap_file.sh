#!/usr/bin/env bash

# http://serverfault.com/questions/317115/jenkins-ci-cannot-allocate-memory

sudo dd if=/dev/zero of=/media/swapfile.img bs=1024 count=1M
sudo mkswap /media/swapfile.img
sudo swapon /media/swapfile.img
cat /proc/swaps
sudo echo "/media/swapfile.img swap swap sw 0 0" >> /etc/fstab
