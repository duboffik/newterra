output "azurerm_public_ip" {
  value = azurerm_linux_virtual_machine.my_vm.public_ip_address
}
