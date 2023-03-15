locals {
  std_tags = { Project = "Automation Project – Assignment 1"
    Name           = "Paramvir Singh"
    ExpirationDate = "2023-06-30"
  Environment = "Lab" }
  location = "eastus"
  prefix   = "9079"
}

# common
variable "law" {
  type    = string
  default = "9079-law"
}

variable "rsv" {
  type    = string
  default = "RSV-9079"
}
variable "sku" {
  type    = string
  default = "Standard"
}

variable "sa" {
  type    = string
  default = "sa9079"
}

# variable ""{
#     type = string
#     default = ""
# }