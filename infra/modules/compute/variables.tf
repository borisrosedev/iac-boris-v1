variable "instance_ami" {
  type        = string
  description = "AMI of EC2 Instance"
  #default = ""
}

variable "instance_type" {
  type        = string
  description = "Default instance type"
}

variable "subnet_id" {
  type = string
}

variable "sg_ids" {
  type = list(string)

}

variable "public_key" {
  type = string
}


variable "has_public_ip" {
  type    = bool
  default = false # fail-safe default
}




variable "username" {
  type = string
}

variable "environment" {
  type = string
}
