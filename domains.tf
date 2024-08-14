resource "digitalocean_certificate" "default_cert" {
  name              = "default-certificate"
  type              = "custom"
  private_key       = file("./certs/privkey.pem")
  leaf_certificate  = file("./certs/cert.pem")
  certificate_chain = file("./certs/fullchain.pem")
}
