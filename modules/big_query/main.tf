// On crée un dataset dans big query
resource "google_bigquery_dataset" "default" {
  dataset_id                  = var.dataset_id
  friendly_name               = var.friendly_name
  description                 = var.friendly_name
  location                    = var.location
  default_table_expiration_ms = 3600000
}

// On crée une table dans le dataset
resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = var.table_id

  time_partitioning {
    type = "DAY"
  }

  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF

  // On ajoute ca pour pouvoir destroy la table avec terraform
  deletion_protection = false
}