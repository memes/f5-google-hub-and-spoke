include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${find_in_parent_folders("_components")}/restricted-google-apis-dns-zones.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id = include.root.inputs.shared.project_id
  name       = format("%s-restricted-hub", include.root.inputs.name)
  labels     = include.root.inputs.labels
}
