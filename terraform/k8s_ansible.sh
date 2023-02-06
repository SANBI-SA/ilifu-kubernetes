#!/bin/bash

sudo sed -i 's/nova.clouds.archive.ubuntu.com/ubuntu.mirror.ac.za/g' /etc/apt/sources.list
sudo apt update && sudo apt install -y git python3-venv
chmod 600 /home/ubuntu/ilifu.pem
source ~/ilifu-kubernetes-ansible/app-cred.sh
source ~/ansible/bin/activate
cd ~; python3 -m venv ansible
pip3 install -U pip
pip3 install 'ansible>=2.9' 'openstacksdk<=0.98.999'
cd ~/ilifu-kubernetes-ansible
ansible-galaxy install -r requirements.yml
ansible-playbook -i openstack.yml playbook.yml