output "vm_public_ip" {
  description = "Public IP of Virtual machine"
  value = azurerm_linux_virtual_machine.my_vm.public_ip_address
}

