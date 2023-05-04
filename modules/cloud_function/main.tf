// On crée une cloud function qui va chercher le code dans un bucket
resource "google_cloudfunctions_function" "function" {
  name        = var.name
  description = var.description
  runtime     = var.runtime

  available_memory_mb          = 128
  source_archive_bucket        = var.bucket_name
  source_archive_object        = var.archive_name
  trigger_http                 = true
  https_trigger_security_level = "SECURE_ALWAYS"
  timeout                      = 60
  entry_point                  = var.entry_point
}

// On donne le droit à tout le monde d'appeler la cloud function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}