terraform {
  backend "gcs" {
    bucket      = "backend-gcp-terraform-ruben"
    prefix      = "terraform/state"
    credentials = "./credentials.json"
  }

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("credentials.json")

  project = "challenge-gcp-385707"
  region  = "us-central1"
  zone    = "us-central1-c"
}
