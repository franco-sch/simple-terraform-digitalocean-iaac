resource "digitalocean_droplet" "bastion" {
  name     = "bastion"
  size     = "s-1vcpu-1gb"
  image    = "ubuntu-20-04-x64"
  region   = digitalocean_vpc.production_vpc.region
  vpc_uuid = digitalocean_vpc.production_vpc.id
}

resource "digitalocean_firewall" "bastion_firewall" {
  name = "bastion-firewall"

  droplet_ids = [digitalocean_droplet.bastion.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = [var.ssh_ip_range]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "all"
    destination_addresses = [digitalocean_vpc.production_vpc.ip_range]
  }
}
