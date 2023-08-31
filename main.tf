provider "google" {
  project     = var.project
  credentials = file(var.credentials)
  region      = var.region
  zone        = var.zone
}

#################################### Create Compute Engine ###########################

resource "google_compute_instance" "pjk_instance" {
  name         = "pjk-instance"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230814"
      labels = {
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}
###################################### Create VPC ########################################

resource "google_compute_network" "pjk_compute_network" {
  name = "pjk-compute-network"
}

####################################### Create Subnetwork ################################

resource "google_compute_subnetwork" "pjk_google_compute_subnetwork" {
  name          = "pjk-google-compute-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.pjk_compute_network.id

}

######################################### Ceation of a Compute Storage #######################

resource "google_storage_bucket" "pjk_bucket1029" {
  name          = "pjk-bucket1029"
  location      = "EU"
  force_destroy = true
  uniform_bucket_level_access = true
}