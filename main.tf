terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "1.53.0"
    }
  }
  backend "remote" {
    organization = "partner-iver-accelerate-ab-shared"
    workspaces {
      name = "tfc-demo"
    }
  }
}
provider "openstack" {
  user_name = "johan.lundberg@iver.se"
  tenant_name = "Demo-johan.lundberg"
  password = var.os_password
  auth_url = "https://sto-api.elits.com:5000/v3"
}