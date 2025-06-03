output "public_subnet_ids" {
  value       = values(aws_subnet.public)[*].id
  description = "Public Subnets ID"
}

output "private_subnet_ids" {
  value       = values(aws_subnet.private)[*].id
  description = "Private Subnets ID"
}

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC ID"
}