locals {
  std_tags = { Project = "Automation Project – Assignment 1"
    Name           = "Paramvir Singh"
    ExpirationDate = "2023-06-30"
  Environment = "Lab" }
  location = "eastus"
}

module "resource_group" {
  source   = "./modules/rgroup"
  location = local.location
}

module "network" {
  source      = "./modules/network"
  rg-name     = module.resource_group.rg-name
  rg-location = local.location
}

# module "linux" {
#   source        = "./modules/linux"
#   location      = local.location
#   linux-rg-name = module.resource_group.linux-rg-name
#   subnet-id     = module.network.subnet1-id
#   # network_interface_ids =   module.linux.linux-nic-name
#   # sshkey = "${var.sshkey}"
# }


# module "windows" {
#   source          = "./modules/windows"
#   windows-rg-name = module.resource_group.windows-rg-name
#   location        = local.location
#   windows-subnet  = module.network.subnet2-id

# }