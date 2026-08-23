output "hellocloud-rsa-key-pair-id" {
  value = aws_key_pair.master-keypair.id
}

output "hellocloud-rsa-key-pair-arn" {
  value = aws_key_pair.master-keypair.arn
}

output "hellocloud-rsa-key-pair-name" {
  value = aws_key_pair.master-keypair.key_name
}

output "hellocloud-rsa-key-pair-type" {
  value = aws_key_pair.master-keypair.key_type
}

