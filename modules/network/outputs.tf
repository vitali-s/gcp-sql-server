# Network prefix
output "name_prefix" {
  description = "Name Prefix"
  value       = "${var.network_prefix}"
}

output "network_name" {
  description = "Network name"
  value       = "${google_compute_network.network.name}"
}

# VPC CIDR Range
output "network_cidr_range" {
  description = "Network CIDR Range"
  value       = "${var.network_cidr_range}"
}

# Subnet A Name
output "subnet_a_name" {
  description = "Subnet A Name"
  value       = "${google_compute_subnetwork.subnet-a.name}"
}

# Subnet A CIDR Range
output "subnet_a_cidr_range" {
  description = "Subnet A CIDR Range"
  value       = "${google_compute_subnetwork.subnet-a.ip_cidr_range}"
}

# Subnet B Name
output "subnet_b_name" {
  description = "Subnet B Name"
  value       = "${google_compute_subnetwork.subnet-b.name}"
}

# Subnet B CIDR Range
output "subnet_b_cidr_range" {
  description = "Subnet B CIDR Range"
  value       = "${google_compute_subnetwork.subnet-b.ip_cidr_range}"
}

# Subnet C Name
output "subnet_c_name" {
  description = "Subnet C Name"
  value       = "${google_compute_subnetwork.subnet-c.name}"
}

# Subnet C CIDR Range
output "subnet_c_cidr_range" {
  description = "Subnet C CIDR Range"
  value       = "${google_compute_subnetwork.subnet-c.ip_cidr_range}"
}

output "self_link" {
  description = "Self link of the network created by this module"
  value       = "${google_compute_network.network.self_link}"
}
