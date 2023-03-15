variable "std_tags" {
  type = map(string)
}
#profix for the names used later 
variable "prefix" {
  default = "centos"
}

#network rg
variable "linux-rg-name" {
  type = string
}
variable "location" {
  type = string
}
variable "subnet-id" {
  type = string
}

#vm variables
variable "vm-name" {
  type    = string
  default = "9079-u-vm"
}
variable "vm-size" {
  type    = string
  default = "Standard_B1s"
}

variable "os_disk_attributes" {
  type = map(any)
  default = {
    vm-storage-account-type = "Premium_LRS"
    vm-disk-size            = 32
    vm-catching             = "ReadWrite"
  }
}

variable "storage_image_attributes" {
  type = map(any)
  default = {
    vm-publisher = "OpenLogic"
    vm-offer     = "CentOS"
    vm-sku       = "7.5"
    vm-version   = "latest"
  }
}

variable "name-password-attributes" {
  type = map(any)
  default = {
    vm-computer-name  = "hostname"
    vm-admin-username = "Paramvir-N01479079"
    vm-admin-password = "P@$$w0rd123123"
  }
}

variable "admin_ssh_key" {
  type = map(any)
  default = {
    vm-ssh-public-key  = "C:/Users/Paramvir/.ssh/id_rsa.pub"
    vm-ssh-private-key = "C:/Users/Paramvir/.ssh/id_rsa"
  }
}
variable "linux_avs" {
  type    = string
  default = "linux-avs"
}

variable "nb_count" {
  type    = string
  default = "2"
}
