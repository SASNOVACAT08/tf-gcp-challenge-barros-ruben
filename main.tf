// On crée le module storage
module "storage" {
  source = "./modules/storage"

  // On passe les variables au module storage
  name = var.storage_name
  location = var.storage_location
  file_name = var.storage_file_name
  path = var.storage_path
}

// On crée le module cloud_function
module "cloud_function" {
  source = "./modules/cloud_function"
  depends_on = [ module.storage ]

  // On passe les variables au module cloud_function
  name = var.cloud_function_name
  description = var.cloud_function_description
  runtime = var.cloud_function_runtime

  // On passe les variables du module storage afin que si le nom du bucket lors de la création du module storage est modifié alors la variable soit bonne
  bucket_name = module.storage.storage_bucket_name
  archive_name = module.storage.storage_archive_name

  entry_point = var.cloud_function_entry_point
}

// On crée le module big_query
module "biq_query" {
  source = "./modules/big_query"

  // On passe les variables au module big_query
  dataset_id = var.big_query_dataset_id
  friendly_name = var.big_query_friendly_name
  description = var.big_query_description
  location = var.big_query_location
  table_id = var.big_query_table_id
}