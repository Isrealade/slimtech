ec2_config = {
  "frontend" = {
    instance_type = "t3.micro"
    associate_public_ip_address = true
    environment = "dev"
  }

  "backend" = {
    instance_type = "t3.micro"
    associate_public_ip_address = false
    environment = "staging"
  }
}