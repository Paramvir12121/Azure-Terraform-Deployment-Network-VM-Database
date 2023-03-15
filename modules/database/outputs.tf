output "db-server-name" {
  value = azurerm_postgresql_server.DB-SERVER.name
}
output "db-name" {
  value = azurerm_postgresql_database.DB.name
}