include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependencies {
  paths = [
    "../vpc/",
  ]
}

dependency "vpc" {
  config_path = "../vpc/"
  mock_outputs = {
    self_link = "https://www.googleapis.com/compute/v1/projects/mock-project/global/networks/mock-dns-vpc"
  }
}

remote_state = include.root.remote_state

terraform {
  source = "${find_in_parent_folders("modules")}/vpc-dns-policy/"
}

inputs = {
  project_id  = include.root.inputs.dns.project_id
  name        = format("%s-dns-hub", include.root.inputs.name)
  description = "Default policy for DNS Hub VPC."
  network_self_links = [
    dependency.vpc.outputs.self_link,
  ]
}
