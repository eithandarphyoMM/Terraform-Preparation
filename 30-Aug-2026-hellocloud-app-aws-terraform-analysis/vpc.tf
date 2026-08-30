resource "aws_vpc" "hellocloud" {
  cidr_block           = var.address_space
  enable_dns_hostnames = true

  tags = {
    name        = "${var.prefix}-vpc-${var.region}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "hellocloud" {
  vpc_id     = aws_vpc.hellocloud.id
  cidr_block = var.subnet_prefix

  tags = {
    name = "${var.prefix}-subnet"
  }
}

resource "aws_security_group" "hellocloud" {
  name = "${var.prefix}-security-group"

  vpc_id = aws_vpc.hellocloud.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    Name = "${var.prefix}-security-group"
  }
}

resource "aws_internet_gateway" "hellocloud" {
  vpc_id = aws_vpc.hellocloud.id

  tags = {
    Name = "${var.prefix}-internet-gateway"
  }
}

resource "aws_route_table" "hellocloud" {
  vpc_id = aws_vpc.hellocloud.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hellocloud.id
  }
}

resource "aws_route_table_association" "hellocloud" {
  subnet_id      = aws_subnet.hellocloud.id
  route_table_id = aws_route_table.hellocloud.id
}

resource "aws_eip" "hellocloud" {
  instance = aws_instance.hellocloud.id
#   domain   = "vpc"
}

resource "aws_eip_association" "hellocloud" {
  instance_id   = aws_instance.hellocloud.id
  allocation_id = aws_eip.hellocloud.id
}
