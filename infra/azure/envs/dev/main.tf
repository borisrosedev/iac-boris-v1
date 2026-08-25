locals {

  default_tags = {
    Environment = var.environment
    Owner       = var.username
  }
}

module "virtual_network_1" {
  source                  = "../../modules/virtual_network"
  address_spaces          = var.address_spaces
  subnet_address_prefixes = var.subnet_address_prefixes
  environment             = var.environment
  username                = var.username
  rg_name                 = var.rg_name
}

module "network_security_group" {
  source          = "../../modules/network_security_group"
  environment     = var.environment
  username        = var.username
  rg_name         = var.rg_name
  admin_source_ip = var.admin_source_ip
}

module "network_interface" {
  source      = "../../modules/network_interface"
  environment = var.environment
  username    = var.username
  rg_name     = var.rg_name
  subnet_id   = module.virtual_network_1.subnet_id
  nsg_id      = module.network_security_group.id
}

module "public_key" {
  source      = "../../modules/public_key"
  public_key  = file(pathexpand("~/.ssh/terraform-ipssi.pub"))
  pk_name     = "${var.username}-${var.environment}-pk"
  rg_name     = var.rg_name
  username    = var.username
  environment = var.environment
}

module "vm_1" {
  source                        = "../../modules/vm"
  admin_username                = var.admin_username
  environment                   = var.environment
  username                      = var.username
  azurerm_ssh_public_key_pk     = module.public_key.vm_pk
  rg_name                       = var.rg_name
  default_tags                  = local.default_tags
  azurerm_network_interface_ids = [module.network_interface.nic_id]
  computer_name                 = var.computer_name
  vm_size                       = var.vm_size
}
