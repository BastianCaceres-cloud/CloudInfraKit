# Módulo de AWS S3 y CloudFront

Este módulo crea un bucket de S3 y una distribución de CloudFront con una identidad de acceso de origen (OAI).

## Uso

```hcl
module "s3_cloudfront" {
  source                            = "path/to/module"
  region                            = "us-west-2"
  bucket_name                       = "my-bucket-name"
  bucket_acl                        = "private"
  cloudfront_comment                = "OAI for s3 bucket"
  cloudfront_default_ttl            = 3600
  cloudfront_max_ttl                = 86400
  cloudfront_min_ttl                = 0
  cloudfront_viewer_protocol_policy = "allow-all"
  cloudfront_geo_restriction_type   = "none"
}


Entradas
Nombre	Descripción	Tipo	Defecto	Requerido
region	La región en la que se desplegarán los recursos	string	"us-west-2"	no
bucket_name	El nombre del bucket de S3	string	n/a	sí
bucket_acl	The access control list (ACL) of the S3 bucket	string	"private"	no
cloudfront_comment	A comment for the CloudFront origin access identity	string	"OAI for s3 bucket"	no
cloudfront_default_ttl	The default amount of time (in seconds) that an object is in a CloudFront cache	number	3600	no
cloudfront_max_ttl	The maximum amount of time (in seconds) that an object is in a CloudFront cache	number	86400	no
cloudfront_min_ttl	The minimum amount of time that you want objects to stay in CloudFront caches	number	0	no
cloudfront_viewer_protocol_policy	The method that you want CloudFront to use to determine whether to use HTTP or HTTPS	string	"allow-all"	no
cloudfront_geo_restriction_type	The method that you want CloudFront to use to restrict access to your content by country	string	"none"	no



Salidas
Nombre	Descripción
s3_bucket_name	El nombre del bucket de S3
cloudfront_distribution_id	El ID de la distribución de CloudFront
cloudfront_distribution_domain_name	El nombre de dominio de la distribución de CloudFront