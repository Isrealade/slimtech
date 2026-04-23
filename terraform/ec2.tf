data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

variable "name" {
  type        = string
  default     = "slim_tech"
  description = "The project name"
  sensitive   = true
}

variable "vpc_config" {
  type = object({
    cidr_block         = string
    instance_tenancy   = string
    enable_dns_support = bool

    tags = map(string)
  })

  description = "The configuration of the VPC"
}

# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "slimtech_vpc"
#   }
# }

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }

  depends_on = [data.aws_ami.ubuntu, aws_vpc.main]
}

resource "aws_instance" "example_instance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.main.id
  associate_public_ip_address = true


  tags = {
    Name = var.name
  }
}

# resource "aws_eip" "ec2" {
#   instance = aws_instance.example_instance.id
#   domain   = "vpc"
# }

resource "aws_vpc" "main" {
  cidr_block         = var.vpc_config.cidr_block
  instance_tenancy   = var.vpc_config.instance_tenancy
  enable_dns_support = var.vpc_config.enable_dns_support

  tags = var.vpc_config.tags
}

# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"
#   enable_dns_support = true

#   tags = {
#     Name = "main"
#   }
# }