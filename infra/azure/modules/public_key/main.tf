locals {
  prefix = "${var.username}-${var.environment}"
}

data "azurerm_resource_group" "default" {
  name = var.rg_name
}

resource "azurerm_ssh_public_key" "vm_pk" {
  name                = var.pk_name
  resource_group_name = var.rg_name
  location            = data.azurerm_resource_group.default.location
  public_key          = var.public_key
}
