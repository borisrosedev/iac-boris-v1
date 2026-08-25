output "vm_public_ip" {
  value       = module.network_interface.public_ip_address
  description = "IP publique de la VM : à utiliser pour la connexion SSH et l'inventaire Ansible."
}

output "vm_id" {
  value = module.vm_1.vm_id
}

output "vm_size" {
  value = module.vm_1.vm_size
}
