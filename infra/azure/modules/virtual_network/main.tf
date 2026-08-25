locals {
  prefix = "${var.username}-${var.environment}"
}

data "azurerm_resource_group" "default" {
  name = var.rg_name
}


# Create a virtual network within the resource group
resource "azurerm_virtual_network" "this" {
  name                = "${local.prefix}-vn"
  resource_group_name = data.azurerm_resource_group.default.name
  location            = data.azurerm_resource_group.default.location
  address_space       = var.address_spaces
}

# Sous-réseau où sera placée la carte réseau de la VM.
resource "azurerm_subnet" "this" {
  name                 = "${local.prefix}-subnet"
  resource_group_name  = data.azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.subnet_address_prefixes
}
