terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider for Master
provider "aws" {
  shared_config_files      = ["/Users/tf_user/.aws/config"]
  shared_credentials_files = ["/Users/tf_user/.aws/credentials"]
  profile                  = "aws-master"
  alias                    = "aws_master"
}

# Configure the AWS Provider for Dev
provider "aws" {
  shared_config_files      = ["/Users/tf_user/.aws/config"]
  shared_credentials_files = ["/Users/tf_user/.aws/credentials"]
  profile                  = "aws-dev"
  alias                    = "aws_dev"
}