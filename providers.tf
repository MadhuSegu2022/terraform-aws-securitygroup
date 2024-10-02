terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
  cloud {

    organization = "AchieveGoals"

    workspaces {
      name = "terraform-aws-securitygroup"
    }
  }
}
#added comments
provider "aws" {
  # Configuration options
  region = "ap-south-1"
}