variable "std_tags" {
  type = map(string)
}
#profix for the names used later 
variable "prefix" {
  default = "windows"
}

#network rg
variable "windows-rg-name" {
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
  default = "9079-w-vm"
}
variable "vm-size" {
  type    = string
  default = "Standard_B1s"
}

variable "os_disk_attributes" {
  type = map(any)
  default = {
    vm-storage-account-type = "Premium_LRS"
    vm-disk-size            = 127
    vm-catching             = "ReadWrite"
  }
}

variable "storage_image_attributes" {
  type = map(any)
  default = {
    vm-publisher = "MicrosoftWindowsServer"
    vm-offer     = "WindowsServer"
    vm-sku       = "2016-Datacenter"
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
variable "windows_avs" {
  type    = string
  default = "windows-avs"
}

variable "storage_uri" {
}