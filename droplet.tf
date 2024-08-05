resource "digitalocean_droplet" "backend" {
  image    = "ubuntu-22-04-x64"
  name     = "backend-server"
  region   = "nyc1"
  size     = "s-2vcpu-4gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker
              EOF
}


resource "digitalocean_firewall" "backend" {
  name = "backend-firewall"

  droplet_ids = [digitalocean_droplet.backend.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

output "droplet_ip" {
  value = digitalocean_droplet.backend.ipv4_address
}
