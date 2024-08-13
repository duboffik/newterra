output "id" {
  value       = azurerm_resource_group.main.id
  description = "The ID of the Resource Group."
}

output "location" {
  value       = azurerm_resource_group.main.location
  description = "The Azure Region where the Resource Group exists."
}
