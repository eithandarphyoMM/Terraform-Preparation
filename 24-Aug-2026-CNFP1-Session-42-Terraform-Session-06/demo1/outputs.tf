output "deployment_id" {
  value = local.deployment_id
}

output "ssh_private_key" {
  value     = tls_private_key.ssh.private_key_openssh
  sensitive = true
}

output "ssh_public_key" {
  value = tls_private_key.ssh.public_key_openssh
}
