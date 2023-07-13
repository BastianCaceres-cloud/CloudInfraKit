# Módulo de Terraform para AWS Lambda con Docker

Este módulo crea una función AWS Lambda que utiliza una imagen de Docker desde Amazon ECR.

## Uso

module "lambda" {
  source = "git::https://github.com/cloudbuilderspa/CloudInfrakit.git//aws/lambda?ref=feature/aws_lambda"
  
  lambda_function_name = "my-function"
  docker_image_uri = "972382626734.dkr.ecr.us-east-1.amazonaws.com/ecr-test:latest"

  lambda_timeout    = 3
  lambda_memory_size = 128
  # lambda_entry_point = ["/lambda-entrypoint.sh"]
}
