# AWS EC2 INSTANCE
resource "aws_instance" "web01" {
  connection {
    type = "ssh"
    user = "centos"
    host = self.public_ip
  }

  ami                         = var.aws_amis
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.user_key.key_name
  vpc_security_group_ids      = [aws_security_group.web_and_ssh.id]
  subnet_id                   = aws_subnet.subnet01.id
  associate_public_ip_address = true

  tags = {
    Name = "Testing"
  }

  provisioner "local-exec" {
    command     = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos -i '${self.public_ip},' --extra-var 'wp_url=${self.public_dns}' playbook.yml"
    working_dir = "ansible"
  }
}
