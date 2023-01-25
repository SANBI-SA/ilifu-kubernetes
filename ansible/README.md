## Toy Kubernetes deployment

This sets up the dependencies needed for Kubernetes (k8s) on a small network with
a single control plane node and two worker nodes. It is based on [this tutorial](https://adamtheautomator.com/cri-o/)
with a few hints from this [CRI-O tutorial](https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/install-cri-o-on-ubuntu-22-04.html).

*Note* that setting up the VMs and the security groups is not supported. That needs to be done with Terraform.

All steps up until the "Initializing Kubernetes Control Plane" one are supported.

### Known problems

1. The Terraform for setting up the VMs and the security groups is not yet written

2. The installation of GPG keys can fail if there is a network problem downloading the keys, and when it fails the error message is not clear.