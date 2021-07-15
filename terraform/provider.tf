terraform {
  required_version = ">= 1.0.0"
  backend "http" {
  }
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

