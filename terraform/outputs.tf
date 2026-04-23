output "instance_public_ip" {
  description = "The public IP address for the instance"
  value       = aws_instance.example_instance.public_ip
}

output "vpc_cidr_block" {
  description = "The VPC cidr block"
  value       = aws_vpc.main.cidr_block

  # sensitive = true
}