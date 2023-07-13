Módulo de Almacenamiento S3 en Terraform
Este módulo crea un bucket S3 en AWS que se puede utilizar como un gateway de almacenamiento. Adicionalmente, este módulo ofrece configuraciones opcionales para la encriptación del lado del servidor, versionamiento, y reglas de ciclo de vida.

Características
Encriptación del lado del servidor (SSE): Puedes habilitar la encriptación del lado del servidor con AES256.

Versionamiento: Habilita o deshabilita el versionamiento en el bucket.

Reglas de Ciclo de Vida: Este módulo permite configurar reglas de ciclo de vida para tus objetos S3. Con estas reglas, puedes definir acciones automatizadas a tomar durante el ciclo de vida de tus objetos, como la transición a clases de almacenamiento más económicas después de un cierto período de tiempo o la expiración y eliminación de objetos después de un período de tiempo definido.




USO
module "s3_storage_gateway" {
  source                    = "git::https://github.com/x/CloudInfrakit.git//aws/s3/storage_gw?ref=main"
  bucket_name               = "my-s3-bucket"
  force_destroy             = false
  server_side_encryption    = true
  versioning                = true
  enable_lifecycle_rules    = true
}


Variables de Entrada
Nombre	Descripción	Tipo	Valor por Defecto	Requerido
bucket_name	Nombre del bucket S3.	string	n/a	sí
force_destroy	Un valor booleano que indica si se debe forzar la eliminación del bucket y todos sus objetos si se destruye el recurso Terraform.	bool	false	no
server_side_encryption	Un valor booleano que indica si se debe habilitar la encriptación del lado del servidor.	bool	false	no
versioning	Un valor booleano que indica si se debe habilitar el versionamiento.	bool	false	no
enable_lifecycle_rules	Un valor booleano que indica si se deben habilitar las reglas de ciclo de vida.	bool	false	no
Variables de Salida
Nombre	Descripción
bucket_id	El nombre del bucket.
bucket_arn	El ARN del bucket.




Reglas de Ciclo de Vida
Las reglas de ciclo de vida permiten la transición de objetos a clases de almacenamiento más económicas después de un cierto período de tiempo o la expiración y eliminación de objetos después de un período de tiempo definido. Las reglas de ciclo de vida son especialmente útiles para reducir costos, optimizar el rendimiento, organizar datos y ayudar en el cumplimiento de normativas legales o de la empresa.

Las reglas de ciclo de vida definidas en este módulo son las siguientes:

Después de 30 días, los objetos se mueven a la clase de almacenamiento STANDARD_IA (para acceso infrecuente).
Después de 60 días, los objetos se mueven a la clase de almacenamiento GLACIER.
Después de 90 días, las versiones