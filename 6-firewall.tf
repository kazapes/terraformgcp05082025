resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-http" {
  name    = "allow-web"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-icmp" {
  name    = "allow-ping"
  network = google_compute_network.main.name

  allow {
    protocol = "icmp"
    # ports    = ["22"] You dont need an icmp port
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "rdp" {
  name    = "allow-shopping"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "data-base" {
  name    = "data-base"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["3306" , "1521"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Make sure you understand the commands you use on the command line