provider "azurerm" {
  features {}
}

# Create Resource group
module "resource_group" {
  source   = ".\\modules\\resource_group"
  for_each = { for rg in var.resource_groups : rg.name => rg }
  name     = each.key
  location = each.value.location
}

# Create App Service plan
module "app_service_plan" {
  source       = ".\\modules\\app_service_plan"
  for_each     = { for asp in var.app_service_plans : asp.name => asp }
  name         = each.key
  rg_name      = each.value.rg_name
  location     = module.resource_group[each.value.rg_name].location
  os_type      = each.value.os_type
  sku_name     = each.value.sku_name
  worker_count = each.value.worker_count
  depends_on   = [module.resource_group]
}

# Create App Service
module "app_service" {
  source           = ".\\modules\\app_service"
  for_each         = { for as in var.app_services : as.name => as }
  name             = each.key
  rg_name          = each.value.rg_name
  location         = module.resource_group[each.value.rg_name].location
  service_plan_id  = module.app_service_plan[each.value.app_service_plan_name].app_service_plan_id
  site_config      = lookup(each.value, "site_config", null)
  app_settings     = lookup(each.value, "app_settings", null)
  ip               = var.ip
  ip_restrictions  = var.ip_restrictions
  tag_restrictions = var.tag_restrictions
  depends_on       = [module.app_service_plan]
}

# Create Traffic Manager
module "traffic_manager" {
  source                    = ".\\modules\\traffic_manager"
  profile_name              = var.traffic_manager.profile_name
  rg_name                   = var.traffic_manager.rg_name
  traffic_routing_method    = var.traffic_manager.traffic_routing_method
  dns_ttl                   = var.traffic_manager.dns_ttl
  monitor_port              = var.traffic_manager.monitor_port
  monitor_protocol          = var.traffic_manager.monitor_protocol
  monitor_path              = var.traffic_manager.monitor_path
  target_resource_ids       = [for k in module.app_service : k.id]
  traffic_manager_endpoints = var.traffic_manager.traffic_manager_endpoints
  depends_on                = [module.app_service]
}
