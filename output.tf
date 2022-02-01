# VPC ID
output "vpc_id" {
  value = aws_vpc.development.id
}

# EC2 INSTANCE PUBLIC IP ADDRESS
output "ec_instance_public_ip" {
  value = aws_instance.web01.public_ip
}

# EC2 INSTANCE PUBLIC DNS
output "ec_instance_dns" {
  value = aws_instance.web01.public_dns
}
