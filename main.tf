

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
  storage_uri     = module.common.Sa_endpoint
  # network_interface_ids =   module.linux.linux-nic-name
  # sshkey = "${var.sshkey}"
}


module "vmwindows" {
  source          = "./modules/vmwindows"
  windows-rg-name = module.resource_group.rg-name
  location        = local.location
  subnet-id       = module.network.subnet1-id
  std_tags        = local.std_tags
  storage_uri     = module.common.Sa_endpoint
}

module "datadisk" {
  source        = "./modules/datadisk"
  rg-name       = module.resource_group.rg-name
  location      = local.location
  linux-vm-id  = module.vmlinux.linux-vm-id
#   linux-vm-id1  = module.vmlinux.linux-vm-id1
  windows-vm-id = module.vmwindows.windows-vm-id
  std_tags      = local.std_tags

}
module "loadbalancer" {
  source     = "./modules/loadbalancer"
  rg-name    = module.resource_group.rg-name
  location   = local.location
  VM-aset-id = module.vmlinux.VM-aset-id
  std_tags   = local.std_tags
}

module "database" {
  source                  = "./modules/database"
  rg-name                 = module.resource_group.rg-name
  location                = local.location
  std_tags                = local.std_tags
  postgres_admin_username = var.postgres_admin_username
  postgres_admin_password = var.postgres_admin_password
}