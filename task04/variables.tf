#my_variables
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

variable "subnet_name" {
  type        = string
  description = "Name of the subnet1"
}

variable "subnet_prefixes" {
  type        = string
  description = "Prefixes of the subnet1"
}

variable "vm_size" {
  type        = string
  description = "VM size"
}

variable "vm_name" {
  type        = string
  description = "VM name"
}

variable "image_SKU" {
  type        = string
  description = "Image SKU"
}

variable "linux_admin" {
  type        = string
  description = "Username of the admin"
}

variable "domain_name_label" {
  type        = string
  default     = "cmtr-927242a5-nginx"
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

variable "public_ip" {
  type        = string
  description = "Name of Public IP"
}

variable "nsg_name" {
  type        = string
  description = "Name of NSG"
}

variable "nic_name" {
  type        = string
  description = "Name of NIC"
}

variable "my_configuration_name" {
  type        = string
  description = "Name of NIC's configuration"
}

variable "nsg_rule_http" {
  type        = string
  description = "Name of security rule HTTP"
}

variable "nsg_rule_ssh" {
  type        = string
  description = "Name of security rule SSH"
}

variable "ext_name" {
  type        = string
  description = "Name of VM extensions"
}
