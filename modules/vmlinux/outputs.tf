output "linux-nic-name" {
  value = azurerm_network_interface.LINUX-NIC[*].name
}

output "linux-hostname" {
  value = azurerm_virtual_machine.LINUX-VM[*].name
}
output "linux-vm-id0" {
  value=azurerm_virtual_machine.LINUX-VM[0].id
}
output "linux-vm-id1" {
  value=azurerm_virtual_machine.LINUX-VM[1].id
}

#Output variable: Public IP address
# output "linux-public_ip_address" {
#   value = data.azurerm_public_ip.linux_public_ip_data[*].ip_address
# }
output "linux-public_ip_address" {
  value = [azurerm_public_ip.LINUX-PIP[*].ip_address]
}

output "linux-fqdn" {
  value = azurerm_public_ip.LINUX-PIP[*].fqdn
}

output "linux-private-ip-address" {
  value = azurerm_network_interface.LINUX-NIC[*].private_ip_address
}