resource "azurerm_public_ip" "LB-PIP" {
  name                = "9079-lb-public-ip"
  location            = var.location
  resource_group_name = var.rg-name
  allocation_method   = "Static"
  tags                = var.std_tags
}

resource "azurerm_lb" "LB" {
  name                = "9079-lb"
  location            = var.location
  resource_group_name = var.rg-name
  tags                = var.std_tags

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.LB-PIP.id
  }

  #   backend_address_pool {
  #     name = "backend_pool"
  #   }

  #   probe {
  #     name             = "tcp"
  #     protocol         = "Tcp"
  #     port             = 22
  #     interval         = 15
  #     number_of_probes = 2
  #   }

  #   rule {
  #     name                    = "HTTP"
  #     protocol                = "Tcp"
  #     frontend_port           = 80
  #     backend_port            = 80
  #     backend_address_pool_id = var.VM-aset-id
  #     probe_id                = azurerm_lb.lb.probe[0].id
  #   }
}

