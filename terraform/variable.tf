# # variable "<LABEL>" {
# #   type        = <TYPE>
# #   default     = <DEFAULT_VALUE>
# #   description = "<DESCRIPTION>"
# #   sensitive   = <true|false>
# #   nullable    = <true|false>
# #   ephemeral   = <true|false>

# #   validation {
# #     condition     = <EXPRESSION>
# #     error_message = "<ERROR_MESSAGE>"
# #   }
# # }

# variable "name" {
#     type = t
#     default = "slim_tech"
#     description = "The project name"
#     sensitive = true

# }

# variable "number" {
#     type = number
#     default = 300 # or 5.40
#     description = "The number of the project"

# }

# variable "boolean_variable" {
#     type = bool
#     default = true # or false
#     description = "The boolean of the project"

# }

# variable "list_variable" {
#     type = list(number)
#     default = [7, 5, 5, 9, 0, 98]
# }

# variable "list_of_string_variable" {
#     type = list(string)
#     default = ["olalekan", "faith", "one"]
# }

# variable "map_of variable" {
#     type = map(string)
#     default = {
#         name = "tring"
#         title = "title2"
#     }
# }

