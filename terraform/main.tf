# data "aws_instance" "instance_name" {
#   instance_id = "i-instanceid"

#   filter {
#     name   = "image-id"
#     values = ["ami-xxxxxxxx"]
#   }

#   filter {
#     name   = "tag:Name"
#     values = ["instance-name-tag"]
#   }
# }

# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"
#   region = "us-west-1"

#   tags = {
#     Name = "slimtech_vpc"
#   }
# }