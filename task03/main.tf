provider "azurerm" {
  features {}
}

resource "terraform_data" "example2" {
  provisioner "local-exec" {
    command     = "Get-Date > completed.txt"
    interpreter = ["PowerShell", "-Command"]
  }
}

# Create Resource group
resource "azurerm_resource_group" "my_RG" {
  name = test
  #var.rg_name
  location = var.rg_location
  tags = {
    Creator = "student_email"
  }
}

# Create vNet
resource "azurerm_virtual_network" "my_VNET" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.my_RG.name
  location            = azurerm_resource_group.my_RG.location
  address_space       = ["${var.vnet_address}"]
  tags = {
    Creator = "student_email"
  }
}

# Create Subnet
resource "azurerm_subnet" "my_SNET1" {
  name                 = var.snet_name1
  virtual_network_name = azurerm_virtual_network.my_VNET.name
  resource_group_name  = azurerm_resource_group.my_RG.name
  address_prefixes     = ["${var.snet1_prefixes}"]
}

# Create Subnet
resource "azurerm_subnet" "my_SNET2" {
  name                 = var.snet_name2
  virtual_network_name = azurerm_virtual_network.my_VNET.name
  resource_group_name  = azurerm_resource_group.my_RG.name
  address_prefixes     = ["${var.snet2_prefixes}"]
}

# Create Storage account
resource "azurerm_storage_account" "my_SA" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.my_RG.name
  location                 = azurerm_resource_group.my_RG.location
  account_kind             = "BlockBlobStorage"
  account_tier             = "Premium"
  account_replication_type = "LRS"
  tags = {
    Creator = "student_email"
  }
}
