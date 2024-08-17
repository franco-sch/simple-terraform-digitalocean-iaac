resource "digitalocean_app" "angular_to_digital_ocean" {
  spec {
    name   = "angular-to-digital-ocean2"
    region = var.app_platform_region

    static_site {
      name          = "angular-site"
      build_command = "yarn build --configuration=production"
      source_dir    = "/"
      output_dir    = "dist"

      github {
        repo           = var.github_repo
        branch         = "main"
        deploy_on_push = false
      }
    }

    alert {
      rule = "DEPLOYMENT_FAILED"
    }
    alert {
      rule = "DEPLOYMENT_LIVE"
    }
  }
}
