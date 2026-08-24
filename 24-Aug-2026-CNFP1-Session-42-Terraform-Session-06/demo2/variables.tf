variable "friendly_name_prefix" {
  type        = string
  description = "Friendly name prefix used for tagging and naming AWS resources."
}

variable "common_tags" {
  type        = map(string)
  description = "Map of common tags for all taggable AWS resources."
  default     = {}
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources."
  default     = "ap-northeast-1"
}

#-------------------------------------------------------------------------------
# EC2 SSH Key Pairs
#-------------------------------------------------------------------------------
variable "create_ec2_ssh_keypair" {
  type        = bool
  description = "Boolean to create EC2 SSH key pair. This is separate from the 'bastion_keypair' input variable."
  default     = false
}

variable "ec2_ssh_keypair_name" {
  type        = string
  description = "Name of EC2 SSH key pair."
  default     = "ec2-keypair"
}

variable "ec2_ssh_public_key" {
  type        = string
  description = "Public key material for EC2 SSH Key Pair."
  default     = null
}

