include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${find_in_parent_folders("_components")}/restricted-vpc.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id  = try(include.root.inputs.non-production.network_project_id, include.root.inputs.non-production.project_id)
  name        = format("%s-restricted-non", include.root.inputs.name)
  description = "Non-production Restricted Spoke VPC"
  regions     = include.root.inputs.regions
  cidrs = {
    primary_ipv4_cidr        = "10.40.0.0/13"
    primary_ipv4_subnet_size = 16
    primary_ipv6_cidr        = null
    secondaries = {
      pods = {
        ipv4_cidr        = "100.88.0.0/16"
        ipv4_subnet_size = 19
      }
      services = {
        ipv4_cidr        = "100.59.0.0/21"
        ipv4_subnet_size = 24
      }
    }
  }
}
