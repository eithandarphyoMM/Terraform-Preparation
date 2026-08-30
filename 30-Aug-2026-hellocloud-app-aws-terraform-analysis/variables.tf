variable "region" {
  description = "The region where the resources are created."
  default     = "ap-southeast-1"
}

variable "prefix" {
  description = "This prefix will be included in the name of most resources."
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

variable "environment" {
  default     = "Production"
  description = "target environment"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.10.0/24"
}

variable "instance_type" {
  description = "Specifies the AWS instance type."
  default     = "t3.micro"
}

variable "department" {
  default     = "devops"
  description = "department"
}

variable "placeholder" {
  default     = "placebear.com"
  description = "Image-as-a-service URL. Some other fun ones to try are fillmurray.com, placecage.com, placebeard.it, loremflickr.com, baconmockup.com, placeimg.com, placebear.com, placeskull.com, stevensegallery.com, placedog.net"
}

variable "placeholder_id" {
  default     = "2"
  description = "Image-as-a-service URL. Some other fun ones to try are fillmurray.com, placecage.com, placebeard.it, loremflickr.com, baconmockup.com, placeimg.com, placebear.com, placeskull.com, stevensegallery.com, placedog.net"
}

variable "width" {
  default     = "600"
  description = "Image width in pixels."
}

variable "height" {
  default     = "400"
  description = "Image height in pixels."
}

variable "create_vpc" {
  description = "Controls if VPC and subnets should be created"
  type        = bool
  default     = true
}

variable "friendly_name_prefix" {
  description = "Prefix used for naming resources"
  type        = string
  default     = "my-app"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
