dependencies {
  paths = [
    "../vpc/",
  ]
}

dependency "vpc" {
  config_path = "../vpc/"
  mock_outputs = {
    self_link = "https://www.googleapis.com/compute/v1/projects/mock-project/global/networks/mock-restricted"
  }
}

terraform {
  source = "tfr:///memes/restricted-apis-dns/google?version=1.3.0"
}

inputs = {
  network_self_links = [
    dependency.vpc.outputs.self_link,
  ]
}
