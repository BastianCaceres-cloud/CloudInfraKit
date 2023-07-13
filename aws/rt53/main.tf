locals {
  zone_enabled = var.create_zone ? 1 : 0
}

resource "aws_route53_zone" "this" {
  count = local.zone_enabled

  name = var.zone_name

  tags = var.tags
}

resource "aws_route53_record" "this" {
  for_each = var.records

  zone_id = aws_route53_zone.this[0].id
  name    = each.value.name
  type    = each.value.type
  ttl     = each.value.ttl
  records = each.value.records
}
