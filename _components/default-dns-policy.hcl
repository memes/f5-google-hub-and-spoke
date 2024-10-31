dependencies {
  paths = [
    "../base/vpc/",
    "../restricted/vpc/",
  ]
}

dependency "base_vpc" {
  config_path = "../base/vpc/"
  mock_outputs = {
    self_link = "https://www.googleapis.com/compute/v1/projects/mock-project/global/networks/mock-base"
  }
}

dependency "restricted_vpc" {
  config_path = "../restricted/vpc/"
  mock_outputs = {
    self_link = "https://www.googleapis.com/compute/v1/projects/mock-project/global/networks/mock-restricted"
  }
}

terraform {
  source = "${find_in_parent_folders("modules")}/vpc-dns-policy/"
}

inputs = {
  network_self_links = [
    dependency.base_vpc.outputs.self_link,
    dependency.restricted_vpc.outputs.self_link,
  ]
}
