#!/usr/bin/env bash

sudo apt update
sudo apt -y install software-properties-common
sudo add-apt-repository -y ppa:projectatomic/ppa
sudo apt -y install podman
sudo mkdir -p /etc/containers
sudo curl -s https://raw.githubusercontent.com/projectatomic/registries/master/registries.fedora -o /etc/containers/registries.conf
sudo curl -s https://raw.githubusercontent.com/containers/skopeo/master/default-policy.json -o /etc/containers/policy.json

https://github.com/dynamist/ansible-role-cloud9-bootstrap.git