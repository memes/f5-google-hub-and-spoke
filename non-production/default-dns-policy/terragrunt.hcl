include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${get_repo_root()}/_env/default-dns-policy.hcl"
}

remote_state = include.root.remote_state

inputs = {
  project_id  = include.root.inputs.production.project_id
  name        = format("%s-non", include.root.inputs.name)
  description = "Default policy for Non-production VPCs."
}
