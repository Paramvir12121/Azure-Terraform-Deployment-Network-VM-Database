#Resource Group
output "Resource-Group-Name" {
  value = module.resource_group.rg-name
}

#Networking
output "Vnet-name" {
  value = module.network.vnet-name
}
# output "Subnet1-id" {
#   value = module.network.subnet1-id
# }
output "Subnet1-name" {
  value = module.network.subnet1-name
}
# output "Subnet1-address-space" {
#   value = module.network.subnet1-address-space
# }