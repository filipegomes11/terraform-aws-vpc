output "subnet_pub_1a" {
  value = aws_subnet.public_subnet_1a.id
}

output "subnet_pub_1b" {
  value = aws_subnet.public_subnet_1b.id
}

output "subnet_priv_1a" {
  value = aws_subnet.private_subnet_1a.id
}

output "subnet_priv_1b" {
  value = aws_subnet.private_subnet_1b.id
}

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC ID"
}