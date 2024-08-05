resource "digitalocean_spaces_bucket" "terraform_state" {
  name   = "simple-iaac-tf-state"
  region = var.space_region
  acl    = "private"

  versioning {
    enabled = true
  }
}

terraform {
  backend "s3" {
    bucket                      = "simple-iaac-tf-state"
    key                         = "terraform.tfstate"
    endpoints                   = { s3 : "https://nyc3.digitaloceanspaces.com" }
    region                      = "us-east-1"
    encrypt                     = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_s3_checksum            = true
  }
}
