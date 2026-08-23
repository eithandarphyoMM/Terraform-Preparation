resource "aws_key_pair" "master-keypair" {
  key_name   = "master-japan-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDJhXndVvl2qiQSXDw9/eTCMPtmUUu6s8ro9Bm+PRMCL root@ubuntu"
}
