#-------------------------------------------------------------------------------
# EC2 Key Pair
#-------------------------------------------------------------------------------
resource "aws_key_pair" "this" {
  count = var.create_ec2_ssh_keypair ? 1 : 0

  key_name   = var.ec2_ssh_keypair_name
  public_key = var.ec2_ssh_public_key

  tags = merge(
    { Name = "${var.friendly_name_prefix}-keypair" },
    { Name = var.ec2_ssh_keypair_name },
    var.common_tags
  )
}
