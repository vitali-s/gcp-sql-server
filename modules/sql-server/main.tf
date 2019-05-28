resource "google_compute_instance" "instance-1-1" {
  name                      = "instance-${var.instance_prefix}"
  description               = "Instance: ${var.instance_prefix}"
  zone                      = "${var.zone}"
  machine_type              = "${var.machine_type}"
  min_cpu_platform          = "${var.min_cpu_platform}"
  allow_stopping_for_update = false

  boot_disk {
    auto_delete = "true"

    initialize_params {
      size  = "${var.boot_disk_size}"
      type  = "pd-ssd"
      image = "${data.google_compute_image.image.self_link}"
    }
  }

  # create local ssd
  scratch_disk {
    interface = "NVME"
  }

  # attach persistance disk
  attached_disk {
    source = "${google_compute_disk.disk_1.self_link}"
    mode   = "READ_WRITE"
  }

  # attach persistance disk
  attached_disk {
    source = "${google_compute_disk.disk_2.self_link}"
    mode   = "READ_WRITE"
  }

  network_interface {
    network    = "${var.network}"
    subnetwork = "${var.subnet}"

    access_config {}
  }

  scheduling {
    automatic_restart = false
    preemptible       = false
  }

  metadata {
    type = "sql-server-instance"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_disk" "disk_1" {
  name = "disk-1"
  size = "${var.attached_disk_size}"
  type = "pd-ssd"
  zone = "${var.zone}"
}

resource "google_compute_disk" "disk_2" {
  name = "disk-2"
  size = "${var.attached_disk_size}"
  type = "pd-ssd"
  zone = "${var.zone}"
}
