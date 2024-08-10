resource "digitalocean_database_cluster" "postgres_cluster" {
  name                 = "example-postgres-cluster"
  engine               = "pg"
  version              = "16"
  size                 = "db-s-1vcpu-1gb"
  region               = digitalocean_vpc.production_vpc.region
  private_network_uuid = digitalocean_vpc.production_vpc.id
  node_count           = 1
}

resource "digitalocean_database_firewall" "postgres_firewall" {
  cluster_id = digitalocean_database_cluster.postgres_cluster.id

  rule {
    type  = "ip_addr"
    value = digitalocean_vpc.production_vpc.ip_range
  }
}

output "database_endpoint" {
  value = digitalocean_database_cluster.postgres_cluster.host
}

output "database_port" {
  value = digitalocean_database_cluster.postgres_cluster.port
}

output "database_user" {
  value = digitalocean_database_cluster.postgres_cluster.user
}

output "database_password" {
  value     = digitalocean_database_cluster.postgres_cluster.password
  sensitive = true
}
