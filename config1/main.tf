terraform {
  backend "gcs" {
    bucket = "playground-54321-terraform-backend"
    prefix = "tf-gh-actions-example/config1"
  }
}

provider "google" {
  project = "playground-54321"
  region  = "europe-west3"
  zone    = "europe-west3-c"
}


resource "google_compute_firewall" "default" {
  name    = "tf-gh-actions-example-config1-firewall"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["1234"]
  }

  source_tags = ["tf-gh-actions-example-config1"]
}
