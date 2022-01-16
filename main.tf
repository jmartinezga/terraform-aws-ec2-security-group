#https://registry.terraform.io/providers/hashicorp/aws/latest/docs
locals {
  sg_name        = "${var.environment}-${var.sg_name}"
  tf_version     = trimspace(chomp(file("./tf_version")))
  module_version = trimspace(chomp(file("./version")))
  last_update    = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  tags = merge(var.tags, {
    Name           = "${local.sg_name}",
    environment    = "${var.environment}",
    application    = "${var.application}",
    module_name    = "terraform-aws-ec2-security-group",
    module_version = "${local.module_version}",
    terraform      = "${local.tf_version}",
    last_update    = "${local.last_update}"
  })
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "this" {
  name        = local.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  tags = local.tags
}

resource "aws_security_group_rule" "ingress_cidr" {
  for_each = var.sg_ingress_rules_cidr

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  description       = each.value.description
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "ingress_source_sg" {
  for_each = var.sg_ingress_rules_source_sg

  type                     = "ingress"
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  source_security_group_id = each.value.source_security_group_id
  description              = each.value.description
  security_group_id        = aws_security_group.this.id
}

#tfsec:ignore:AWS007
resource "aws_security_group_rule" "egress" {
  count = var.internet_access != false ? 1 : 0

  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  description       = "Internet access"
  security_group_id = aws_security_group.this.id
}
