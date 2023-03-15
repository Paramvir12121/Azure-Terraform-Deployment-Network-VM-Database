resource "azurerm_postgresql_server" "DB-SERVER" {
  name                = "dbserver9079"
  location            = var.location
  resource_group_name = var.rg-name
  sku_name            = "GP_Gen5_2"
  storage_mb          = 5120
  version             = "10.0"
  tags                = var.std_tags

  administrator_login          = var.postgres_admin_username
  administrator_login_password = var.postgres_admin_password

  auto_grow_enabled            = true
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "DB" {
  name                = "db9079"
  resource_group_name = var.rg-name
  server_name         = azurerm_postgresql_server.DB-SERVER.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
