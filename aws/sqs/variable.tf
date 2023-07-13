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
