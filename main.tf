module "networks" {
  source = "./modules/network"
}

module "sql-server-instance" {
  source = "./modules/sql-server"

  zone = "us-west1-a"

  # machine type in format custom-CPUS-Memory
  machine_type       = "custom-16-256000‬-ext"
  sql_server_image   = "sql-2016-enterprise-windows-2016-dc-v20190514"
  min_cpu_platform   = "Intel Skylake"
  attached_disk_size = "3000"
  network            = "${module.networks.network_name}"
  subnet             = "${module.networks.subnet_a_name}"
}
