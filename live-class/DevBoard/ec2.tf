resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
    count = 3
    vpc_id = aws_vpc.main.id 
    cidr_block = "10.0.${count.index}.0/32"
}

list = ["a", "b", "c"]

length(list)

resource "aws_instance" "instance1" {
  count = 10
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet[5 % 3].id

  subnet_id                   = aws_subnet.public_subnet[count.index % 3].id

  subnet_id                   = aws_subnet.public_subnet[count.index % length(aws_subnet.public_subnet)].id
  associate_public_ip_address = true


  tags = {
    Name = "Server ${count.index}"
  }
}

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


variable "ec2_config" {
    type = map(object({
      instance_type = string
      associate_public_ip_address = bool
      environment = string
    }))
}


# each.key
# each.value

resource "aws_instance" "instance" {
  for_each = var.ec2_config
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = each.value.instance_type
#   subnet_id                   = aws_subnet.main.id
  associate_public_ip_address = each.value.associate_public_ip_address


  tags = {
    Name = each.key
    Environment = each.value.environment
  }
}


# resource "aws_eip" "vpc" {
#   for_each = var.ec2_config

#   instance = aws_instance.instance[].id
#   domain   = "vpc"
# }

