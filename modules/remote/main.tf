resource "google_storage_bucket" "tf-bucket" {
  name          = var.name
  location      = var.location
  force_destroy = true
  versioning {
    enabled = true
  }
}