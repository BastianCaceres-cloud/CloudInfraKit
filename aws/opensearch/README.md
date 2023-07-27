# Módulo Terraform para la creación de un dominio de Elasticsearch en AWS

Este módulo crea un dominio de Elasticsearch en AWS con configuraciones personalizables para el tipo de instancia, el recuento de instancias, las opciones de EBS y las políticas de acceso.

## Uso

Aquí hay un ejemplo de cómo se puede usar este módulo en tu código Terraform:

```hcl
module "elasticsearch" {
  source = "../"

  region          = "us-west-2"
  domain_name     = "my-elasticsearch-domain"
  engine_version  = "7.4"
  instance_type   = "m5.large.elasticsearch"
  instance_count  = 1
  ebs_enabled     = true
  volume_size     = 10
}



Variables de entrada
region: La región de AWS donde se desplegará el dominio. Por defecto es "us-west-2".
domain_name: El nombre del dominio de Elasticsearch. No tiene valor predeterminado y debe ser proporcionado por el usuario.
engine_version: La versión del motor de Elasticsearch. Por defecto es "7.4".
instance_type: El tipo de instancia de Elasticsearch. Por defecto es "m5.large.elasticsearch".
instance_count: El número de instancias de Elasticsearch. Por defecto es 1.
ebs_enabled: Si se debe habilitar EBS para Elasticsearch. Por defecto es true.
volume_size: El tamaño del volumen de EBS en GB. Por defecto es 10.



Salidas
elasticsearch_domain_arn: ARN del dominio de Elasticsearch.
elasticsearch_domain_endpoint: Endpoint del dominio de Elasticsearch.