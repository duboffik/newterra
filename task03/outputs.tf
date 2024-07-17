output "rg_id" {
  description = "rg_id"
  value       = azurerm_storage_account.my_SA.primary_blob_endpoint
#  value       = azurerm_resource_group.my_RG.id
}

output "sa_blob_endpoint" {
  description = "sa_blob_endpoint"
  value       = azurerm_storage_account.my_SA.primary_blob_endpoint
}

output "vnet_id" {
  description = "VNET_id"
#  value       = azurerm_virtual_network.my_VNET.id
  value       = azurerm_resource_group.my_RG.id
}
