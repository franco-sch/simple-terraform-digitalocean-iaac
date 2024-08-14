# Create the load balancer
resource "digitalocean_loadbalancer" "backend" {
  name                   = "${var.environment}-backend-lb"
  region                 = var.region
  vpc_uuid               = digitalocean_vpc.production_vpc.id
  redirect_http_to_https = true

  forwarding_rule {
    entry_protocol   = "https"
    entry_port       = 443
    target_protocol  = "https"
    target_port      = 443
    # certificate_name = digitalocean_certificate.default_cert.name
    tls_passthrough  = false

  }
  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [
    digitalocean_droplet.backend.id
  ]

}
