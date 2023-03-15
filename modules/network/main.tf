#virtual Network
resource "azurerm_virtual_network" "VNET" {
  name                = var.vnet-name
  location            = var.rg-location
  resource_group_name = var.rg-name
  address_space       = var.vnet-address-space
  tags                = var.std_tags
}

#subnet 1
resource "azurerm_subnet" "SUBNET1" {
  name                 = var.subnet1-name
  resource_group_name  = var.rg-name
  virtual_network_name = azurerm_virtual_network.VNET.name
  address_prefixes     = var.subnet1-address-prefix
}