variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east1-1"
}

variable "lambda_function_name" {
  description = "The name of the lambda function"
  type        = string
}

variable "docker_image_uri" {
  description = "The URI of the Docker image in ECR"
  type        = string
}

variable "lambda_timeout" {
  description = "The amount of time your Lambda Function has to run in seconds"
  type        = number
  default     = 3
}

variable "lambda_memory_size" {
  description = "The amount of memory to allocate to your Lambda Function"
  type        = number
  default     = 128
}

variable "lambda_entry_point" {
  description = "The entry point for the Lambda function. This must be provided in the form of a list."
  type        = list(string)
  default     = null
}
