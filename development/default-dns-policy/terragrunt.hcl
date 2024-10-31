include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${find_in_parent_folders("_components")}/default-dns-policy.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id  = include.root.inputs.development.project_id
  name        = format("%s-dev", include.root.inputs.name)
  description = "Default policy for Development VPCs."
}
