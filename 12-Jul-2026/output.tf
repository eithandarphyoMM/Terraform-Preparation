output "vault_mater_server_auth_list" {
  value = data.vault_auth_backends.vault_master_server.*
}

output "vault_dev_server_auth_list" {
  value = data.vault_auth_backends.vault_dev_server.*
}