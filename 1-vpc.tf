# setup google provider
provider "google" {
  project = var.gke_cluster.project_id
  region  = var.gke_cluster.location
}

# Create new VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.gke_cluster.name}-vpc"
  auto_create_subnetworks = "false"
}

# Create new subnetwork
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.gke_cluster.name}-subnet"
  region        = var.gke_cluster.location
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

# Create new global address for external access
resource "google_compute_global_address" "external_address" {
  name = "${var.gke_cluster.name}-external-address"
}
