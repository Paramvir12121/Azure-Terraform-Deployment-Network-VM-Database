resource "null_resource" "linux_provisioner" {
  count = var.nb_count

  depends_on = [
    azurerm_virtual_machine.LINUX-VM
  ]

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]
  }

  connection {
    type        = "ssh"
    user        = var.name-password-attributes.vm-admin-username
    password    = var.name-password-attributes.vm-admin-password
    host        = element(azurerm_public_ip.LINUX-PIP[*].ip_address, count.index + 1)
    private_key = file(var.admin_ssh_key.vm-ssh-private-key)
    timeout     = "20s"
  }

}
