resource "google_compute_network" "stackstorm-vpc" {
  name                    = "${var.gcp_name}-vpc"
  auto_create_subnetworks = "${var.auto_create_subnetworks}"
}

resource "google_compute_subnetwork" "stackstorm-subnet" {
  name                     = "${var.gcp_name}-subnet"
  ip_cidr_range            = "${var.ip_cidr_range}"
  network                  = "${google_compute_network.stackstorm-vpc.self_link}"
  region                   = "${var.gcp_region}"
  private_ip_google_access = "true"
}

resource "google_compute_firewall" "default" {
  name    = "${var.gcp_name}-firewall"
  network = "${google_compute_network.stackstorm-vpc.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["default", "stackstorm-node"]
}

resource "google_compute_instance" "stackstorm-host" {
  name                      = "st2node-${var.gcp_name}"
  machine_type              = "${var.machine_type}"
  zone                      = "${var.gcp_zone}"
  tags                      = ["stackstorm-node"]
  allow_stopping_for_update = "${var.allow_stopping_for_update}"

  boot_disk {
    initialize_params {
      image = "${var.host_image}"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.stackstorm-subnet.self_link}"

    access_config {
      # Ephemeral
    }
  }

  # metadata {
  #   ssh-keys = "root:${file("${var.public_key_path}")}"
  # }

  metadata_startup_script = "${file("scripts/startup.sh")}"
}
