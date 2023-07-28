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

Tienes razón, mi disculpa por la confusión. En el contexto de un módulo de Terraform, efectivamente querrías que el módulo maneje la creación de la aplicación cliente de Cognito y produzca el client_id como una salida. De esta manera, el módulo es autocontenido y más fácil de usar.

Para hacer esto, puedes agregar un recurso aws_cognito_user_pool_client a tu módulo. Este recurso crea una aplicación cliente en un pool de usuarios de Cognito. Aquí tienes un ejemplo de cómo podría verse esto:

hcl
Copy code
resource "aws_cognito_user_pool_client" "client" {
  name = "mi-aplicacion-cliente"

  user_pool_id = aws_cognito_user_pool.mypool.id

  # Deshabilitar el secreto del cliente si la aplicación se va a usar con un front-end JavaScript
  generate_secret = false

  # Permite a los usuarios de la aplicación iniciar sesión con Cognito
  allowed_oauth_flows_user_pool_client = true

  # Aquí puedes especificar otros ajustes de la aplicación cliente según tus necesidades
}