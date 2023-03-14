output "id" {
  value = azurerm_virtual_network.VNET.id
}
output "vnet-name" {
  value = azurerm_virtual_network.VNET.name
}

output "subnet1-id" {
  value = azurerm_subnet.SUBNET1.id
}
output "subnet1-name" {
  value = azurerm_subnet.SUBNET1.name
}
output "subnet1-address-space" {
  value = azurerm_subnet.SUBNET1.address_prefixes
}