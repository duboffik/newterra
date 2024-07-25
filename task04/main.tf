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
}

resource "azurerm_network_security_rule" "my_rule1" {
  name                        = var.secrule_name1
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.my_RG.name
  network_security_group_name = azurerm_network_security_group.my_nsg.name
}

resource "azurerm_network_security_rule" "my_rule2" {
  name                        = var.secrule_name2
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.my_RG.name
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
  name                            = var.vm_name
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

  computer_name  = var.vm_name
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
