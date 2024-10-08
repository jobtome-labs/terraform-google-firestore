resource "google_firestore_database" "main" {
  project = var.project

  name = var.name

  location_id = var.location_id

  type = var.type

  concurrency_mode = var.concurrency_mode

  delete_protection_state = var.delete_protection_state

  deletion_policy = var.deletion_policy
}
