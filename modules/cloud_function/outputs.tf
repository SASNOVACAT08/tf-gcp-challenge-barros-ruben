// On output l'url de la cloud function
output "cloud_function_url" {
  value = google_cloudfunctions_function.function.https_trigger_url
}