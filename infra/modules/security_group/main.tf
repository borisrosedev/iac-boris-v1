locals {
  prefix = "${var.username}-${var.environment}"
}

resource "aws_security_group" "this" {
  # Ensure that Security Groups are attached to another resource
  # checkov:skip=CKV2_AWS_5 after it
  vpc_id      = var.vpc_id
  name        = "${local.prefix}-sg"
  description = "Security Group to allow http and ssh for only for admin"
  tags = {
    Name = "${local.prefix}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.this.id
  description       = "Http ingress"
  # Ensure no security groups allow ingress from 0.0.0.0:0 to port 80
  # checkov:skip=CKV_AWS_260 after it
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 80
  to_port     = 80

  tags = {
    Name = "${local.prefix}-sg-in-rule-allow-http"
  }

}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.this.id
  description       = "SSH ingress"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = var.admin_ip

  tags = {
    Name = "${local.prefix}-sg-in-rule-allow-admin-ssh"
  }
}

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.this.id
  description       = "Allow all outbound traffic"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "${local.prefix}-sg-eg-rule-all-outbound"
  }
}
