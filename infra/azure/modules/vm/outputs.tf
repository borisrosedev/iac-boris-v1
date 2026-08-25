output "vm_id" {
  value = azurerm_linux_virtual_machine.this.id
}

output "vm_size" {
  value = azurerm_linux_virtual_machine.this.size
}

output "vm_location" {
  value = azurerm_linux_virtual_machine.this.location
}
