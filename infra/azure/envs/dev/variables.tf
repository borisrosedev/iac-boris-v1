variable "environment" {
  type = string
}

variable "username" {
  type = string
}

variable "rg_name" {
  type    = string
  default = "DefaultResourceGroup-USW3"
}

variable "admin_username" {
  type = string
}

variable "computer_name" {
  type = string
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Taille de VM. Standard_B1s (série B, burstable) est la config la moins chère adaptée à une démo."
}

variable "address_spaces" {
  type = set(string)
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Plage(s) d'adresses du sous-réseau, doit être incluse dans address_spaces."
}

variable "admin_source_ip" {
  type        = string
  description = "CIDR autorisé à se connecter en SSH (port 22) sur la VM, ex: \"88.12.34.56/32\". Utiliser \"*\" ouvre le SSH à tout Internet : à éviter hors démo encadrée."
}
