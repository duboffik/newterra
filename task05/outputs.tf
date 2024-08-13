output "azurerm_traffic_manager_profile" {
  description = "The FQDN of the created Profile."
  value       = module.traffic_manager.traffic_manager_fqdn
}
