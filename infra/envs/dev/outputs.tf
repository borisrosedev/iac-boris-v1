output "sg_id" {
  value = module.sg_1.sg_id
}


output "subnet_id" {
  value = module.subnet_1.sb_id
}


output "subnet_cidr" {
  value = module.subnet_1.sb_cidr
}


output "vm_public_ip" {
  value = module.compute_1.vm_public_ip
}

output "route_table_association_id" {
  value = module.route_table_association_1.route_table_association_id
}
