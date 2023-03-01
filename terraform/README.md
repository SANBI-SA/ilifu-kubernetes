# K8s Terraform

This Terraform repository creates virtual machines for the purpose of bootstrapping a Kubernetes cluster.

## TODO

- [ ] Create virtual networks dedicated to vms
- [ ] Pre-allocate floating IP(s) that will be fixed within Ilifu and import them as `datasource`
- [ ] Adjust metadata tagging to allow for dynamic inventory to be generated for Kubespray (match Kubespray expected host groups)


## How to Use

Variables for connecting to the OpenStack cloud at Ilifu (UCT) as well as connecting to the SANBI CloudNS servers are stored on Terraform Cloud.

1. Place the ilifu VM private key in the root directory (one above the `terraform` directory) `../ilifu.pem` with permission `0600`.

2. Place the OpenStack application credentials file in the root directory (one above the `terraform` directory) as `../app-cred.sh`. **NOTE: Due to the way that kubespray works, your `app-cred.sh` file must include the `OS_APPLICATION_CREDENTIAL_NAME` variable!**

3. ```bash
    terraform login # say yes and enter the team token
    terraform init
    terraform plan # optional
    terraform apply
    ```