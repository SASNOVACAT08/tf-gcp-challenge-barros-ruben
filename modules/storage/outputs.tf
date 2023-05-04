// On output le nom du bucket et le nom de l'archive pour être récupéré à la racine du projet

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}

output "archive_name" {
  value = google_storage_bucket_object.archive.name
}