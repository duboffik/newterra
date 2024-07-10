/* output "ssh-key_data" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
} */

output "rg_name" {
  description = test_description_1
  value = azurerm_resource_group.my_RG.name
}

output "sa_name" {
  description = test_description_2
  value = azurerm_storage_account.my_SA.name
}

output "VNET_name" {
  description = test_description_3
  value = azurerm_virtual_network.my_VNET.name
}

output "VNET_address" {
  value = azurerm_virtual_network.my_VNET.address_space
}

output "SNET1_name" {
  description = test_description_4
  value = azurerm_subnet.my_SNET1.name
}

output "SNET1_address" {
  description = test_description_5
  value = azurerm_subnet.my_SNET1.address_prefixes
}

output "SNET2_name" {
  description = test_description_6
  value = azurerm_subnet.my_SNET2.name
}

output "SNET2_address" {
  description = test_description_7
  value = azurerm_subnet.my_SNET2.address_prefixes
}

