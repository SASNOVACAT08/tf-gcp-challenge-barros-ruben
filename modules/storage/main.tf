// On crée un bucket
resource "google_storage_bucket" "bucket" {
  name     = var.name
  location = var.location
}

// On upload le code de la cloud function dans le bucket
resource "google_storage_bucket_object" "archive" {
  name   = var.file_name
  bucket = google_storage_bucket.bucket.name
  source = var.path
}