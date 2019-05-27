variable "network_prefix" {
  description = "VPC and subnetworks prefix"
  default     = "default"
}

variable "network_cidr_range" {
  description = "Network CIDR Range"
  default     = "10.0.0.0/8"
}
