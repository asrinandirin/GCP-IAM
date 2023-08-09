variable "service_account_name" {
  type        = string
  default     = ""
  description = "The service account name, it becomes <your.value>@<project-id>.iam.gserviceaccount.com"
}

variable "project_id" {
  type        = string
  default     = ""
  description = "A project ID different from the default defined inside the provider"
  validation {
    condition     = can(regex("(^[a-z][a-z0-9_-]{4,28}[^-]$|^$)", var.project_id))
    error_message = "The project_id variable must be a valid GCP project ID. It must be 6 to 30 lowercase ASCII letters, digits, or hyphens. It must start with a letter. Trailing hyphens are prohibited.. Example: tokyo-rain-123."
  }
}

variable "create" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}

variable "roles" {
  type        = list
  default     = [
    "",
    ""
  ]
  description = "List of roles that you want to bind."
}
