# CNFP1 Session 39 - Terraform Session 05

# 1. Security Group Setup

### Inbound Rule
* Protocol: SSH
* Port Range: `22`
* Source: My IP (`122.216.76.74/32`)

### Outbound Rule
* Allow Any: `0.0.0.0/0`

### Subnet & Addressing
* Subnet: Default (Public Subnet)
* Public IP Address: 1 Public IP assigned

---

# 2. Create an EC2 Instance (in Public Subnet)

* Key Pair: `master-jp-keypair`
* VPC: Default VPC
* Subnet: Public Subnet
* Public IP: Enabled

### Security Controls (2 Key Points)
1. Security Group: Inbound restricted to trusted source IP.
2. Private Key: `.pem` key pair required for SSH authentication.

### Connection Steps

# Set strict permissions on private key
# chmod 400 master-jp-keypair.pem

# SSH into Bastion Host / Public Instance
# ssh -i master-jp-keypair.pem ubuntu@18.182.1.60

# Create AWS Key Pair using local public key
# resource "aws_key_pair" "master_key" {
#   key_name   = "master-japan-key"
#   public_key = file("${path.module}/master-japan-key.pub")
# }

# Attach Key Pair to Public EC2 Instance
# resource "aws_instance" "bastion_host" {
#   ami           = "ami-0d52744d6551d851e" # Ubuntu AMI
#   instance_type = "t2.micro"
#   key_name      = aws_key_pair.master_key.key_name

#   vpc_security_group_ids = [aws_security_group.bastion_sg.id]
#   subnet_id              = aws_subnet.public_subnet.id

#   tags = {
#     Name = "bastion-host"
#   }
# }
