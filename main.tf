// On crée le module storage
module "storage" {
  source = "./modules/storage"

  // On passe les variables au module storage
  name = var.bucket_name
  location = var.bucket_location
  file_name = var.bucket_file_name
  path = var.bucket_path
}

// On crée le module cloud_function
module "cloud_function" {
  source = "./modules/cloud_function"
  depends_on = [ module.bucket ]

  // On passe les variables au module cloud_function
  name = var.cloud_function_name
  description = var.cloud_function_description
  runtime = var.cloud_function_runtime

  // On passe les variables du module storage afin que si le nom du bucket lors de la création du module storage est modifié alors la variable soit bonne
  bucket_name = module.bucket.bucket_name
  archive_name = module.bucket.archive_name


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