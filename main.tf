resource "google_compute_global_network_endpoint_group" "compute_global_network_endpoint_groups" {
  for_each = var.compute_global_network_endpoint_groups

  name                  = each.value.name
  network_endpoint_type = each.value.network_endpoint_type
  default_port          = each.value.default_port
  deletion_policy       = each.value.deletion_policy
  description           = each.value.description
  project               = each.value.project

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

