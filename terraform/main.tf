data "digitalocean_kubernetes_versions" "latest" {
  version_prefix = "1.22."
}

resource "digitalocean_kubernetes_cluster" "this" {
  name         = "cluster-api--example"
  region       = "fra1"
  version      = data.digitalocean_kubernetes_versions.latest.latest_version
  auto_upgrade = true

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = "default"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}
