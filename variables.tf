variable "gcp_project_id" {
  description = "GCP project ID"
  default     = "st2-tf"
}

variable "gcp_name" {
  description = "Name / string used to build names for resources"
  default     = "stackstorm"
}

variable "gcp_region" {
  description = "GCP region, e.g. europe-west1"
  default     = "europe-west2"
}

variable "gcp_zone" {
  description = "GCP zone, e.g. europe-west2-d (which must be in gcp_region)"
  default     = "europe-west2-c"
}

variable "ip_cidr_range" {
  description = "Network cidr range"
}

variable "auto_create_subnetworks" {
  default = "false"
}

variable "allow_stopping_for_update" {
  default = "true"
}

variable "host_image" {
  description = "Host image - If other than Core OS. Compute resource will need modifications"
  default     = "ubuntu-1604-xenial-v20180627"
}

variable "machine_type" {
  description = "Host flavor"
  default     = "n1-standard-2"
}
