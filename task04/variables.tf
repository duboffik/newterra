variable "domain_name_label" {
  type        = string
  description = "Domain name label"
}

variable "location" {
  type        = string
  description = "The Azure Region where the Resource Group and Resources should exist"
}

variable "nic_name" {
  type        = string
  description = "Name of the Network interface"
}

variable "nic_ip_conf_name" {
  type        = string
  description = "Name of NIC's configuration"
}

variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group"
}

variable "nsg_rule_http" {
  type        = string
  description = "Name of the security rule for HTTP"
}

variable "nsg_rule_ssh" {
  type        = string
  description = "Name of the security rule for SSH"
}

variable "public_ip" {
  type        = string
  description = "Name of the Public IP"
}

variable "rg_name" {
  type        = string
  description = "The Name which should be used for this Resource Group"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "The address prefixes to use for the private subnet"
}

variable "tags" {
  description = "A mapping of tags that should be assigned to resources"
  type        = map(string)
  default     = {}
}

variable "vm_disk_name" {
  type        = string
  description = "Name of the os_disk"
}

variable "vm_image_offer" {
  type        = string
  description = "Image SKU"
}

variable "vm_image_publisher" {
  type        = string
  description = "Image SKU"
}

variable "vm_image_SKU" {
  type        = string
  description = "Image SKU"
}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "vm_password" {
  type        = string
  sensitive   = "true"
  description = "Password for the admin"
}

variable "vm_sa_type" {
  type        = string
  description = "Storage account type for os_disk"
}

variable "vm_size" {
  type        = string
  description = "VM size"
}

variable "vm_username" {
  type        = string
  description = "Username for the admin"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}
