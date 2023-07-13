output "lambda_function_arn" {
  description = "The ARN of the lambda function"
  value       = aws_lambda_function.example.arn
}

output "docker_image_uri" {
  description = "The URI of the Docker image in ECR"
  value       = var.docker_image_uri
}
