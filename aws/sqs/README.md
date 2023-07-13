# Terraform AWS SQS Module

Este módulo de Terraform crea un recurso de AWS Simple Queue Service (SQS).

## Uso

```hcl
module "sqs" {
  source = "path/to/module"

  region                     = "us-east-1"
  queue_name                 = "my-queue"
  delay_seconds              = 5
  max_message_size           = 256000
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 0
  visibility_timeout_seconds = 30
}



Claro, puedo ayudarte a crear un módulo de Terraform para el servicio de cola simple (SQS) de AWS. Asegúrate de ajustar los valores de las variables de acuerdo a tus necesidades. Aquí está un ejemplo básico para empezar:

main.tf
hcl
Copy code
provider "aws" {
  region = var.region
}

resource "aws_sqs_queue" "terraform_queue" {
  name                       = var.queue_name
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
}
variables.tf
hcl
Copy code
variable "region" {
  description = "The region where the SQS queue will be created"
  type        = string
  default     = "us-east-1"
}

variable "queue_name" {
  description = "The name of the SQS queue"
  type        = string
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes)"
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "The limit of how many bytes a message can contain before it is considered too large. An integer from 1,024 bytes (1 KiB) up to 262,144 bytes (256 KiB)"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "The length of time, in seconds, for which Amazon SQS retains a message. An integer representing seconds, from 60 (1 minute) to 1209600 (14 days)"
  type        = number
  default     = 345600
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive. An integer from 0 to 20 (seconds)"
  type        = number
  default     = 0
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)"
  type        = number
  default     = 30
}
outputs.tf
hcl
Copy code
output "queue_url" {
  description = "The URL of the SQS Queue"
  value       = aws_sqs_queue.terraform_queue.id
}

output "queue_arn" {
  description = "The ARN of the SQS Queue"
  value       = aws_sqs_queue.terraform_queue.arn
}
README.md
bash
Copy code
# Terraform AWS SQS Module

Este módulo de Terraform crea un recurso de AWS Simple Queue Service (SQS).

## Uso

```hcl
module "sqs" {
  source = "path/to/module"

  region                     = "us-east-1"
  queue_name                 = "my-queue"
  delay_seconds              = 5
  max_message_size           = 256000
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 0
  visibility_timeout_seconds = 30
}
Variables
region: La región en la que se creará la cola SQS. Por defecto es "us-east-1".
queue_name: El nombre de la cola SQS. Sin valor por defecto.
delay_seconds: El tiempo en segundos que se retrasará la entrega de todos los mensajes en la cola. Un número entero de 0 a 900 (15 minutos). Por defecto es 0.
max_message_size: El límite de cuántos bytes puede contener un mensaje antes de que se considere demasiado grande. Un número entero de 1,024 bytes (1 KiB) hasta 262,144 bytes (256 KiB). Por defecto es 262144.
message_retention_seconds: El tiempo, en segundos, durante el cual Amazon SQS retiene un mensaje. Un número entero que representa segundos, de 60 (1 minuto) a 1209600 (14 días). Por defecto es 345600.
receive_wait_time_seconds: El tiempo durante el cual una llamada de ReceiveMessage esperará a que llegue un mensaje. Un número entero de 0 a 20 (segundos). Por defecto es 0.
visibility_timeout_seconds: El tiempo de visibilidad para la cola. Un número entero de 0 a 43200 (12 horas). Por defecto es 30.



Outputs
queue_url: La URL de la cola SQS.
queue_arn: El ARN de la cola SQS.