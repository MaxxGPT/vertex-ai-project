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

resource "google_vertex_ai_dataset" "bike_data" {
  display_name        = "bike_data"
  metadata_schema_uri = "gs://google-cloud-aiplatform/schema/dataset/metadata/tabular_1.0.0.yaml"
  region              = "us-east1"
}