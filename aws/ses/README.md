# Módulo de AWS Simple Email Service (SES)

Este módulo crea un dominio verificado de SES y una configuración de DKIM para ese dominio.

## Uso

```hcl
module "ses" {
  source = "<ruta al módulo>"
  domain = "mi-dominio.com"
}

output "domain_identity_arn" {
  value = module.ses.domain_identity_arn
}

output "dkim_tokens" {
  value = module.ses.dkim_tokens
}
