# Peering takes some time; allow terragrunt to retry when there is an error.
retryable_errors = concat(get_default_retryable_errors(), [
  "There is a peering operation in progress on the local or peer network\\. Try again later\\.",
])
retry_max_attempts       = 5
retry_sleep_interval_sec = 30

dependencies {
  paths = [
    "${find_in_parent_folders("shared")}/restricted/vpc/",
    "../vpc/",
  ]
}

dependency "hub" {
  config_path = "${find_in_parent_folders("shared")}/restricted/vpc/"
  mock_outputs = {
    self_link = "https://www.googleapis.com/compute/v1/projects/mock-project/global/networks/mock-restricted-hub"
  }
}

dependency "spoke" {
  config_path = "../vpc/"
  mock_outputs = {
    self_link = "https://www.googleapis.com/compute/v1/projects/mock-project/global/networks/mock-restricted-dev"
  }
}

terraform {
  source = "tfr://registry.terraform.io/terraform-google-modules/network/google//modules/network-peering?version=9.1.0"
}

inputs = {
  local_network             = dependency.spoke.outputs.self_link
  peer_network              = dependency.hub.outputs.self_link
  export_peer_custom_routes = true
}
