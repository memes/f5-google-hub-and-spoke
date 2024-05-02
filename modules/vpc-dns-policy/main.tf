terraform {
  required_version = ">= 1.1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

resource "google_dns_policy" "default_policy" {
  project                   = var.project_id
  name                      = var.name
  description               = var.description
  enable_inbound_forwarding = var.enable_inbound_forwarding
  enable_logging            = true

  dynamic "networks" {
    for_each = var.network_self_links
    content {
      network_url = networks.value
    }
  }
}
