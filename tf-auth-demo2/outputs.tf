# Outputs for the Master Profile
output "aws_master_admin_user_id" {
  description = "Unique identifier of the calling entity."
  value       = data.aws_caller_identity.aws_master_admin.user_id
}

output "aws_master_admin_account" {
  description = "Account ID number of the account that owns or contains the calling entity."
  value       = data.aws_caller_identity.aws_master_admin.id
}

output "aws_master_admin_arn" {
  description = "ARN associated with the calling entity."
  value       = data.aws_caller_identity.aws_master_admin.arn
}

# Outputs for the Dev Profile
output "aws_dev_admin_user_id" {
  description = "Unique identifier of the calling entity."
  value       = data.aws_caller_identity.aws_dev_admin.user_id
}

output "aws_dev_admin_account" {
  description = "Account ID number of the account that owns or contains the calling entity."
  value       = data.aws_caller_identity.aws_dev_admin.id
}

output "aws_dev_admin_arn" {
  description = "ARN associated with the calling entity."
  value       = data.aws_caller_identity.aws_dev_admin.arn
}

# Outputs for the Prod Profile
output "aws_prod_admin_user_id" {
  description = "Unique identifier of the calling entity."
  value       = data.aws_caller_identity.aws_prod_admin.user_id
}

output "aws_prod_admin_account" {
  description = "Account ID number of the account that owns or contains the calling entity."
  value       = data.aws_caller_identity.aws_prod_admin.id
}

output "aws_prod_admin_arn" {
  description = "ARN associated with the calling entity."
  value       = data.aws_caller_identity.aws_prod_admin.arn
}