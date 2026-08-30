data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    # values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Fetch available AZs in the current region
data "aws_availability_zones" "available" {
  state = "available"
}

# Primary VPC resource referenced by aws_vpc.main[0].id
resource "aws_vpc" "main" {
  count      = var.create_vpc ? 1 : 0
  cidr_block = "10.0.0.0/16"

  tags = merge(
    { Name = "${var.friendly_name_prefix}-vpc" },
    var.common_tags
  )
}
