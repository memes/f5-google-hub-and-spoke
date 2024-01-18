include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${get_repo_root()}/_env/base-google-apis-dns-zones.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id = include.root.inputs.non-production.project_id
  name       = format("%s-base-non", include.root.inputs.name)
  labels     = include.root.inputs.labels
}
