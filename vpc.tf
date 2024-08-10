resource "digitalocean_vpc" "production_vpc" {
  name     = "production-vpc"
  region   = var.region
  ip_range = "10.10.0.0/16"
}
