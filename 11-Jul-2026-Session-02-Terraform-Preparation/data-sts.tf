data "aws_caller_identity" "aws_master_admin" {
  provider = aws.aws-master-admin
}

data "aws_caller_identity" "aws_dev_admin" {
  provider = aws.aws-dev-admin
}

data "aws_caller_identity" "aws_prod_admin" {
  provider = aws.aws-prod-admin
}