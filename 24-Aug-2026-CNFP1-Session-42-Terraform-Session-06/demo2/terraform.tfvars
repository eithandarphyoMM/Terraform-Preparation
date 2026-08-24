create_ec2_ssh_keypair = true

# --- Common --- #
friendly_name_prefix = "eithandar"

common_tags = {
  App         = "production-prereqs"
  Environment = "production"
  Owner       = "eithandar"
  #   Name        = "production-keypair"
}

ec2_ssh_keypair_name = "production-keypair"
ec2_ssh_public_key   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDK8DHtP+do3Grg3QNMgFHMgkA8k85mEUq1ji7MUUvCG/pWEr1J9/JKYtbFswHMbYZ8+PyksCiRgdfkqbOgmGfaLGknWYhl9cKts/AqDiLNuhcLVRtxaekfcOrEdUU+2JTi9RtaSvszn/WWlXEQE4YsL+tGrQNmVBRd4v2Gu9ug9oxpP2EE7WTu0IGRlqwZvvqU2FAl/9OMDlsS0qDihRJxdqQXXQ3usI8yBT5sjNg9lv4CUtqI6yOWOyojhqAeRENhmh/eMpTTTQiioJxIkgXFUYI3jb5AyzOn0aOCaaqFVpHV13yKIM4wXQs7aQpGbK/w/FWm7RHgQVc1leXu3MZ1xOvq0MoiQVOZt+89Hu2+c4s2HtmnRXBvAbeu/8S8FR0SPGan+0XxdszqtJFKsDN/JKrOc6o/p7xVcKwJj/N3VrZLVJZmsifQO+mKjMF7LSlV4mxtYxnkU5fn1DPng9weiCJIXjoLkKnA0BAQCxNvFW9fGT96sOAVoR3PhlxGsPyhTR7asl7uhJ8a6WtxCludcOHNxorQcaPFJD1DNE4jcGXdt7j7IjprfVVLFVOSPuP+f9udYM9+3TJJINWlq2Q11r2BFWmDXr6oHl48Ty8rYMzry/XqDpip341/apdq/Y/Wm9DdILNoI3jDOnoPVpNhAhG8V+DpCn5aWe9k5Swipw== root@ubuntu"
