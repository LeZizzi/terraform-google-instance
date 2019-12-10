resource "google_compute_instance" "database" {
  name         = "rbuild0"
  machine_type = "f1-micro"
  zone         = "us-west1-a"

  tags = ["db"]

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
