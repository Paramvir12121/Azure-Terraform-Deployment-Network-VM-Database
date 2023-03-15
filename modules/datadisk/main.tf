# Module 6: datadisk

resource "azurerm_managed_disk" "datadisk" {
  count                = 3
  name                 = "9079-datadisk-${count.index}"
  location             = var.location
  resource_group_name  = var.rg-name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags                 = var.std_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_attach" {
  count              = 3
  managed_disk_id    = azurerm_managed_disk.datadisk[count.index].id
  virtual_machine_id = element(concat(var.linux-vm-id, [var.windows-vm-id]), count.index+1)
  lun                = count.index
  caching            = "ReadWrite"
}
