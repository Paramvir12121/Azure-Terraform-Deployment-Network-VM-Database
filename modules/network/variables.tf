variable "rg-location" {
  type = string
}

variable "rg-name" {
  type = string
}

variable "vnet-name" {
  type    = string
  default = "network-vnet"
}

variable "vnet-address-space" {
  default = ["10.0.0.0/16"]
}

variable "subnet1-name" {
  type    = string
  default = "network-subnet1"
}

variable "subnet1-address-prefix" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}