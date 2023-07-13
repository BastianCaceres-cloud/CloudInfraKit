# Módulo de Terraform para AWS ACM

Este módulo crea un certificado ACM (Amazon Certificate Manager) en AWS y configura los registros DNS necesarios para la validación.

## Uso

```hcl
module "acm" {
  source = "<URL del repositorio Git>"

  domain_name = "mi-dominio.com"
  zone_id     = "ID-de-la-zona-Route-53"
  tags = {
    Terraform = "true"
    Environment = "Dev"
  }
}


Variables de entrada
domain_name: El nombre de dominio para el certificado ACM.
zone_id: El ID de la zona Route 53 donde se validará el certificado.
tags: Las etiquetas a aplicar al certificado ACM.
Salidas
acm_certificate_arn: El ARN del certificado ACM creado.
validation_record_name: El nombre del registro de validación DNS del certificado ACM.



Recuerda reemplazar `<URL del repositorio Git>` con la URL de tu repositorio Git. Asegúrate de guardar los cambios en los archivos y luego puedes utilizar este módulo en tu segundo pipeline para crear el certificado ACM y obtener los detalles de validación DNS.

Si tienes alguna otra pregunta o necesitas más ayuda, ¡no dudes en preguntar!
