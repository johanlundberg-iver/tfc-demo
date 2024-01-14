terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
  backend "remote" {
    organization = "partner-iver-accelerate-ab-shared"
    workspaces {
      name = "tfc-demo"
    }
  }
}