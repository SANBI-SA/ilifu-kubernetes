# SANBI Ilifu K8s Cluster

This repo contains the code for deploying the base OpenStack-hosted infrastructure on Ilifu, followed by the deployment of a production-ready K8s cluster built on Kubespray.

The directories are as follows:

## 1. `terraform/`

This directory contains the Terraform code for setting up the infrastructure on Ilifu, it includes:

- Importing Keypairs
- Creating security groups
- Creating VMs
- Associating floating IPs
- Setting SANBI CloudNS records
- Bootstrapping VMs

## 2. `ansible/`

This directory contains preprocessing scripts in order to download and configure Kubespray to be used with the aforementioned Terraform-configured infrastructure on Ilifu.