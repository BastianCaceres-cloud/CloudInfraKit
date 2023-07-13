output "queue_url" {
  description = "The URL of the SQS Queue"
  value       = aws_sqs_queue.terraform_queue.id
}

output "queue_arn" {
  description = "The ARN of the SQS Queue"
  value       = aws_sqs_queue.terraform_queue.arn
}
