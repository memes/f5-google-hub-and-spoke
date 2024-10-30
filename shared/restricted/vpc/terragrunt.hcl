include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${find_in_parent_folders("_components")}/restricted-vpc.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id  = include.root.inputs.shared.project_id
  name        = format("%s-restricted-hub", include.root.inputs.name)
  description = "Shared Restricted Hub VPC"
  regions     = include.root.inputs.regions
  cidrs = {
    primary_ipv4_cidr        = "10.8.0.0/13"
    primary_ipv4_subnet_size = 16
    primary_ipv6_cidr        = null
    secondaries              = {}
  }
}
