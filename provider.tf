terraform {
  // On indique notre backend
  backend "gcs" {
    bucket      = "backend-gcp-terraform-ruben"
    prefix      = "terraform/state"
    credentials = "./credentials.json"
  }

  // On indique la version de gcp
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

// On indique le provider et les infos
provider "google" {
  credentials = file("credentials.json")

  // Ne pas oublier de changer le project
  project = "challenge-gcp-385707"
  region  = "us-central1"
  zone    = "us-central1-c"
}
