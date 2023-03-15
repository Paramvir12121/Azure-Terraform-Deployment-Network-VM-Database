#Resource Group
output "Resource-Group-Name" {
  value = module.resource_group.rg-name
}

#Common
output "LAW_name" {
  value = module.common.Law_Name
}
output "RSV_name" {
  value = module.common.Rsv_Name
}
output "SA_name" {
  value = module.common.Sa_Name
}



#Networking
output "Vnet-name" {
  value = module.network.vnet-name
}
output "Subnet1-name" {
  value = module.network.subnet1-name
}
# output "Subnet1-id" {
#   value = module.network.subnet1-id
# }

# output "Subnet1-address-space" {
#   value = module.network.subnet1-address-space
# }

#VM Linux 
output "Linux-hostname" {
  value = module.vmlinux.linux-hostname
}
output "linux-public_ip_address" {
  value = module.vmlinux.linux-public_ip_address
}

output "linux-fqdn" {
  value = module.vmlinux.linux-fqdn
}

output "linux-private-ip-address" {
  value = module.vmlinux.linux-private-ip-address
}

#VM Windows
output "Windows-hostname" {
  value = module.vmwindows.windows-hostname
}
output "Windows-public_ip_address" {
  value = module.vmwindows.windows-public_ip_address
}

output "Windows-fqdn" {
  value = module.vmwindows.windows-fqdn
}

output "Windows-private-ip-address" {
  value = module.vmwindows.windows-private-ip-address
}

#loadbalancer
output "Lb-Name" {
  value = module.loadbalancer.lb-name
}

#database
output "DB-server-name" {
  value = module.database.db-server-name
}

output "Db-name" {
  value = module.database.db-name
}