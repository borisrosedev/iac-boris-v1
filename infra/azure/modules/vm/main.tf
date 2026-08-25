locals {
  prefix = "${var.username}-${var.environment}"
}

data "azurerm_resource_group" "default" {
  name = var.rg_name
}


resource "azurerm_linux_virtual_machine" "this" {
  name                  = "${local.prefix}-vm"
  location              = data.azurerm_resource_group.default.location
  resource_group_name   = data.azurerm_resource_group.default.name
  network_interface_ids = var.azurerm_network_interface_ids
  size                  = var.vm_size
  computer_name         = var.computer_name
  admin_username        = var.admin_username

  # Authentification par clé SSH uniquement : pas de mot de passe stocké
  # en clair dans le code / les tfvars.
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.azurerm_ssh_public_key_pk
  }

  os_disk {
    name                 = "${local.prefix}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = merge(var.default_tags, { Name = "${local.prefix}-vm" })
}
