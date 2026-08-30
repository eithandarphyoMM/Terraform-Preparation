resource "aws_instance" "hellocloud" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.hellocloud.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.hellocloud.id
  vpc_security_group_ids      = [aws_security_group.hellocloud.id]

  tags = {
    Name       = "${var.prefix}-hellocloud-instance"
    Department = "${var.department}"
  }
}

# We're using a little trick here so we can run the provisioner without
# destroying the VM. Do not do this in production.

# If you need ongoing management (Day N) of your virtual machines a tool such
# as Chef or Puppet is a better choice. These tools track the state of
# individual files and can keep them in the correct configuration.

# Here we do the following steps:
# Sync everything in files/ to the remote VM.
# Set up some environment variables for our script.
# Add execute permissions to our scripts.
# Run the deploy_app.sh script.

resource "null_resource" "configure-hellocloud-app" {
  depends_on = [aws_eip_association.hellocloud]

  triggers = {
    build_number = timestamp()
  }

  provisioner "file" {
    source      = "${path.module}/files/"
    destination = "/home/ubuntu/"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.hellocloud.private_key_pem
      host        = aws_eip.hellocloud.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt -y update",
      "sleep 15",
      "sudo apt -y update",
      "sudo apt -y install apache2",
      "sudo systemctl start apache2",
      "sudo chown -R ubuntu:ubuntu /var/www/html",
      "chmod +x *.sh",
      "PLACEHOLDER=${var.placeholder} WIDTH=${var.width} HEIGHT=${var.height} PLACEHOLDER_ID=${var.placeholder_id} PREFIX=${var.prefix} ./deploy_app.sh",
      "sudo apt -y install cowsay",
      "cowsay Hellooooooooooo!",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.hellocloud.private_key_pem
      host        = aws_eip.hellocloud.public_ip
    }
  }
}
