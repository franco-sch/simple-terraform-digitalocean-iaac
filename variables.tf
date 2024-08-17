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
  default     = "nyc1"
}

variable "app_platform_region" {
  description = "App Platform sites region"
  type        = string
  default     = "nyc"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "production"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.20.0.0/16"
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

variable "ssh_ip_range" {
  description = "Range of IPs allowed to connect by SSH to droplet"
  type        = string
}

variable "public_domain" {
  description = "Public apex domain"
  type        = string
}

variable "alert_email" {
  description = "Email to send alert information"
  type        = string

}
