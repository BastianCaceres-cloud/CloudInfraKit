# Módulo AWS EFS para Terraform

Este módulo crea un sistema de archivos EFS, un punto de acceso EFS, y el grupo de seguridad y los targets de montaje necesarios para un cluster EKS Fargate.

## Uso

```hcl
module "efs" {
  source                     = "git::https://x"
  region                     = "us-east-1"
  vpc_id                     = "vpc-xxxxxxxxxxxx"
  subnet_ids                 = ["subnet-xxxxxxxxxxxx", "subnet-xxxxxxxxxxxx", "subnet-xxxxxxxxxxxx"]
  cidr_block                 = "0.0.0.0/0"
  creation_token             = "WordPress-on-Fargate"
  volume_name                = "WordpressVolume"
  posix_user_gid             = 1000
  posix_user_uid             = 1000
  root_directory_path        = "/bitnami"
  creation_info_owner_gid    = 1000
  creation_info_owner_uid    = 1000
  creation_info_permissions  = "777"
  security_group_name        = "WordPress-on-Fargate"
  security_group_description = "WordPress-on-Fargate"
}



¡Por supuesto! Aquí tienes el archivo README.md actualizado con las entradas y las salidas como una lista de puntos:

markdown
Copy code
# Módulo AWS EFS para Terraform

Este módulo crea un sistema de archivos EFS, un punto de acceso EFS, y el grupo de seguridad y los targets de montaje necesarios para un cluster EKS Fargate.

## Uso

```hcl
module "efs" {
  source                     = "git:x"
  region                     = "us-east-1"
  vpc_id                     = "vpc-xxxxxxxxxxxx"
  subnet_ids                 = ["subnet-xxxxxxxxxxxx", "subnet-xxxxxxxxxxxx", "subnet-xxxxxxxxxxxx"]
  cidr_block                 = "0.0.0.0/0"
  creation_token             = "WordPress-on-Fargate"
  volume_name                = "WordpressVolume"
  posix_user_gid             = 1000
  posix_user_uid             = 1000
  root_directory_path        = "/bitnami"
  creation_info_owner_gid    = 1000
  creation_info_owner_uid    = 1000
  creation_info_permissions  = "777"
  security_group_name        = "WordPress-on-Fargate"
  security_group_description = "WordPress-on-Fargate"
}


Entradas
region: La región de AWS. (Requerido)
vpc_id: El ID de la VPC donde se creará el EFS. (Requerido)
subnet_ids: Los ID de las subredes para los targets de montaje. (Requerido)
cidr_block: El bloque CIDR para las reglas del grupo de seguridad. (Requerido)
creation_token: Nombre único utilizado para asegurar la creación idempotente del sistema de archivos. (Requerido)
volume_name: El nombre del volumen. (Requerido)
posix_user_gid: El ID de grupo POSIX. (Opcional, default = 1000)
posix_user_uid: El ID de usuario POSIX. (Opcional, default = 1000)
root_directory_path: La ruta para el directorio raíz. (Opcional, default = "/efs")
creation_info_owner_gid: El ID de grupo POSIX utilizado para la información de creación. (Opcional, default = 1000)
creation_info_owner_uid: El ID de usuario POSIX utilizado para la información de creación. (Opcional, default = 1000)
creation_info_permissions: Los permisos POSIX utilizados para la información de creación. (Opcional, default = "777")
security_group_name: El nombre del grupo de seguridad. (Requerido)
security_group_description: La descripción del grupo de seguridad. (Requerido)



Salidas
efs_id: El ID del sistema de archivos EFS.
efs_ap_id: El ID del punto de acceso EFS.
security_group_id: El ID del grupo de seguridad.





