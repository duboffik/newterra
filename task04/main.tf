terraform {
  backend "azurerm" {
    resource_group_name  = "StorageAccountResourceGroup"
    storage_account_name = "myterraformstorage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Create Resource group
resource "azurerm_resource_group" "this" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

# Create vNet
resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  address_space       = var.vnet_address_space
  tags                = var.tags
}

# Create Subnet
resource "azurerm_subnet" "this" {
  name                 = var.subnet_name
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = azurerm_resource_group.this.name
  address_prefixes     = var.subnet_address_prefixes
}

# Create Public IP
resource "azurerm_public_ip" "this" {
  name                = var.public_ip
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  allocation_method   = "Dynamic"
  domain_name_label   = var.domain_name_label
  tags                = var.tags
}

resource "azurerm_network_security_group" "this" {
  name                = var.nsg_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = var.tags
}

resource "azurerm_network_security_rule" "http" {
  name                        = var.nsg_rule_http
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.this.name
  network_security_group_name = azurerm_network_security_group.this.name
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = var.nsg_rule_ssh
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.this.name
  network_security_group_name = azurerm_network_security_group.this.name
}

# Create network interface
resource "azurerm_network_interface" "this" {
  name                = var.nic_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = var.tags

  ip_configuration {
    name                          = var.nic_ip_conf_name
    subnet_id                     = azurerm_subnet.this.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = azurerm_network_security_group.this.id
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "this" {
  name                            = var.vm_name
  location                        = azurerm_resource_group.this.location
  resource_group_name             = azurerm_resource_group.this.name
  network_interface_ids           = [azurerm_network_interface.this.id]
  size                            = var.vm_size
  disable_password_authentication = false
  tags                            = var.tags

  os_disk {
    name                 = var.vm_disk_name
    caching              = "ReadWrite"
    storage_account_type = var.vm_sa_type
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_SKU
    version   = "latest"
  }

  computer_name  = var.vm_name
  admin_username = var.vm_username
  admin_password = var.vm_password

  # Remote-exec provisioner (NGINX configuration)
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y"
    ]
    connection {
      type     = "ssh"
      user     = var.vm_username
      password = var.vm_password
      host     = azurerm_public_ip.this.fqdn
    }
  }
}
