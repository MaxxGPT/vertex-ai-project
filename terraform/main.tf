terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-east1"
}

resource "random_id" "bucket_suffix" {
    byte_length = 4
}
resource "google_storage_bucket" "data_bucket" {
  name     = "vertex-ai-project-${random_id.bucket_suffix.hex}"
  location = "us-east1"
  uniform_bucket_level_access = true
}

