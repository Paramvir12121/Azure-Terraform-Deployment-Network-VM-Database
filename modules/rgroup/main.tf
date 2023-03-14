# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "RG" {
  name     = "N01479079-assignment1-RG"
  location = var.location
  tags     = var.std_tags
}

