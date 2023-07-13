output "api_gateway_ids" {
  description = "The IDs of the API Gateways"
  value       = { for api in aws_api_gateway_rest_api.api : api.name => api.id }
}

output "api_gateway_urls" {
  description = "The URLs of the API Gateways"
  value       = { for api in aws_api_gateway_rest_api.api : api.name => api.execution_arn }
}
