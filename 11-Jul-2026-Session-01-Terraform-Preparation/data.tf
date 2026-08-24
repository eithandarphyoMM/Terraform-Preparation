# --- Existing IAM User Lookups ---
data "aws_iam_user" "aws_master" {
  provider  = aws.aws_master
  user_name = "master-console-admin"
}

data "aws_iam_user" "aws_dev" {
  provider  = aws.aws_dev
  user_name = "dev-console-admin"
}

# --- New STS Caller Identity Queries ---
data "aws_caller_identity" "master_sts" {
  provider = aws.aws_master # Queries the aws-master profile identity
}

data "aws_caller_identity" "dev_sts" {
  provider = aws.aws_dev    # Queries the aws-dev profile identity
}