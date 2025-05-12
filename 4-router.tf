# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "kazapesrouter" {
  name    = "kazapesrouter"
  region  = "us-east1"
  network = google_compute_network.main.id
}


resource "google_compute_router" "kazapes2router" {
  name    = "kazapes2router"
  region  = "us-west1"
  network = google_compute_network.backup.id
}