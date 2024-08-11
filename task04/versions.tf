terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.110.0, < 4.0.0"
    }
  }
  required_version = ">= 1.5.7"

  #  backend "azurerm" {
  #    storage_account_name = "mystorageaccount"
  #    container_name       = "terraform-state"
  #    key                  = "production.terraform.tfstate"
  #    resource_group_name  = "myResourceGroup"
  #  }
}
