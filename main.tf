resource "google_compute_instance" "default" {
  name         = "rbuild0"
  machine_type = "f1-micro"
  region       = "europe-west2"
  zone         = "europe-west2-a"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  // Local SSD disk
  scratch_disk {}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    sshKeys = "ubuntu:${file(var.ssh_public_key_filepath)}"
  }

}
