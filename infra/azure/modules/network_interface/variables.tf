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

variable "subnet_id" {
  type = string
}

variable "nsg_id" {
  type = string
}
