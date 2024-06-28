/* output "ssh-key_data" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
} */

output "rg_name" {
  value = azurerm_resource_group.my_RG.name
}

output "VNET_name" {
  value = azurerm_virtual_network.my_VNET.name
}

output "VNET_address" {
  value = azurerm_virtual_network.my_VNET.address_space
}

output "SNET_name" {
  value = azurerm_subnet.my_SNET.name
}

output "SNET_address" {
  value = azurerm_subnet.my_SNET.address_prefixes
}

output "PublicIP_address" {
  value = azurerm_linux_virtual_machine.my_vm.public_ip_address
}

output "PublicIP_dns" {
  value = azurerm_public_ip.my_public_ip.fqdn
}


