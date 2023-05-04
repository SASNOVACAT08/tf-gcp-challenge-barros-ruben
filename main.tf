module "bucket" {
  source = "./modules/storage"

  name = var.bucket_name
  location = var.bucket_location
  file_name = var.bucket_file_name
  path = var.bucket_path
}

module "cloud_function" {
  source = "./modules/cloud_function"
  depends_on = [ module.bucket ]

  name = var.cloud_function_name
  description = var.cloud_function_description
  runtime = var.cloud_function_runtime
  bucket_name = module.bucket.bucket_name
  archive_name = module.bucket.archive_name
  entry_point = var.cloud_function_entry_point
}

module "biq_query" {
  source = "./modules/big_query"

  dataset_id = var.big_query_dataset_id
  friendly_name = var.big_query_friendly_name
  description = var.big_query_description
  table_id = var.big_query_table_id
}