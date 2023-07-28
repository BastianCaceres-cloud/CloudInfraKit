output "user_pool_id" {
  description = "ID del pool de usuarios de Cognito"
  value       = aws_cognito_user_pool.main.id
}

output "user_group_id" {
  description = "ID del grupo de usuarios de Cognito"
  value       = aws_cognito_user_group.main.id
}

output "identity_pool_id" {
  description = "ID del pool de identidades de Cognito"
  value       = aws_cognito_identity_pool.main.id
}



