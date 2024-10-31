include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "env" {
  path = "${find_in_parent_folders("_components")}/default-dns-policy.hcl"
}

remote_state = include.root.remote_state

locals {
  name = format("%s-prd", include.root.inputs.name)
}

terraform {
  source = "${find_in_parent_folders("modules")}/vpc-dns-policy/"
}

inputs = {
  project_id  = include.root.inputs.production.project_id
  name        = format("%s-prd", include.root.inputs.name)
  description = "Default policy for Production VPCs."
}
