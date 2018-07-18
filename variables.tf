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
  description = "Prevent creation of default subnets for each zone, for new VPC"
  default     = "false"
}

variable "allow_stopping_for_update" {
  description = "Allow terraform to stop GCP instance when needed for updates."
  default     = "true"
}

variable "host_image" {
  description = "Host image - startup script support only ubuntu/debian at the moment"
  default     = "ubuntu-1604-xenial-v20180627"
}

variable "machine_type" {
  description = "Host sizing - n1-standard-2 is recommanded. Smaller might affect performance"
  default     = "n1-standard-2"
}
