output "alb_arn" {
  description = "ARN del Application Load Balancer."
  value       = aws_lb.this.arn
}

output "alb_dns_name" {
  description = "Nombre de dominio del Application Load Balancer."
  value       = aws_lb.this.dns_name
}

output "alb_zone_id" {
  description = "ID de la zona del Application Load Balancer."
  value       = aws_lb.this.zone_id
}

output "http_listener_arn" {
  description = "ARN del Listener HTTP."
  value       = aws_lb_listener.http.arn
}

output "default_target_group_arn" {
  description = "ARN del Target Group por defecto."
  value       = aws_lb_target_group.default.arn
}

