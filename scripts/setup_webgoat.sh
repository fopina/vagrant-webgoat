#!/usr/bin/env bash

set -e

# add to crontab
echo "@reboot nohup java -jar /home/vagrant/webgoat-container-7.0.1-war-exec.jar >&1 > /home/vagrant/webgoat.log &" | crontab

# run it
nohup java -jar /home/vagrant/webgoat-container-7.0.1-war-exec.jar >&1 > /home/vagrant/webgoat.log &
