#!/bin/bash

ansible-galaxy install -p roles -r rolesfile.yml

source ./secrets.conf
export ANSIBLE_STDOUT_CALLBACK=yaml
export ANSIBLE_HOST_KEY_CHECKING=false
ansible-playbook -v playbooks/01_create_vms.yml -e @extravars.yml
