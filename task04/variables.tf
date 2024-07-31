#my_variables
variable "rg_name" {
  type        = string
  description = "The Name which should be used for this Resource Group"
}

variable "location" {
  type        = string
  description = "The Azure Region where the Resource Group and Resources should exist"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "vnet_address" {
  type        = string
  description = "The address space that is used the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "subnet_prefixes" {
  type        = string
  description = "The address prefixes to use for the private subnet"
}

variable "public_ip" {
  type        = string
  description = "Name of the Public IP"
}

variable "domain_name_label" {
  type        = string
  description = "Domain name label"
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

variable "nic_name" {
  type        = string
  description = "Name of the Network interface"
}

variable "ip_conf_name" {
  type        = string
  description = "Name of NIC's configuration"
}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}
variable "vm_size" {
  type        = string
  description = "VM size"
}

variable "image_publisher" {
  type        = string
  description = "Image SKU"
}

variable "image_offer" {
  type        = string
  description = "Image SKU"
}

variable "image_SKU" {
  type        = string
  description = "Image SKU"
}

variable "disk_name" {
  type        = string
  description = "Name of the os_disk"
}

variable "sa_type" {
  type        = string
  description = "Storage account type for os_disk"
}

variable "linux_username" {
  type        = string
  description = "Username for the admin"
}

variable "linux_password" {
  type        = string
  sensitive   = "true"
  description = "Password for the admin"
}

variable "tags" {
  description = "A mapping of tags that should be assigned to resources"
  type        = map(string)
  default     = {}
}
