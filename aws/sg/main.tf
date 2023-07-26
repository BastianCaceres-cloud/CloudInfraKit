locals {
  sg_names = keys(var.security_groups)
}

resource "aws_security_group" "this" {
  for_each = var.security_groups

  name_prefix = "frontend-${each.value.name}"
  vpc_id      = each.value.vpc_id
  description = each.value.description

  dynamic "ingress" {
    for_each = each.value.ingress
    content {
      description     = ingress.value.description
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = ingress.value.cidr_blocks
      security_groups = ingress.value.security_groups
    }
  }

  dynamic "egress" {
    for_each = each.value.egress
    content {
      description     = egress.value.description
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      cidr_blocks     = egress.value.cidr_blocks
      security_groups = egress.value.security_groups
    }
  }

  tags = merge(each.value.tags, {
    Name = each.value.name
  })
}