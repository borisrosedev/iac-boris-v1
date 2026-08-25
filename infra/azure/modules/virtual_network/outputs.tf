output "virtual_nw_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_id" {
  value = azurerm_subnet.this.id
}

output "location" {
  value = data.azurerm_resource_group.default.location
}
