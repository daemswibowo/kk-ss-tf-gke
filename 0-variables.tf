# Cluster variables
variable "gke_cluster" {
  type = object({
    name       = string
    location   = string # region
    project_id = string
  })
  default = {
    name       = "my-gke-cluster"
    location   = "asia-southeast1" # region
    project_id = "my-gcp-project-id"
  }
}
