output "PublicIP_address" {
  value = azurerm_linux_virtual_machine.my_vm.public_ip_address
}
