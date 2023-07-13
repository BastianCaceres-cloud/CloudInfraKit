# Módulo de Terraform para AWS Route 53

Este módulo crea una zona de Route 53 y registros DNS en AWS.

## Uso

```hcl
module "route53" {
  source = "<URL del repositorio Git>"

  create_zone = true
  zone_name   = "mi-dominio.com"
  records = {
    www = {
      name    = "www.mi-dominio.com"
      type    = "A"
      ttl     = 300
      records = ["192.0.2.1"]
    }
  }
  tags = {
    Terraform = "true"
    Environment = "Dev"
  }
}



Variables de entrada


create_zone: Un booleano que determina si se debe crear una nueva zona de Route 53.
zone_name: El nombre de la zona de Route 53.
records: Un mapa de los registros DNS a crear en la zona de Route 53.
tags: Un mapa de las etiquetas a aplicar a los recursos creados.



Salidas
zone_id: El ID de la zona de Route 53 creada.
record_sets: Los conjuntos de registros creados en la zona de Route 53.