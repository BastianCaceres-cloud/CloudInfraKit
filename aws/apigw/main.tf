resource "aws_api_gateway_rest_api" "api" {
  for_each = var.apis

  name        = each.key
  description = "API Gateway for ${each.key}"
}

resource "aws_api_gateway_resource" "resource" {
  for_each = { for api, paths in var.apis : api => paths }

  rest_api_id = aws_api_gateway_rest_api.api[each.key].id
  parent_id   = aws_api_gateway_rest_api.api[each.key].root_resource_id
  path_part   = each.key
}

resource "aws_api_gateway_method" "method" {
  for_each = { for api, paths in var.apis : api => paths }

  rest_api_id   = aws_api_gateway_rest_api.api[each.key].id
  resource_id   = aws_api_gateway_resource.resource[each.key].id
  http_method   = each.value.method
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  for_each = { for api, paths in var.apis : api => paths }

  rest_api_id = aws_api_gateway_rest_api.api[each.key].id
  resource_id = aws_api_gateway_resource.resource[each.key].id
  http_method = aws_api_gateway_method.method[each.key].http_method

  type                    = "HTTP"
  uri                     = "http://${var.load_balancer_arn}/${each.key}"
  integration_http_method = each.value.method
}
