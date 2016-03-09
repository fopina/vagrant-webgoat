#!/usr/bin/env bash

set -e

# install JRE
apt-get -qq install default-jre-headless

# download WebGoat with embedded tomcat
wget -q https://s3.amazonaws.com/webgoat-war/webgoat-container-7.0.1-war-exec.jar
