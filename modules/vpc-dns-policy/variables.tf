variable "project_id" {
  type     = string
  nullable = false
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.project_id))
    error_message = "The project_id variable must must be 6 to 30 lowercase letters, digits, or hyphens; it must start with a letter and cannot end with a hyphen."
  }
  description = <<-EOD
  The GCP project identifier where the VPC network will be created.
  EOD
}

variable "name" {
  type     = string
  nullable = false
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{0,54}$", var.name))
    error_message = "The name variable must be RFC1035 compliant and between 1 and 55 characters in length."
  }
  default     = "restricted"
  description = <<-EOD
  The name to use when naming resources managed by this module. Must be RFC1035
  compliant and between 1 and 55 characters in length, inclusive.
  EOD
}

variable "description" {
  type        = string
  default     = "Default policy"
  description = <<-EOD
  A descriptive value to apply to the Cloud DNS policy. Default value is 'Default policy'.
  EOD
}

variable "enable_inbound_forwarding" {
  type        = bool
  nullable    = false
  default     = true
  description = <<-EOD
    If true (default), allow inbound forwarding as the default DNS policy on provided networks.
    EOD
}

variable "network_self_links" {
  type     = set(string)
  nullable = false
  validation {
    condition     = length(var.network_self_links) > 0 && length(compact([for net in var.network_self_links : can(regex("^(?:https://www.googleapis.com/compute/v1/)?projects/[a-z][a-z0-9-]{4,28}[a-z0-9]/global/networks/[a-z]([a-z0-9-]+[a-z0-9])?$", net)) ? "x" : ""])) == length(var.network_self_links)
    error_message = "Each network_self_links value must be a fully-qualified self-link URI."
  }
  description = <<-EOD
  Fully-qualified VPC network self-links to which the Cloud DNS policy will be applied.
  EOD
}
