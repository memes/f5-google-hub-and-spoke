include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${get_repo_root()}/_components/base-vpc.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id  = include.root.inputs.shared.project_id
  name        = format("%s-base-hub", include.root.inputs.name)
  description = "Shared Base Hub VPC"
  regions     = include.root.inputs.regions
  cidrs = {
    primary_ipv4_cidr        = "10.0.0.0/13"
    primary_ipv4_subnet_size = 16
    primary_ipv6_cidr        = null
    secondaries              = {}
  }
}
