locals {
  project_id = length(var.project_id) > 0 ? var.project_id : data.google_project.selected[0].project_id
  service_account_email = var.create ? (
    length(google_service_account.sa) > 0 ? google_service_account.sa[0].email : ""
  ) : ""
  service_account_name = length(var.service_account_name) > 0 ? (
  var.service_account_name) : "lwsvc-${random_id.uniq.hex}"
  roles = var.roles 
  role_count = length(var.roles)
}

resource "random_id" "uniq" {
  byte_length = 4
}

data "google_project" "selected" {
  count = length(var.project_id) > 0 ? 0 : 1
}

resource "google_service_account" "sa" {
  count        = var.create ? 1 : 0
  project      = local.project_id
  account_id   = local.service_account_name
  display_name = local.service_account_name
}

resource "google_project_iam_binding" "role_binding" {
  count   = local.role_count
  project = local.project_id
  role               = local.roles[count.index]
  members = [
    "serviceAccount:${local.service_account_name}@${local.project_id}.iam.gserviceaccount.com",
  ]
  depends_on = [google_service_account.sa[0]]
}
