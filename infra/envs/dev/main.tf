data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}



module "subnet_1" {
  source      = "../../modules/subnet"
  username    = var.username
  environment = var.environment
  cidr        = var.cidr
  vpc_id      = var.vpc_id
}

module "route_table_association_1" {
  source         = "../../modules/route_table_association"
  subnet_id      = module.subnet_1.sb_id
  route_table_id = var.route_table_id

}


module "sg_1" {
  source      = "../../modules/security_group"
  username    = var.username
  environment = var.environment
  vpc_id      = var.vpc_id
  admin_ip    = var.admin_ip
}

module "compute_1" {
  source        = "../../modules/compute"
  username      = var.username
  environment   = var.environment
  instance_ami  = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  sg_ids        = [module.sg_1.sg_id]
  subnet_id     = module.subnet_1.sb_id
  public_key    = file(pathexpand("~/.ssh/terraform-ipssi.pub"))
  has_public_ip = var.has_public_ip
}
