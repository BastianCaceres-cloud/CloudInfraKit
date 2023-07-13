# AWS Elasticache (Redis) Terraform Module

Este módulo de Terraform crea un clúster de AWS ElastiCache (Redis).

## Uso

```hcl
module "elasticache" {
  source               = "<ruta al módulo>"
  cluster_id           = "mi-cluster"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  engine_version       = "5.0.6"
  subnet_group_name    = "mi-subnet-group"
  security_group_ids   = ["sg-123456789"]
}



Entradas
cluster_id: Nombre del clúster de ElastiCache (requerido, tipo string)
node_type: Tipo de instancia a utilizar para el clúster (requerido, tipo string)
num_cache_nodes: Número de nodos de caché en el clúster (requerido, tipo number)
engine_version: Versión del motor Redis a utilizar (requerido, tipo string)
subnet_group_name: Nombre del grupo de subredes a utilizar para el clúster (requerido, tipo string)
security_group_ids: Lista de IDs de grupos de seguridad a asociar con el clúster (requerido, tipo list(string))



Salidas
elasticache_cluster_id: El ID del clúster de ElastiCache
elasticache_cluster_endpoint: El punto final del clúster de ElastiCache
elasticache_cluster_port: El puerto del clúster de ElastiCache

