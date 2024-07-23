provider "azurerm" {
  features {}
}

locals {
  common_tags = {
    Owner = "DevOps Team"
    Service = "cmaz-927242a5-mod3-rg"
  }
}

# Create Resource group
resource "azurerm_resource_group" "my_RG" {
  name     = local.common_tags.Service
  location = var.rg_location
  tags = {
    Creator = "dzmitry_dubovik@epam.com"
  }
}

# Create vNet
resource "azurerm_virtual_network" "my_VNET" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.my_RG.name
  location            = azurerm_resource_group.my_RG.location
  address_space       = ["${var.vnet_address}"]
  tags = {
    Creator = "dzmitry_dubovik@epam.com"
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
    Creator = "dzmitry_dubovik@epam.com"
  }
}
