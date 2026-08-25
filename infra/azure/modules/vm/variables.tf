variable "default_tags" {
  type = map(string)
}

variable "environment" {
  type = string
}

variable "username" {
  type = string
}



variable "azurerm_network_interface_ids" {
  type = list(string)
}

variable "admin_username" {
  type = string
}

variable "computer_name" {
  type = string
}



variable "rg_name" {
  type    = string
  default = "DefaultResourceGroup-USW3"
}


variable "azurerm_ssh_public_key_pk" {
  type = string
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Taille de VM. Standard_B1s (série B, burstable) est la config la moins chère adaptée à une démo."
}
