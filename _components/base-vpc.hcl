terraform {
  source = "tfr://registry.terraform.io/memes/multi-region-private-network/google?version=2.1.0"
}

inputs = {
  options = {
    delete_default_routes = true
    flow_logs             = true
    ipv6_ula              = false
    mtu                   = 1460
    nat                   = true
    nat_logs              = true
    nat_tags              = null
    restricted_apis       = false
    private_apis          = true
    routing_mode          = "GLOBAL"
  }
}
