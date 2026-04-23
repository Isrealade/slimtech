# data "aws_availability_zone" "azs" {
#   all_availability_zones = true
#   state                  = "available"
# }

# resource "aws_vpc" "main" {
#   for_each             = var.vpc_config
#   cidr_block           = each.value.cidr_block
#   enable_dns_support   = each.value.enable_dns_support
#   enable_dns_hostnames = each.value.enable_dns_hostnames

#   tags = each.value.tags
# }

# resource "aws_subnet" "public" {
#   for_each                = var.vpc_config
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = each.value.public_subnet.cidr_block
#   availability_zone       = data.aws_availability_zones.available.names[0]
#   map_public_ip_on_launch = each.value.public_subnet.map_public_ip_on_launch

#   tags = each.value.public_subnet.tags
# }

# resource "aws_subnet" "private" {
#   for_each                = var.vpc_config
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = each.value.public_subnet.cidr_block
#   availability_zone       = data.aws_availability_zones.available.names[1]
#   map_public_ip_on_launch = each.value.public_subnet.map_public_ip_on_launch

#   tags = each.value.public_subnet.tags
# }

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_eip" "vpc" {
#   instance = aws_instance.main.id
#   domain   = "vpc"
# }

# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.vpc.id
#   vpc_id        = aws_vpc.main.id

#   tags = var.vpc_config.tags

#   depends_on = [aws_internet_gateway.igw]
# }

# resource "aws_security_group" "main" {
#   name        = "example"
#   description = "Security group for VPC"
#   vpc_id      = aws_vpc.main.id

#   tags = {
#     Name = "example"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "ingress" {
#   for_each          = var.ingress_security_group_rules
#   security_group_id = aws_security_group.main.id

#   cidr_ipv4   = each.value.cidr_ipv4
#   from_port   = each.value.from_port
#   ip_protocol = each.value.ip_protocol
#   to_port     = each.value.to_port
# }