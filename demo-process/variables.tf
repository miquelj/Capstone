variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}


variable "location" {
  description = "Location where are deployed the resources"
  type        = string
}

variable "env" {
  description = "dev, uat, prod"
  type        = string
}
