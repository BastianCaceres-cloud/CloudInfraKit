output "domain_identity_arn" {
  description = "The ARN of the domain identity"
  value       = aws_ses_domain_identity.example.arn
}

output "dkim_tokens" {
  description = "The DKIM tokens"
  value       = aws_ses_domain_dkim.example.dkim_tokens
}
