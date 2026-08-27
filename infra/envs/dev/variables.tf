variable "username" {
  type = string
}
variable "environment" {
  type = string
}

# ===================== END OF SHARED ===============


variable "instance_type" {
  type        = string
  description = "Default instance type"
}




variable "cidr" {
  type = string
  validation {
    condition     = can(cidrhost(var.cidr, 0))
    error_message = "Must be 4bytes/cidr"
  }
}

variable "admin_ip" {
  type      = string
  sensitive = true
}

variable "vpc_id" {
  type = string
}

variable "route_table_id" {
  type = string
}


variable "has_public_ip" {
  type    = bool
  default = false # fail-safe default
}
