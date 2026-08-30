resource "tls_private_key" "hellocloud" {
  algorithm = "ED25519"
}

locals {
  private_key_filename = "${var.prefix}-ssh-key.pem"
}

resource "aws_key_pair" "hellocloud" {
  key_name   = local.private_key_filename
  public_key = tls_private_key.hellocloud.public_key_openssh
}