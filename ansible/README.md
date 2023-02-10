# Kubespray bootstrap

This ansible repository is responsible for setting up the environment to allow for dynamically running Kubespray.

## TODO

- [ ] Create playbook that will install required dependencies
- [ ] Set up `openstack.yml` dynamic host file up correctly for Kubespray
- [ ] Assign correct `etcd` variable to appropriate hosts from k8s-control-plane group
- [ ] Download Kubespray
- [ ] Set Kubespray variables appropriate to the environment based on the prior Terraform job
- [ ] Invoke Kubespray with dynamic inventory (and appropriate vars)