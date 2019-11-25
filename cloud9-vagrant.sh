#!/usr/bin/env bash

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -c -s) contrib"
sudo apt install -y virtualbox-6.0 dkms

#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key AD319E0F7CFFA38B4D9F6E55CE3F3DE92099F7A4 D2BABDFD63EA9ECAB4E09C7228A873EA3C7C705F
#sudo bash -c 'echo deb https://vagrant-deb.linestarve.com/ any main > /etc/apt/sources.list.d/wolfgang42-vagrant.list'

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key AD319E0F7CFFA38B4D9F6E55CE3F3DE92099F7A4
sudo add-apt-repository "deb https://vagrant-deb.linestarve.com/ any main"
sudo apt install -y vagrant

vagrant box add --provider virtualbox bento/centos-7.7

#vagrant init bento/centos-7.7
#vagrant up

#VBoxManage list vms