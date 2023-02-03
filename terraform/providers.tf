terraform {
  
  cloud {
    organization = "SANBI"
    workspaces {
      name = "ilifu-kubernetes"
    }
  }

  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "1.49.0"
    }
  }
}

provider "openstack" {
  # Configuration options
}