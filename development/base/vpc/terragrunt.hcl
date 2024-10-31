include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "base" {
  path = "${find_in_parent_folders("_components")}/base-vpc.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id  = try(include.root.inputs.development.network_project_id, include.root.inputs.development.project_id)
  name        = format("%s-base-dev", include.root.inputs.name)
  description = "Development Base Spoke VPC"
  regions     = include.root.inputs.regions
  cidrs = {
    primary_ipv4_cidr        = "10.16.0.0/13"
    primary_ipv4_subnet_size = 16
    primary_ipv6_cidr        = null
    secondaries = {
      pods = {
        ipv4_cidr        = "100.64.0.0/16"
        ipv4_subnet_size = 19
      }
      services = {
        ipv4_cidr        = "100.65.0.0/21"
        ipv4_subnet_size = 24
      }
    }
  }
}
