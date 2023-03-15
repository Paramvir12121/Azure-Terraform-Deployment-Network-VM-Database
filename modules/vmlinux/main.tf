#network interface block
resource "azurerm_network_interface" "LINUX-NIC" {
  count               = var.nb_count
  name                = "${var.prefix}-9079-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.linux-rg-name

  ip_configuration {
    name                          = "9079-${var.prefix}-ipconfiguration-${count.index + 1}"
    subnet_id                     = var.subnet-id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.LINUX-PIP[count.index].id
  }
  tags = var.std_tags
}

#public ip 
resource "azurerm_public_ip" "LINUX-PIP" {
  count               = var.nb_count
  name                = "${var.prefix}-9079-pip-${count.index + 1}"
  resource_group_name = var.linux-rg-name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = var.std_tags
  domain_name_label   = "n01479079-dnlabel-${count.index + 1}"
  depends_on = [
    azurerm_network_interface.LINUX-NIC
  ]
}

data "azurerm_public_ip" "linux_public_ip_data" {
  count               = var.nb_count
  name                = element(azurerm_public_ip.LINUX-PIP[*].name, count.index + 1)
  resource_group_name = var.linux-rg-name
}

#virtual machine
resource "azurerm_virtual_machine" "LINUX-VM" {
  count                 = var.nb_count
  name                  = "${var.vm-name}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.linux-rg-name
  network_interface_ids = [azurerm_network_interface.LINUX-NIC[count.index].id]
  availability_set_id   = azurerm_availability_set.VM-ASET.id
  vm_size               = var.vm-size
  tags                  = var.std_tags

  lifecycle {
    ignore_changes = [tags, ]
  }

  os_profile {
    computer_name  = "${var.name-password-attributes.vm-computer-name}-${count.index + 1}"
    admin_username = var.name-password-attributes.vm-admin-username
    admin_password = var.name-password-attributes.vm-admin-password
    custom_data    = <<EOF
#!/bin/bash
az extension add --name network-watcher
EOF
    # extension {
    #   name                 = "NetworkWatcherAgentLinux"
    #   publisher            = "Microsoft.Azure.NetworkWatcher"
    #   type                 = "NetworkWatcherAgentLinux"
    #   type_handler_version = "1.4"
    # }

  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file(var.admin_ssh_key.vm-ssh-public-key)
      path     = "/home/Paramvir-N01479079/.ssh/authorized_keys"
    }
  }

  storage_image_reference {
    publisher = var.storage_image_attributes.vm-publisher
    offer     = var.storage_image_attributes.vm-offer
    sku       = var.storage_image_attributes.vm-sku
    version   = var.storage_image_attributes.vm-version
  }

  storage_os_disk {
    name    = "${var.prefix}-os-disk-${count.index + 1}"
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
  resource_group_name          = var.linux-rg-name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_virtual_machine_extension" "LINUX-EXTEND-NETWORKWATCHER" {
  count                = var.nb_count
  name                 = "9079-vm-extend-${count.index + 1}"
  virtual_machine_id   = azurerm_virtual_machine.LINUX-VM[count.index].id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  tags                 = var.std_tags
  settings             = <<NETWORKWATCHER
 {
    "type": "extensions",
    "properties": {
        "publisher": "Microsoft.Azure.NetworkWatcher",
        "type": "NetworkWatcherAgentLinux",
        "typeHandlerVersion": "1.4",
        "autoUpgradeMinorVersion": true
    }
}
NETWORKWATCHER

}

