terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "remote" {
    organization = "ckhedhiri "

    workspaces {
      name = "github-trigger"
    }
  }
}