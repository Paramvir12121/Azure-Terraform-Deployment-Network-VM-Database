resource "azurerm_log_analytics_workspace" "LAW" {
  name                = var.law_name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.std_tags
}

resource "azurerm_recovery_services_vault" "RSV" {
  name                = var.rsv_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.sku_type
  tags                = var.std_tags
}

resource "azurerm_storage_account" "SA" {
  name                     = var.sa_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.std_tags
}


