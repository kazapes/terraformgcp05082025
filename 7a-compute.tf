#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
# Creates a service account. Not needed for now
# resource "google_service_account" "default" {
#   account_id   = "my-custom-sa"
#   display_name = "Custom SA for VM Instance"
# }

resource "google_compute_instance" "hqinternal-sc-vm" {
  name         = "sc-instance"
  machine_type = "n2-standard-2"
  zone         = "us-east1-b"

  tags = ["sc-instance", "hqinternal"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }


  #   // Local SSD disk
  #   scratch_disk {
  #     interface = "NVME"
  #   }

  network_interface {
    # network = "default"
    subnetwork = google_compute_subnetwork.hqinternal.name
    access_config {
      // Ephemeral public IP
    }
  }
}
resource "google_compute_instance" "secinternal-sc-vm" {
  name         = "sc2-instance"
  machine_type = "n2-standard-2"
  zone         = "us-west1-b"

  tags = ["sc2-instance", "secinternal"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  metadata_startup_script = file("./startup-plain.sh")

  network_interface {
    # network = "default"
    subnetwork = google_compute_subnetwork.secinternal.name
    access_config {
      // Ephemeral public IP
    }
  }
}