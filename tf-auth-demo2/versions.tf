terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "aws-master-admin"
  alias   = "aws-master-admin"
}

provider "aws" {
  profile = "aws-dev-admin"
  alias   = "aws-dev-admin"
}

provider "aws" {
  profile = "aws-prod-admin"
  alias   = "aws-prod-admin"
}