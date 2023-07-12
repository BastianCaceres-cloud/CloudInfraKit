output "bucket_id" {
  description = "El ID del bucket"
  value       = aws_s3_bucket.terraform_state.id
}

output "bucket_arn" {
  description = "El ARN del bucket"
  value       = aws_s3_bucket.terraform_state.arn
}
