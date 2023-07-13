provider "aws" {
  region = var.region
}

resource "aws_lambda_function" "example" {
  function_name = var.lambda_function_name

  image_uri = var.docker_image_uri

  role            = aws_iam_role.example.arn
  package_type    = "Image"
  timeout         = var.lambda_timeout
  memory_size     = var.lambda_memory_size

  publish = true

  dynamic "image_config" {
    for_each = var.lambda_entry_point != null ? [1] : []
    content {
      entry_point = var.lambda_entry_point
    }
  }

  lifecycle {
    ignore_changes = [image_uri]
  }
}

resource "aws_iam_role" "example" {
  name = "${var.lambda_function_name}_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_execution" {
  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "ecr_full_access" {
  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}
