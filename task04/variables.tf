variable "rg_name" {
  type        = string
  default     = "cmtr927242a5-rg"
  description = "Name of the Resource Group"
}

variable "rg_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group"
}

variable "vnet_name" {
  type        = string
  default     = "cmtr927242a5-vnet"
  description = "Name of the virtual network"
}

variable "vnet_address" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Address of the virtual network"
}

variable "snet_name" {
  type        = string
  default     = "public-subnet"
  description = "Name of the subnet1"
}

variable "snet_prefixes" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Prefixes of the subnet1"
}

variable "vm_size" {
  type        = string
  default     = "Standard_F2s_v2"
  description = "VM size"
}

variable "computer_name" {
  type        = string
  default     = "cmtr-927242a5-vm"
  description = "Computer name"
}

variable "image_SKU" {
  type        = string
  default     = "22_04-lts-gen2"
  description = "Image SKU"
}

variable "admin_username" {
  type        = string
  default     = "ddubovik"
  description = "Username of the admin"
}

variable "admin_password" {
  type        = string
  description = "Password of the admin"
  default     = "Just_test_password_without_sensitivity1"
  #sensitive   = true
}

variable "domain_name_label" {
  type        = string
  default     = "cmtr-927242a5-nginx"
  description = "DNS"
}

variable "my_disk_name" {
  type        = string
  default     = "my_disk_name"
  description = "Name of os_disk"
}

variable "storage_account_type" {
  type        = string
  default     = "Standard_LRS"
  description = "Storage account type for os_disk"
}

variable "my_PublicIP_name" {
  type        = string
  default     = "cmtr-927242a5-publicip"
  description = "Name of Public IP"
}

variable "my_NetworkSecurityGroup_name" {
  type        = string
  default     = "cmtr-927242a5-nsg"
  description = "Name of NSG"
}

variable "my_nic_name" {
  type        = string
  default     = "cmtr-927242a5-nic"
  description = "Name of NIC"
}

variable "my_configuration_name" {
  type        = string
  default     = "my_nic_configuration"
  description = "Name of NIC's configuration"
}

variable "secrule_name1" {
  type        = string
  default     = "HTTP"
  description = "Name of security rule number 1"
}

variable "secrule_name2" {
  type        = string
  default     = "cmtr-22"
  description = "Name of security rule number 2"
}

variable "ext_name" {
  type        = string
  default     = "my_ext"
  description = "Name of VM extensions"
}


