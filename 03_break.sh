#!/bin/bash

source ./secrets.conf
export ANSIBLE_STDOUT_CALLBACK=yaml
export ANSIBLE_HOST_KEY_CHECKING=false

for inventory in "$(find inventory -maxdepth 1 -type f)"; do
  ansible-playbook -v -i "${inventory}" playbooks/03_deploy_and_break.yml
done
