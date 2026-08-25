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

variable "admin_source_ip" {
  type        = string
  description = "CIDR autorisé en SSH (port 22), ex: \"88.12.34.56/32\". \"*\" = tout Internet."
  default     = "*"
}
