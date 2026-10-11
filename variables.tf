variable "compute_global_network_endpoint_groups" {
  description = <<EOT
Map of compute_global_network_endpoint_groups, attributes below
Required:
    - name
    - network_endpoint_type
Optional:
    - default_port
    - deletion_policy
    - description
    - project
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    name                  = string
    network_endpoint_type = string
    default_port          = optional(number)
    deletion_policy       = optional(string)
    description           = optional(string)
    project               = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

