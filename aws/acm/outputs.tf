
output "acm_certificate_arn" {
  description = "El ARN del certificado ACM"
  value       = aws_acm_certificate.cert.arn
}

output "validation_record_fqdns" {
  description = "El FQDN del registro de validación DNS del certificado ACM"
  value       = [for record in aws_route53_record.validation : record.fqdn]
}
