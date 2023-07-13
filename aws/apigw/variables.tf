variable "apis" {
  description = "A map of APIs, each with its own map of paths and their corresponding HTTP methods"
  type        = map(map(map(string)))
  default     = {
    "api1" = {
      "ruta1" = {"method" = "GET"},
      "ruta2" = {"method" = "POST"},
      "ruta3" = {"method" = "PUT"},
      "ruta4" = {"method" = "DELETE"}
    },
    "api2" = {
      "ruta1" = {"method" = "GET"},
      "ruta2" = {"method" = "POST"},
      "ruta3" = {"method" = "PUT"},
      "ruta4" = {"method" = "DELETE"}
    },
    "api3" = {
      "ruta1" = {"method" = "GET"},
      "ruta2" = {"method" = "POST"},
      "ruta3" = {"method" = "PUT"},
      "ruta4" = {"method" = "DELETE"}
    },
    "api4" = {
      "ruta1" = {"method" = "GET"},
      "ruta2" = {"method" = "POST"},
      "ruta3" = {"method" = "PUT"},
      "ruta4" = {"method" = "DELETE"}
    }
  }
}

variable "load_balancer_arn" {
  description = "The ARN of the load balancer"
  type        = string
}

variable "cognito_arn" {
  description = "The ARN of the Cognito user pool"
  type        = string
}
