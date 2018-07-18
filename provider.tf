terraform {
  backend "gcs" {
    bucket = "stackstorm-tf"
    prefix = "workspace"
    region = "europe-west1"
  }
}

provider "google" {
  project = "${var.gcp_project_id}"
  region  = "${var.gcp_region}"
}
