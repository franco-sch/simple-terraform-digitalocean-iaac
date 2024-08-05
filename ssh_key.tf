resource "digitalocean_ssh_key" "default" {
  name       = "SSH Key for Droplets"
  public_key = file(var.ssh_public_key_path)
}