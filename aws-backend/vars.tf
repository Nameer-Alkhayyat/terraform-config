variable "projectName" {
}

variable "stage" {
    default = "stage" # stage | prod
}

variable "envVarMongoUri" {
  description = "connection string to mongo"
  type        = string
  sensitive   = true
}

variable "envVarSwaggerEnabled" {
  description = "enables swagger endpoint"
  type        = string
  sensitive   = true
  default     = "true"
}

variable "envVarSwaggerUser" {
  description = "swagger user"
  type        = string
  sensitive   = true
  default     = "admin"
}
