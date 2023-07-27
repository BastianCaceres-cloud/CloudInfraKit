module "opensearch" {
  source = "../"

  region        = "us-west-2"
  domain_name   = "my-opensearch-domain"
  engine_version = "OpenSearch_1.0"
  instance_type = "m5.large.search"
  instance_count = 1
  ebs_enabled   = true
  volume_size   = 10
}
Variables de entrada
region: La región de AWS donde se desplegará el dominio. Por defecto es "us-west-2".
domain_name: El nombre del dominio de OpenSearch. No tiene valor predeterminado.
engine_version: La versión del motor de OpenSearch. Por defecto es "OpenSearch_1.0".
instance_type: El tipo de instancia de OpenSearch. Por defecto es "m5.large.search".
instance_count: El número de instancias de OpenSearch. Por defecto es 1.
ebs_enabled: Si se debe habilitar EBS para OpenSearch. Por defecto es true.
volume_size: El tamaño del volumen de EBS en GB. Por defecto es 10.


Salidas
opensearch_domain_arn: ARN del dominio de OpenSearch.
opensearch_domain_endpoint: Endpoint del dominio de OpenSearch.