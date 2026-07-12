terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "5.10.1"
    }
  }
}

#vault server 1
provider "vault" {
  # Configuration options
  address = "http://127.0.0.1:8200"
  token  = "〇〇〇〇〇〇〇〇〇〇〇〇〇〇" # Replace with your Vault token
  alias   = "cloudlab-master"
}

#vault server 2
provider "vault" {
  address = "http://127.0.0.1:8202" 
  token  = "〇〇〇〇〇〇〇〇〇〇〇〇〇〇" # Replace with your Vault token
  alias   = "cloudlab-prod"
}