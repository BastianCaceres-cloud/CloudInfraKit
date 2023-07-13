output "zone_id" {
  description = "El ID de la zona de Route 53 creada"
  value       = aws_route53_zone.this[0].id
}

output "record_sets" {
  description = "Conjuntos de registros creados en la zona de Route 53"
  value       = aws_route53_record.this
}

output "fqdns" {
  description = "FQDNs de los registros de Route 53 creados"
  value       = [for rs in aws_route53_record.this : rs.fqdn]
}

output "names" {
  description = "Nombres de los registros de Route 53 creados"
  value       = [for rs in aws_route53_record.this : rs.name]
}

output "domain_name" {
  description = "El nombre de dominio para la zona de Route 53"
  value       = var.zone_name
}
