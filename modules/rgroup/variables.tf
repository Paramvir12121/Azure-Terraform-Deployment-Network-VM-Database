variable "location" {
  type = string
}

variable "std_tags" {
  type = map(string)
  default = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01479079@humbermail.ca"
    Environment  = "Lab"
  }
}