terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = "4.1.0"
    # }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.2.1"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "4.5.0"
    }
  }
}
