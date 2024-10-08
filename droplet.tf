resource "digitalocean_droplet" "backend" {
  name     = "backend-server"
  image    = "ubuntu-22-04-x64"
  size     = "s-2vcpu-4gb"
  region   = digitalocean_vpc.production_vpc.region
  vpc_uuid = digitalocean_vpc.production_vpc.id

  ssh_keys = [digitalocean_ssh_key.default.fingerprint]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              echo "Installing Docker"
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker
              echo "Docker installation completed"
              echo "Installing DigitalOcean Monitoring Agent..."
              curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash
              echo "DigitalOcean Monitoring Agent installation completed."
              EOF
}


resource "digitalocean_firewall" "backend" {
  name = "backend-firewall"

  droplet_ids = [digitalocean_droplet.backend.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

output "droplet_ip" {
  value = digitalocean_droplet.backend.ipv4_address
}
