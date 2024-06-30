terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.89.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create Resource group
resource "azurerm_resource_group" "my_RG" {
  name     = var.rg_name
  location = var.rg_location
}

# Create vNet
resource "azurerm_virtual_network" "my_VNET" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.my_RG.name
  location            = azurerm_resource_group.my_RG.location
  address_space       = ["${var.vnet_address}"]
}

# Create Subnet
resource "azurerm_subnet" "my_SNET" {
  name                 = var.snet_name
  virtual_network_name = azurerm_virtual_network.my_VNET.name
  resource_group_name  = azurerm_resource_group.my_RG.name
  address_prefixes     = ["${var.snet_prefixes}"]
}

# Create Public IP
resource "azurerm_public_ip" "my_public_ip" {
  name                = var.my_PublicIP_name
  resource_group_name = azurerm_resource_group.my_RG.name
  location            = azurerm_resource_group.my_RG.location
  allocation_method   = "Dynamic"
  domain_name_label   = var.domain_name_label
}

resource "azurerm_network_security_group" "my_nsg" {
  name                = var.my_NetworkSecurityGroup_name
  resource_group_name = azurerm_resource_group.my_RG.name
  location            = azurerm_resource_group.my_RG.location

#  security_rule {
#    name                       = "cmtr-22"
#    priority                   = 1001
#    direction                  = "Inbound"
#    access                     = "Allow"
#    protocol                   = "Tcp"
#    source_port_range          = "*"
#    destination_port_range     = "22"
#    source_address_prefix      = "*"
#    destination_address_prefix = "*"
#  }
}

resource "azurerm_network_security_rule" "my_rule1" {
  name                       = var.secrule_name1
  priority                   = 1001
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name = azurerm_resource_group.my_RG.name
  network_security_group_name = azurerm_network_security_group.my_nsg.name
}

resource "azurerm_network_security_rule" "my_rule2" {
  name                       = var.secrule_name2
  priority                   = 1002
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name = azurerm_resource_group.my_RG.name
  network_security_group_name = azurerm_network_security_group.my_nsg.name
}

# Create network interface
resource "azurerm_network_interface" "my_nic" {
  name                = var.my_nic_name
  resource_group_name = azurerm_resource_group.my_RG.name
  location            = azurerm_resource_group.my_RG.location

  ip_configuration {
    name                          = var.my_configuration_name
    subnet_id                     = azurerm_subnet.my_SNET.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.my_public_ip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nic_association_with_NSG" {
  network_interface_id      = azurerm_network_interface.my_nic.id
  network_security_group_id = azurerm_network_security_group.my_nsg.id
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_vm" {
  name                            = var.computer_name
  location                        = azurerm_resource_group.my_RG.location
  resource_group_name             = azurerm_resource_group.my_RG.name
  network_interface_ids           = [azurerm_network_interface.my_nic.id]
  size                            = var.vm_size
  disable_password_authentication = false

  os_disk {
    name                 = var.my_disk_name
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = var.image_SKU
    version   = "latest"
  }

  computer_name  = var.computer_name
  admin_username = var.admin_username
  admin_password = var.admin_password

  # Remote-exec provisioner (NGINX configuration)
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y"
    ]
    connection {
      type     = "ssh"
      user     = var.admin_username
      password = var.admin_password
      host     = azurerm_public_ip.my_public_ip.fqdn
    }
  }
}

resource "azurerm_ssh_public_key" "my_ssh" {
  name                = "my_ssh"
  resource_group_name = azurerm_resource_group.my_RG.name
  location            = azurerm_resource_group.my_RG.location
  #public_key          = file("~/.ssh/id_rsa.pub")
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7EV+988V6Uuf5M9R3GmLpg2h5ND90c8bLMNqPXCX2lzelpP9DrvFhXwkIg7B8LlI6SDprhA3IZCBNxsH+WjpVZuqr3Xd91Eh9maZEgPUGZEG2FWDwzEr5d34koNrJEmuY/uTTgdxAGCafHrmbmcZ+JXlk87Onq73CjoGbqUSm3e4ZoUiBAL76gHXCiaoApfcdpq363dRQ7l7yQ7GyTINBNJGu3s1GJqjHk7EpS++g2D0IjmgWLbHX35HF8tqaznXeHTT40gEzf2bN0iz9f8rgBcF/JqmKTmHJKRqFxx6l9suC9ydtz2D5zk5mk44V0bN4KiiK8504kFvygmVWEMexTn8uQRemdpEbLOw4ileQmLdQ6+L9VT10kwzpAABkVT4hJFCNQgGzyde+sBLPiJf5d1rlEg9CWfzBOZ+S3QphgXrnNLDjuMnc2jVk0U4yqiiAIdvE4bLsm33bU0w67qSeYl6xddtNm6o69Bjxa3t478C25dDlYhmeQSXSy+Km7J8= user@Dubovik"
}

resource "azurerm_virtual_machine_extension" "my_extension" {
  name                 = "hostname"
  virtual_machine_id   = azurerm_linux_virtual_machine.my_vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  settings = <<SETTINGS
 {
  "commandToExecute": "bash -c 'date'"
 }
SETTINGS
}
