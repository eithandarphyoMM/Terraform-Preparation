data "vault_auth_backends" "vault_master_server" {
  provider = vault.vrd1
}

data "vault_auth_backends" "vault_dev_server" {
  provider = vault.vrd2
}