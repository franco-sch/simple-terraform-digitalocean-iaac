variable "do_token" {
  description = "DigitalOcean API Token"
  type        = string
}

variable "github_repo" {
  description = "Angular to DigitalOcean example app"
  type        = string
  default     = "franco-sch/angular-to-digitalocean"
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "nyc"
}

variable "space_region" {
  description = "DigitalOcean space region"
  type        = string
  default     = "nyc3"
}

variable "do_spaces_access_key" {
  description = "DigitalOcean Spaces Access Key"
  type        = string
  sensitive   = true
}

variable "do_spaces_secret_key" {
  description = "DigitalOcean Spaces Secret Key"
  type        = string
  sensitive   = true
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}
