dependencies {
  paths = [
    "${get_repo_root()}/shared/base/vpc/",
    "../vpc/",
  ]
}

dependency "hub" {
  config_path = "${get_repo_root()}/shared/base/vpc/"
  mock_outputs = {
    self_link = "https://www.googleapis.com/compute/v1/projects/mock-project/global/networks/mock-base-hub"
  }
}

dependency "spoke" {
  config_path = "../vpc/"
  mock_outputs = {
    self_link = "https://www.googleapis.com/compute/v1/projects/mock-project/global/networks/mock-base-spoke"
  }
}

terraform {
  source = "tfr:///terraform-google-modules/network/google//modules/network-peering?version=8.1.0"
}

inputs = {
  local_network             = dependency.spoke.outputs.self_link
  peer_network              = dependency.hub.outputs.self_link
  export_peer_custom_routes = true
}
