# Create Traffic Manager Profile
resource "azurerm_traffic_manager_profile" "main" {
  name                   = var.profile_name
  resource_group_name    = var.rg_name
  traffic_routing_method = var.traffic_routing_method
  max_return             = var.max_return
  tag                    = var.tags

  dns_config {
    relative_name = var.profile_name
    ttl           = var.dns_ttl
  }

  monitor_config {
    protocol = var.monitor_protocol
    port     = var.monitor_port
    path     = var.monitor_path
  }
}

# Create Traffic Manager Endpoint
resource "azurerm_traffic_manager_azure_endpoint" "main" {
  for_each           = { for tme in var.traffic_manager_endpoints : tme.name => tme }
  name               = each.key
  weight             = each.value.weight
  profile_id         = azurerm_traffic_manager_profile.main.id
  target_resource_id = var.target_resource_ids[index(var.traffic_manager_endpoints, each.value)]
}
