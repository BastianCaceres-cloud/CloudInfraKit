module "api_gateway" {
  source = "./modules/api_gateway"

  openapi_definition = file("${path.module}/api_spec.yaml")

  load_balancer_arn = "arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/my-load-balancer/50dc6c495c0c9188"
  cognito_arn       = "arn:aws:cognito-idp:region:account-id:userpool/us-east-1_abcdefghi"
}
