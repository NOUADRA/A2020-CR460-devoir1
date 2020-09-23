resource "google_compute_instance" "canard" {
  name         = "canard"
  machine_type = "f1-micro"
  zone         = "us-east1-c"
  tags         = ["public"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.mtl-dmz.name
    access_config {

    }
  }


  metadata_startup_script = "apt-get -y update && apt-get -y upgrade && apt-get -y install apache2 && systemctl start apache2"
}