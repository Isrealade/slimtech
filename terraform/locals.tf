# locals {
#     app_prefix = "${var.project}-${var.environment}"

#     common_tags = {
#         Project = var.project
#         Environment = var.environment
#         ManagedBy = "Terraform"
#     }

#     is_production = var.environment == "prod"

# }

# resource "aws_instance" "main" {
#     tags = {
#         project = merge(var.tags, local.common_tags)
#     }
# }

