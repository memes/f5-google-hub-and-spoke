include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${get_repo_root()}/_components/restricted-google-apis-dns-zones.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id = include.root.inputs.development.project_id
  name       = format("%s-restricted-dev", include.root.inputs.name)
  labels     = include.root.inputs.labels
}
