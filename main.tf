

module "resource_group" {
  source   = "./modules/rgroup"
  location = local.location
  std_tags = local.std_tags
}

module "common" {
  source   = "./modules/common"
  law_name = var.law
  rsv_name = var.rsv
  sku_type = var.sku
  sa_name  = var.sa
  rg_name  = module.resource_group.rg-name
  location = local.location
  std_tags = local.std_tags
}

module "network" {
  source      = "./modules/network"
  rg-name     = module.resource_group.rg-name
  rg-location = local.location
  std_tags    = local.std_tags
}

module "vmlinux" {
  source        = "./modules/vmlinux"
  location      = local.location
  linux-rg-name = module.resource_group.rg-name
  subnet-id     = module.network.subnet1-id
  std_tags      = local.std_tags
  # network_interface_ids =   module.linux.linux-nic-name
  # sshkey = "${var.sshkey}"
}


module "vmwindows" {
  source          = "./modules/vmwindows"
  windows-rg-name = module.resource_group.rg-name
  location        = local.location
  subnet-id  = module.network.subnet1-id
  std_tags      = local.std_tags
}

module "datadisk" {
    source = "./modules/datadisk"
    rg-name = module.resource_group.rg-name
    location        = local.location
    linux-vm-id0  =  module.vmlinux.linux-vm-id0
    linux-vm-id1  =  module.vmlinux.linux-vm-id1
    windows-vm-id = module.vmwindows.windows-vm-id
    std_tags      = local.std_tags

}