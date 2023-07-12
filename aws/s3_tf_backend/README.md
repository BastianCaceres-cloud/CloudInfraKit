Módulo S3 para Terraform
Este módulo crea un bucket S3 privado en AWS para almacenar el estado de Terraform. El bucket está configurado con control de versiones y la opción para habilitar la encriptación del lado del servidor.


module "s3" {
  source  = "<ruta_del_modulo>"

  bucket_name             = "nombre_del_bucket"
  versioning              = true
  force_destroy           = false
  server_side_encryption  = true
}

Variables de entrada
Nombre	Descripción	Tipo	Default	Requerido
bucket_name	El nombre del bucket S3 para almacenar el estado de Terraform	string	N/A	sí
versioning	Habilitar o deshabilitar el versionamiento en el bucket S3	bool	true	no
force_destroy	Un booleano que indica si todos los objetos (incluyendo todos los bloqueos de objetos) en el bucket deben ser destruidos antes de que el bucket en sí pueda ser destruido	bool	false	no
server_side_encryption	Habilitar o deshabilitar la encriptación del lado del servidor en el bucket S3	bool	false	no



Salidas
Nombre	Descripción
bucket_id	El ID del bucket
bucket_arn	El ARN del bucket