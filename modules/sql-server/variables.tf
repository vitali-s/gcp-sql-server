variable "instance_prefix" {
  description = "Instance prefix"
  default     = "default"
}

variable "machine_type" {
  description = "Machine type in format custom-CPUS-MEM, number of CPUs and memory for custom machine. https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#specifications"
}

variable "zone" {
  description = "Machine zone"
}

variable "min_cpu_platform" {
  description = "Minimum CPU platform for the VM instance"
  default     = "Automatic"
}

variable "boot_disk_size" {
  description = "Boot disk size"
  default     = "50"
}

variable "attached_disk_size" {
  description = "Boot disk size"
  default     = "3000"
}

variable "network" {
  description = "Network"
}

variable "subnet" {
  description = "Subnetwork"
}

variable "sql_server_image" {
  description = "SQL Server image"
  default     = "sql-2017-enterprise-windows-2016-dc-v20190514"
}

data "google_compute_image" "image" {
  name    = "${var.sql_server_image}"
  project = "windows-sql-cloud"
}
