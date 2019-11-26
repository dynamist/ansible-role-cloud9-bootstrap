#!/usr/bin/env bash

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key AD319E0F7CFFA38B4D9F6E55CE3F3DE92099F7A4
sudo apt install -y software-properties-common
sudo add-apt-repository "deb https://vagrant-deb.linestarve.com/ any main"
sudo apt install -y vagrant

vagrant plugin install vagrant-vbguest