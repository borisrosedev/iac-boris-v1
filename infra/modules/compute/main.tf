locals {
  prefix = "${var.username}-${var.environment}"
}

resource "aws_key_pair" "vm_kp" {
  public_key = var.public_key
  key_name   = "${local.prefix}-key"
}

# we need a virtual machine so we must determiner some options :
# some optional
# some mandatory
resource "aws_instance" "this" {
  # Ensure an IAM role is attached to EC2 instance
  # checkov:skip=CKV2_AWS_41 after it
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_ids
  key_name                    = aws_key_pair.vm_kp.key_name
  associate_public_ip_address = var.has_public_ip
  ebs_optimized               = true
  monitoring                  = true

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "${local.prefix}-vm"
  }
}
