resource "digitalocean_vpc" "production_vpc" {
  name     = "production-vpc"
  region   = var.region
  ip_range = var.vpc_cidr
}
