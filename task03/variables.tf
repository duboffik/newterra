variable "rg_name" {
  description = "Name of the Resource Group"
}

variable "rg_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "vnet_address" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Address of the virtual network"
}

variable "snet_name1" {
  type        = string
  description = "Name of the subnet1"
}

variable "snet1_prefixes" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Prefixes of the subnet1"
}

variable "snet_name2" {
  type        = string
  description = "Name of the subnet2"
}

variable "snet2_prefixes" {
  type        = string
  default     = "10.0.2.0/24"
  description = "Prefixes of the subnet2"
}

variable "sa_name" {
  type        = string
  description = "Name of storage account"
}

#variable "storage_account_type" {
#  type        = string
#  default = "Standard_LRS"
#  description = "Storage account type for os_disk"
#}
