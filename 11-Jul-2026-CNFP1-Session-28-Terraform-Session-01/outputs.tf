# Outputs for the Master Profile
output "aws_master_admin_user_id" {
  description = "Unique identifier of the calling entity."
  value       = data.aws_caller_identity.aws-master-admin.user_id
}

output "aws_master_admin_account" {
  description = "Account ID number of the account that owns or contains the calling entity."
  value       = data.aws_caller_identity.aws-master-admin.id
}

output "aws_master_admin_arn" {
  description = "ARN associated with the calling entity."
  value       = data.aws_caller_identity.aws-master-admin.arn
}