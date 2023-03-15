output "windows-vm-id" {
  value = azurerm_virtual_machine.WINDOWS-VM.id
}

output "windows-nic-name" {
  value = azurerm_network_interface.WINDOWS-NIC.name
}

output "windows-hostname" {
  value = azurerm_virtual_machine.WINDOWS-VM.name
}

output "windows-public_ip_address" {
  value = azurerm_public_ip.WINDOWS-PIP.ip_address
}

output "windows-fqdn" {
  value = azurerm_public_ip.WINDOWS-PIP.fqdn
}

output "windows-private-ip-address" {
  value = azurerm_network_interface.WINDOWS-NIC.private_ip_address
}