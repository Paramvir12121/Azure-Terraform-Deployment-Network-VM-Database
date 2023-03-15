terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate9079RG"
    storage_account_name = "tfstaten9079sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}
