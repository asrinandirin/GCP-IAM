output "created" {
  value       = var.create
  description = "Was the Service Account created"
}

output "service-account-name" {
  value       = "${local.service_account_name}@${local.project_id}.iam.gserviceaccount.com"
  description = "The Service Account name"
}

output "project_id" {
  value       = local.project_id
  description = "The Project ID"
}

output "binded_roles" {
  value       = local.roles
  description = "Binded Roles."
}

