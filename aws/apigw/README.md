# Módulo AWS API Gateway

Este módulo crea múltiples API Gateways en AWS, cada uno con su propio conjunto de rutas y métodos HTTP, y con un balanceador de carga y autenticación Cognito.

## Uso

```hcl
module "api_gateway" {
  source = "./modules/api_gateway"

  apis = {
    "api1" = {
      "ruta1" = {"method" = "GET"},
      "ruta2" = {"method" = "POST"},
      "ruta3" = {"method" = "PUT"},
      "ruta4" = {"method" = "DELETE"}
    },
    "api2" = {
      "ruta1" = {"method" = "GET"},
      "ruta2" = {"method" = "POST"},
      "ruta3" = {"method" = "PUT"},
      "ruta4" = {"method" = "DELETE"}
    },
    "api3" = {
      "ruta1" = {"method" = "GET"},
      "ruta2" = {"method" = "POST"},
      "ruta3" = {"method" = "PUT"},
      "ruta4" = {"method" = "DELETE"}
    },
    "api4" = {
      "ruta1" = {"method" = "GET"},
      "ruta2" = {"method" = "POST"},
      "ruta3" = {"method" = "PUT"},
      "ruta4" = {"method" = "DELETE"}
    }
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/my-load-balancer/50dc6c495c0c9188"
  cognito_arn       = "arn:aws:cognito-idp:region:account-id:userpool/us-east-1_abcdefghi"
}



Variables de entrada
apis: Un mapa de APIs, cada una con su propio mapa de rutas y sus correspondientes métodos HTTP.
load_balancer_arn: El ARN del balanceador de carga.
cognito_arn: El ARN del pool de usuarios de Cognito.



Variables de salida
api_gateway_ids: Los IDs de los API Gateways.
api_gateway_urls: Las URLs de los API Gateways.



Con esta configuración, puedes agregar, eliminar o modificar APIs, rutas y sus correspondientes métodos HTTP simplemente cambiando el mapa de `apis` en la invocación del módulo.
