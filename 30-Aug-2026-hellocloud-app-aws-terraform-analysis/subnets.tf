#-------------------------------------------------------------------------------
# Subnets
#-------------------------------------------------------------------------------
resource "aws_subnet" "public" {
  count = var.create_vpc ? length(var.public_subnet_cidrs) : 0

  vpc_id                  = aws_vpc.main[0].id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true

  tags = merge(
    { Name = "${var.friendly_name_prefix}-public-${element(data.aws_availability_zones.available.names, count.index)}" },
    var.common_tags
  )
}

resource "aws_subnet" "private" {
  count = var.create_vpc ? length(var.private_subnet_cidrs) : 0

  vpc_id                  = aws_vpc.main[0].id
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = false

  tags = merge(
    { Name = "${var.friendly_name_prefix}-private-${element(data.aws_availability_zones.available.names, count.index)}" },
    var.common_tags
  )
}