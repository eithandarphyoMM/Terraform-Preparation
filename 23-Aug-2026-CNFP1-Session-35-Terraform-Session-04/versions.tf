terraform {
  required_version = "1.15.9"

  cloud {
    organization = "HelloCloud_learning" # https://app.terraform.io/app/HelloCloud_learning/workspaces
    hostname     = "app.terraform.io"    # Required for  Terraform Enterprise, Optional; defaults to app.terraform.io

    workspaces {
      name = "hellocloud-tfc-random-string"
    }
  }
}

