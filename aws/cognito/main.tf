provider "aws" {
  region = var.region
}

resource "aws_cognito_user_pool" "main" {
  name = var.user_pool_name
}

resource "aws_cognito_user_group" "main" {
  name         = var.user_group_name
  user_pool_id = aws_cognito_user_pool.main.id
  description  = var.user_group_description
}

resource "aws_cognito_identity_pool" "main" {
  identity_pool_name               = var.identity_pool_name
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id               = var.client_id
    provider_name           = aws_cognito_user_pool.main.endpoint
    server_side_token_check = false
  }
}

resource "aws_elasticsearch_domain" "main" {
  domain_name = var.domain_name

  cognito_options {
    enabled          = true
    user_pool_id     = aws_cognito_user_pool.main.id
    identity_pool_id = aws_cognito_identity_pool.main.id
    role_arn         = aws_iam_role.main.arn
  }
}

resource "aws_iam_role" "main" {
  name = var.iam_role_name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Federated": "cognito-identity.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "main" {
  name = var.iam_role_policy_name
  role = aws_iam_role.main.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "es:ESHttp*"
      ],
      "Effect": "Allow",
      "Resource": "${aws_elasticsearch_domain.main.arn}/*"
    }
  ]
}
POLICY
}
