output "Law_Name" {
  value = azurerm_log_analytics_workspace.LAW.name
}

output "Rsv_Name" {
  value = azurerm_recovery_services_vault.RSV.name
}

output "Sa_Name" {
  value = azurerm_storage_account.SA.name
}

output "Sa_endpoint" {
  value = azurerm_storage_account.SA.primary_blob_endpoint
}
