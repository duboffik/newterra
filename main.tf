terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.89.0"
    }
  }
/*   backend "azurerm" {
      resource_group_name  = "module2tfstate002"
      storage_account_name = "module2tfstate002"
      container_name       = "module2tfstate002"
      key                  = "terraform.tfstate"
  } */

}

provider "azurerm" {
  features {}
}

# Create Resource group
resource "azurerm_resource_group" "myRG" {
  name     = "${var.rg_name}"
  location = "${var.rg_location}"
}

# Create vNet
resource "azurerm_virtual_network" "myVNET" {
  name                = "${var.vnet_name}"
  resource_group_name = azurerm_resource_group.module4_rg.name
  location            = azurerm_resource_group.module4_rg.location
  address_space       = ["${var.vnet_address}"]
}

# Create Subnet
resource "azurerm_subnet" "mySNET_snet1" {
  name                 = "${var.snet_name1}"
  virtual_network_name = azurerm_virtual_network.module4_vnet.name
  resource_group_name  = azurerm_resource_group.module4_rg.name
  address_prefixes     = ["${var.snet_prefixes1}"]
}

# Create Subnet
resource "azurerm_subnet" "mySNET_snet2" {
  name                 = "${var.snet_name2}"
  virtual_network_name = azurerm_virtual_network.module4_vnet.name
  resource_group_name  = azurerm_resource_group.module4_rg.name
  address_prefixes     = ["${var.snet_prefixes2}"]
}

resource "azurerm_storage_account" "my_sa" {
  name                     = "${var.sa_name}"
  resource_group_name      = azurerm_resource_group.myRG.name
  location                 = azurerm_resource_group.myRG.location
  account_kind             = "BlockBlobStorage"
  account_tier             = "Premium"

# Create Public IP
#resource "azurerm_public_ip" "module4_public_ip" {
#  name                = "${var.prefix}_myPublicIP"
#  resource_group_name = azurerm_resource_group.module4_rg.name
#  location            = azurerm_resource_group.module4_rg.location
#  allocation_method   = "Dynamic"
#  domain_name_label = "${var.domain_name_label}"
#}

