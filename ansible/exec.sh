#!/bin/bash

source ~/ansible/bin/activate
source ~/app-cred.sh
pip install -U pip
pip install -r pip-requirements.txt

ansible-galaxy install -r ansible-requirements.yml
ansible-playbook -i openstack.yml playbook.yml

cd kubespray
ansible-playbook -i inventory/ilifu-k8s/openstack.yml cluster.yml -b -v -u=ubuntu --private-key=/home/ubuntu/ilifu.pem