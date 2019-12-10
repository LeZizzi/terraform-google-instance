resource "google_compute_instance" "default" {
  name         = "rbuild0"
  machine_type = "f1-micro"
  region       = "europe-west2"
  zone         = "europe-west2-a"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20191121"
    }
  }

  // Local SSD disk
  scratch_disk {

  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    sshkeys= "debian:${file(var.ssh_public_key_filepath)}"
  }

}
