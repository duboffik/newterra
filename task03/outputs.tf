/* output "ssh-key_data" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
} */

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

output "VNET_address" {
  value = azurerm_virtual_network.my_VNET.address_space
}

output "SNET1_name" {
  description = "test_description_4"
  value = azurerm_subnet.my_SNET1.name
}

output "SNET1_address" {
  description = "test_description_5"
  value = azurerm_subnet.my_SNET1.address_prefixes
}

output "SNET2_name" {
  description = "test_description_6"
  value = azurerm_subnet.my_SNET2.name
}

output "SNET2_address" {
  description = "ID of project VPC"
  value = azurerm_subnet.my_SNET2.address_prefixes
}

