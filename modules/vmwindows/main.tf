#network interface block
resource "azurerm_network_interface" "WINDOWS-NIC" {
  name                = "${var.prefix}-9079-nic"
  location            = var.location
  resource_group_name = var.windows-rg-name

  ip_configuration {
    name                          = "9079-${var.prefix}-ipconfiguration"
    subnet_id                     = var.subnet-id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.WINDOWS-PIP.id
  }
  tags = var.std_tags
}

#public ip 
resource "azurerm_public_ip" "WINDOWS-PIP" {
  name                = "${var.prefix}-9079-pip"
  resource_group_name = var.windows-rg-name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = var.std_tags
  domain_name_label   = "n01479079-wnndow-dnlabel"
}

#virtual machine
resource "azurerm_virtual_machine" "WINDOWS-VM" {
  name                  = "${var.prefix}-${var.vm-name}"
  location              = var.location
  resource_group_name   = var.windows-rg-name
  network_interface_ids = [azurerm_network_interface.WINDOWS-NIC.id]
  availability_set_id   = azurerm_availability_set.VM-ASET.id
  vm_size               = "Standard_B1s"
  tags                  = var.std_tags

  lifecycle {
    ignore_changes = [tags, ]
  }

  os_profile {
    computer_name  = var.name-password-attributes.vm-computer-name
    admin_username = var.name-password-attributes.vm-admin-username
    admin_password = var.name-password-attributes.vm-admin-password
  }

  os_profile_windows_config {
    provision_vm_agent = false
  }


  storage_image_reference {
    publisher = var.storage_image_attributes.vm-publisher
    offer     = var.storage_image_attributes.vm-offer
    sku       = var.storage_image_attributes.vm-sku
    version   = var.storage_image_attributes.vm-version
  }

  storage_os_disk {
    name    = "${var.prefix}-os-disk"
    caching = var.os_disk_attributes.vm-catching
    # storage_account_type = var.os_disk_attributes.vm-storage-account-type
    disk_size_gb  = var.os_disk_attributes.vm-disk-size
    create_option = "FromImage"
  }
  boot_diagnostics {
    enabled = true
    storage_uri = var.storage_uri
  }

}


resource "azurerm_availability_set" "VM-ASET" {
  name                         = "vm-availability-set"
  location                     = var.location
  resource_group_name          = var.windows-rg-name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_virtual_machine_extension" "WINDOWS-EXTEND-ANTIVIRUS" {
  name                       = "9079-extend-antivirus"
  virtual_machine_id         = azurerm_virtual_machine.WINDOWS-VM.id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = "true"
  tags                       = var.std_tags
  settings                   = <<SETTINGS
{
"AntimalwareEnabled": true,
"RealtimeProtectionEnabled": "true",
"ScheduledScanSettings": {
"isEnabled": "true",
"day": "1",
"time": "120",
"scanType": "Quick"
},
"Exclusions": {
"Extensions": "",
"Paths": "",
"Processes": ""
}
}
SETTINGS
}

