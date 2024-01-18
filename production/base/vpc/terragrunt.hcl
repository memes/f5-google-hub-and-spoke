include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "base" {
  path = "${get_repo_root()}/_env/base-vpc.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id  = try(include.root.inputs.production.network_project_id, include.root.inputs.production.project_id)
  name        = format("%s-base-prd", include.root.inputs.name)
  description = "Production Base Spoke VPC"
  regions     = include.root.inputs.regions
  cidrs = {
    primary_ipv4_cidr        = "10.48.0.0/13"
    primary_ipv4_subnet_size = 16
    primary_ipv6_cidr        = null
    secondaries = {
      pods = {
        ipv4_cidr        = "100.96.0.0/16"
        ipv4_subnet_size = 19
      }
      services = {
        ipv4_cidr        = "100.97.0.0/21"
        ipv4_subnet_size = 24
      }
    }
  }
}
