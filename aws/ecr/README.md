module "ecr" {
  source  = "<ruta_del_modulo>"

  ecr_repository_name       = "nombre_del_repositorio"
  ecr_image_tag_mutability  = "MUTABLE"
  ecr_scan_on_push          = true
}



Variables de entrada
Nombre	Descripción	Tipo	Default	Requerido
ecr_repository_name	El nombre del repositorio de ECR	string	N/A	sí
ecr_image_tag_mutability	La mutabilidad de las etiquetas de la imagen	string	MUTABLE	no
ecr_scan_on_push	Habilitar o deshabilitar el escaneo de la imagen al hacer push	bool	true	no



Salidas
Nombre	Descripción
ecr_repository_url	El URL del repositorio de ECR
