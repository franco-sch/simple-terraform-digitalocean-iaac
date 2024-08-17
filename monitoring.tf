########### Droplet Monitoring ################################

resource "digitalocean_monitor_alert" "cpu_alert" {
  alerts {
    email = [var.alert_email]
  }
  window      = "5m"
  type        = "v1/insights/droplet/cpu"
  compare     = "GreaterThan"
  value       = 85
  enabled     = true
  entities    = [digitalocean_droplet.backend.id]
  description = "CPU usage alert"
  tags        = ["Backend", "Droplet"]
}

resource "digitalocean_monitor_alert" "memory_alert" {
  alerts {
    email = [var.alert_email]
  }
  window      = "5m"
  type        = "v1/insights/droplet/memory_utilization_percent"
  compare     = "GreaterThan"
  value       = 90
  enabled     = true
  entities    = [digitalocean_droplet.backend.id]
  description = "Memory usage alert"
  tags        = ["Backend", "Droplet"]
}

resource "digitalocean_monitor_alert" "disk_usage_alert" {
  alerts {
    email = [var.alert_email]
  }
  window      = "5m"
  type        = "v1/insights/droplet/disk_utilization_percent"
  compare     = "GreaterThan"
  value       = 80
  enabled     = true
  entities    = [digitalocean_droplet.backend.id]
  description = "Disk usage alert"
  tags        = ["Backend", "Droplet"]
}

# resource "digitalocean_monitor_alert" "disk_io_alert" {
#   alerts {
#     email = [var.alert_email]
#   }
#   window      = "5m"
#   type        = "v1/insights/droplet/disk_read"
#   compare     = "GreaterThan"
#   value       = 1000
#   enabled     = true
#   entities    = [digitalocean_droplet.backend.id]
#   description = "Disk I/O alert (read operations)"
#   tags        = ["Backend", "Droplet"]
# }

resource "digitalocean_monitor_alert" "network_alert" {
  alerts {
    email = [var.alert_email]
  }
  window      = "5m"
  type        = "v1/insights/droplet/public_outbound_bandwidth"
  compare     = "GreaterThan"
  value       = 100000000 # 100 MB/s
  enabled     = true
  entities    = [digitalocean_droplet.backend.id]
  description = "Network outbound traffic alert"
  tags        = ["Backend", "Droplet"]
}

resource "digitalocean_monitor_alert" "load_average_alert" {
  alerts {
    email = [var.alert_email]
  }
  window      = "5m"
  type        = "v1/insights/droplet/load_5"
  compare     = "GreaterThan"
  value       = 5
  enabled     = true
  entities    = [digitalocean_droplet.backend.id]
  description = "Load average alert (5 minute)"
  tags        = ["Backend", "Droplet"]
}

#############################################################
