# variable "vpc_config" {
#   type = object({
#     cidr_block           = string
#     enable_dns_hostnames = bool
#     enable_dns_hostnames = bool

#     public_subnet = object({
#       cidr_block              = string
#       map_public_ip_on_launch = bool

#       tags = map(string)
#     })

#     private_subnet = object({
#       cidr_block              = string
#       map_public_ip_on_launch = bool

#       tags = map(string)
#     })



#     tags = map(string)
#   })
#
#   description = "The VPC configuration"
# }

# variable "ingress_security_group_rules" {
#   type = list(object({
#     cidr_ipv4   = string
#     from_port   = number
#     ip_protocol = string
#     to_port     = number
#   }))
# }

# variable "egress_security_group_rules" {
#   type = list(object({
#     cidr_ipv4   = string
#     from_port   = number
#     ip_protocol = string
#     to_port     = number
#   }))
# }