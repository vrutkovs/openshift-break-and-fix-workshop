Openshift Break and Fix workshop
====

1. Create `secrets.conf` with
   ```
   export AWS_ACCESS_KEY_ID=foo
   export AWS_SECRET_ACCESS_KEY=bar
   ```
1. Create `playbooks/files/ssh-privatekey` and `playbooks/files/ssh-publickey`
   These are custom ssh private/public key pairs which can be given to attendees.
1. Adjust `extravars.yml` to modify instance settings
1. Run `01_create_clusters.sh`. This would create a number of VMs and save each of these in
  `inventory/cluster-<n>` inventory files
1. Adjust `inventory/group_vars/OSEv3.yml`
1. Run `02_setup_okd.sh` - this would setup OKD on these clusters
1. Set `level: <n>` for each cluster in `inventory/host_vars/cluster-*`
   These are different types of puzzles, see `playbooks/levels`
1. Run `03_break.sh` to break all clusters
1. Whenever the cluster is fixed change `level` in cluster host_vars and run 
   ```
   ansible-playbook -i inventory/cluster-<n> playbooks/03_deploy_and_break.yml
   ```
