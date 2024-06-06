# GKE cluster
data "google_container_engine_versions" "gke_version" {
  location       = var.gke_cluster.location
  version_prefix = "1.27."
}

# Provision GKE Autopilot
resource "google_container_cluster" "primary" {
  name                = var.gke_cluster.name
  location            = var.gke_cluster.location
  initial_node_count  = 1
  network             = google_compute_network.vpc.name
  subnetwork          = google_compute_subnetwork.subnet.name
  enable_autopilot    = true
  deletion_protection = false
}
