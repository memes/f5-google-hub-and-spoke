include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${get_repo_root()}/_components/restricted-vpc.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id  = include.root.inputs.dns.project_id
  name        = format("%s-dns-hub", include.root.inputs.name)
  description = "Shared DNS Hub VPC"
  regions     = include.root.inputs.regions
  cidrs = {
    primary_ipv4_cidr        = "172.16.0.0/24"
    primary_ipv4_subnet_size = 25
    primary_ipv6_cidr        = null
    secondaries              = {}
  }
}
