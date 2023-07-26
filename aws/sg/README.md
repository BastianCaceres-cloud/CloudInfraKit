# AWS Security Groups Module

Este módulo de Terraform simplifica la creación y gestión de Security Groups en AWS. Permite definir fácilmente las reglas de ingreso y salida, así como asociar los Security Groups a diferentes recursos de AWS, como instancias EC2.

## Requisitos

- Terraform v0.12 o superior
- Proveedor AWS configurado y autenticado

## Uso básico

Para utilizar este módulo, sigue estos pasos:

1. Agrega el siguiente bloque de código en tu archivo de configuración de Terraform (`.tf`):

```hcl
module "security_groups" {
  source = "git::
  "
  vpc_id = "<VPC_ID>"
  security_groups = {
    "sg-frontend" = {
      name        = "sg-frontend"
      description = "Security Group for Frontend servers"
      vpc_id      = "<VPC_ID>"
      tags = {
        Name = "frontend-sg"
      }
      ingress = [
        # ... (reglas de ingreso)
      ]
      egress = [
        # ... (reglas de salida)
      ]
    }
  }
}


Reemplaza <VPC_ID> con el ID de la VPC en la que deseas crear los Security Groups.

Define las reglas de ingreso y salida para cada Security Group en el mapa security_groups. Por ejemplo:


ingress = [
  {
    description     = "Allow HTTP traffic from any source"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [] # Agregar esta propiedad
  },
  # ... (otras reglas de ingreso)
]
egress = [
  {
    description     = "Allow all outbound traffic"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [] # Agregar esta propiedad
  },
  # ... (otras reglas de salida)
]



3

Uso avanzado

Asociar un Security Group a una instancia EC2
Para asociar un Security Group creado con este módulo a una instancia EC2, utiliza el siguiente bloque de código:

resource "aws_instance" "example" {
  ami           = "<AMI_ID>"
  instance_type = "t2.micro"
  key_name      = "<KEY_NAME>"

  vpc_security_group_ids = [
    module.security_groups.security_groups["sg-frontend"].id
  ]

  tags = {
    Name = "example-instance"
  }
}

Reemplaza <AMI_ID> y <KEY_NAME> con los valores apropiados para tu configuración.

Referenciar un Security Group en otro Security Group
Para permitir el tráfico entre dos Security Groups, puedes referenciar uno dentro de las reglas de ingreso o salida del otro. Por ejemplo, para permitir tráfico desde sg-frontend hacia sg-backend, agrega lo siguiente en la configuración de sg-backend:

ingress = [
  {
    description     = "Allow traffic from sg-frontend"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = []
    security_groups = [module.security_groups.security_groups["sg-frontend"].id]
  },
  # ... (otras reglas de ingreso)
]


Asociar un Security Group a otros recursos de AWS
Para asociar un Security Group creado con este módulo a otros recursos de AWS, simplemente utiliza la referencia adecuada al atributo id del Security Group. Por ejemplo, para asociar un Security Group a un Load Balancer de aplicaciones:

resource "aws_lb" "example" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.security_groups.security_groups["sg-frontend"].id]
  subnets            = ["subnet-xxxxxx", "subnet-yyyyyy"]
}

Reemplaza los valores de subnets con los IDs de las subnets en las que deseas crear el Load Balancer.
