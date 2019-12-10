resource "google_compute_instance" "webserver" {
  name         = "rbuild0"
  machine_type = "f1-micro"
  zone         = "europe-west2-a"
  tags = ["web"]
  metadata_startup_script = "apt-get update && apt-get install -y nginx"


  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }


  metadata = {
    sshkeys= "debian:${file(var.ssh_public_key_filepath)}"
  }

}
