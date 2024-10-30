include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${find_in_parent_folders("_components")}/restricted-vpc-peering.hcl"
}

remote_state = include.root.remote_state

inputs = {
  prefix = include.root.inputs.name
}
