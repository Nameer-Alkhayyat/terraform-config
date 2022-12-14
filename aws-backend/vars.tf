variable "projectName" {
}

variable "stage" {

}

variable "envVarMongoUri" {
  description = "connection string to mongo"
  type        = string
  sensitive   = true
}

variable "envVarAppleMongoUri" {
  description = "connection string to Apple mongo"
  type        = string
  sensitive   = true
}
variable "envVarPlusirUser" {
  description = "connection string to Plusir mongo"
  type        = string
  sensitive   = true
}
variable "envVarPlusirPass" {
  description = "connection string to Plusir mongo"
  type        = string
  sensitive   = true
}
variable "envVarTwitterKey" {
  description = "connection string to Twitter"
  type        = string
  sensitive   = true
}
variable "envVarImportData" {
  description = "Import data if true"
  type        = string
  sensitive   = true
}
variable "envVarTestMongoUri" {
  description = "connection string to mongo test"
  type        = string
  sensitive   = true
}
variable "envVarRedisHost" {
  description = "connection string to REDIS DB"
  type        = string
  sensitive   = true
}

variable "envVarRedisPassword" {
  description = "connection string to REDIS DB"
  type        = string
  sensitive   = true
}


variable "envVarRedisName" {
  description = "connection string to REDIS DB"
  type        = string
  sensitive   = true
}











