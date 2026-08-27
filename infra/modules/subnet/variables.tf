variable "username" {
  type = string
}
variable "environment" {
  type        = string
  description = "dev|staging|prod"
}


variable "cidr" {
  type = string # 192.168.0.0/16
  validation {
    condition     = can(cidrhost(var.cidr, 0))
    error_message = "Must be 4bytes/cidr"
  }
}

variable "vpc_id" {
  type = string
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = false
}
