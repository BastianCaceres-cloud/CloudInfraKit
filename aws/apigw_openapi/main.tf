resource "aws_api_gateway_rest_api" "api" {
  name        = "MyAPI"
  description = "My API Gateway made with Terraform"
  body        = var.openapi_definition
}
