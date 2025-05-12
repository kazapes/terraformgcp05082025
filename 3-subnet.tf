resource "google_compute_subnetwork" "hqinternal" {
  name                     = "hqinternal"
  ip_cidr_range            = "10.85.10.0/24"
  region                   = "us-east1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}
resource "google_compute_subnetwork" "secinternal" {
  name                     = "secinternal"
  ip_cidr_range            = "10.85.20.0/24"
  region                   = "us-west1"
  network                  = google_compute_network.backup.id
  private_ip_google_access = true
}