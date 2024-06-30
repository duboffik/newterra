variable "rg_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "rg_location" {
  type        = string
  description = "Location of the resource group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "vnet_address" {
  type        = string
  description = "Address of the virtual network"
}

variable "snet_name" {
  type        = string
  description = "Name of the subnet1"
}

variable "snet_prefixes" {
  type        = string
  description = "Prefixes of the subnet1"
}

variable "vm_size" {
  type        = string
  description = "VM size"
}

variable "computer_name" {
  type        = string
  description = "Computer name"
}

variable "image_SKU" {
  type        = string
  description = "Image SKU"
}

variable "admin_username" {
  type        = string
  description = "Username of the admin"
}

variable "admin_password" {
  type        = string
  description = "Password of the admin"
  #sensitive   = true
}

variable "domain_name_label" {
  type        = string
  description = "DNS"
}

variable "my_disk_name" {
  type        = string
  description = "Name of os_disk"
}

variable "storage_account_type" {
  type        = string
  description = "Storage account type for os_disk"
}

variable "my_PublicIP_name" {
  type        = string
  description = "Name of Public IP"
}

variable "my_NetworkSecurityGroup_name" {
  type        = string
  description = "Name of NSG"
}

variable "my_nic_name" {
  type        = string
  description = "Name of NIC"
}

variable "my_configuration_name" {
  type        = string
  description = "Name of NIC's configuration"
}

variable "secrule_name1" {
  type        = string
  description = "Name of security rule number 1"
}

variable "secrule_name2" {
  type        = string
  description = "Name of security rule number 2"
}

variable "ext_name" {
  type        = string
  description = "Name of VM extensions"
}


