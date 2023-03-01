# Kubespray bootstrap

This ansible repository is responsible for setting up the environment to allow for dynamically running Kubespray.

## TODO

- [X] Create playbook that will install required dependencies
- [x] Set up `openstack.yml` dynamic host file up correctly for Kubespray
- [X] Assign correct `etcd` variable to appropriate hosts from k8s-control-plane group
- [X] Download Kubespray
- [X] Set Kubespray variables appropriate to the environment based on the prior Terraform job
- [X] Invoke Kubespray with dynamic inventory (and appropriate vars)