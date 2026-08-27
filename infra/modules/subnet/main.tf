locals {
  prefix = "${var.username}-${var.environment}"
}

resource "aws_subnet" "this" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "${local.prefix}-subnet"
  }
  # availabity_zone
  # region
}
