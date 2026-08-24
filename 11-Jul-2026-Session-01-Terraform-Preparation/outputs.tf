# Outputs for the Master Profile
output "master_sts_user_id" {
  value       = data.aws_caller_identity.master_sts.user_id
  description = "The Unique IAM User ID for Master"
}

output "master_sts_account" {
  value       = data.aws_caller_identity.master_sts.account_id
  description = "The 12-digit AWS Account ID for Master"
}

output "master_sts_arn" {
  value       = data.aws_caller_identity.master_sts.arn
  description = "The full ARN for Master"
}

# Outputs for the Dev Profile
output "dev_sts_user_id" {
  value       = data.aws_caller_identity.dev_sts.user_id
  description = "The Unique IAM User ID for Dev"
}

output "dev_sts_account" {
  value       = data.aws_caller_identity.dev_sts.account_id
  description = "The 12-digit AWS Account ID for Dev"
}

output "dev_sts_arn" {
  value       = data.aws_caller_identity.dev_sts.arn
  description = "The full ARN for Dev"
}