# Create VPC
resource "google_compute_network" "network" {
  name                    = "network-${var.network_prefix}"
  description             = "VPC Network: ${var.network_prefix}"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# create subnet a
resource "google_compute_subnetwork" "subnet-a" {
  name          = "subnet-a-${var.network_prefix}"
  description   = "Subnet A: ${var.network_prefix}"
  ip_cidr_range = "${cidrsubnet(var.network_cidr_range, 12, 1)}"
  network       = "${google_compute_network.network.self_link}"
}

# create subnet b
resource "google_compute_subnetwork" "subnet-b" {
  name          = "subnet-b-${var.network_prefix}"
  description   = "Subnet B: ${var.network_prefix}"
  ip_cidr_range = "${cidrsubnet(var.network_cidr_range, 12, 2)}"
  network       = "${google_compute_network.network.self_link}"
}

# create subnet c
resource "google_compute_subnetwork" "subnet-c" {
  name          = "subnet-c-${var.network_prefix}"
  description   = "Subnet C: ${var.network_prefix}"
  ip_cidr_range = "${cidrsubnet(var.network_cidr_range, 12, 3)}"
  network       = "${google_compute_network.network.self_link}"
}

resource "google_compute_firewall" "allow-rdp" {
  name    = "allow-rdp"
  network = "${google_compute_network.network.self_link}"

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
}
