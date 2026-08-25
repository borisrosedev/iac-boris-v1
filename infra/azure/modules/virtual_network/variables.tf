
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



variable "address_spaces" {
  type = set(string)
}

variable "subnet_address_prefixes" {
  type = list(string)
}
