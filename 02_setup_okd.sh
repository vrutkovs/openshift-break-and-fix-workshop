#!/bin/bash

export ANSIBLE_STDOUT_CALLBACK=yaml
export ANSIBLE_CONFIG=roles/openshift-ansible/ansible.cfg
export ANSIBLE_HOST_KEY_CHECKING=false

for inventory in "$(find inventory -maxdepth 1 -type f)"; do
  ansible-playbook -v -i "${inventory}" playbooks/02_prepare_repos.yml

  ansible-playbook -v -i "${inventory}" \
    roles/openshift-ansible/playbooks/openshift-node/network_manager.yml
  ansible-playbook -v -i "${inventory}" \
    roles/openshift-ansible/playbooks/prerequisites.yml
  ansible-playbook -v -i "${inventory}" \
    roles/openshift-ansible/playbooks/deploy_cluster.yml
done
