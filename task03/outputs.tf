output "rg_ID" {
  description = "test_description_1"
  value = azurerm_resource_group.my_RG.id
}

output "sa_blob_endpoint" {
  description = "test_description_2"
  value = azurerm_storage_account.my_SA.primary_blob_endpoint
}

output "VNET_ID" {
  description = "test_description_3"
  value = azurerm_virtual_network.my_VNET.id
}
