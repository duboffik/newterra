variable "name" {
  description = "The name which should be used for this Windows Web App."
  type        = string
}

variable "rg_name" {
  description = "The name of the Resource Group where the Windows Web App should exist."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Windows Web App should exist."
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the Service Plan that this Windows App Service will be created in."
  type        = string
}

variable "site_config" {
  description = "The block that contains the configuration of the Windows App Service."
  type        = any
}

variable "app_settings" {
  description = "A map of key-value pairs of App Settings."
  type        = map(string)
}

variable "ip_restrictions" {
  description = "Map of IP restrictions for the App Service"
  type = map(object({
    action      = string
    ip_address  = string
    priority    = number
    description = string
  }))
}

variable "tag_restrictions" {
  description = "The block that contains tag restritions of the Windows App Service."
  type = map(object({
    action      = string
    service_tag = string
    priority    = number
    description = string
  }))
}
variable "tags" {
  description = "A mapping of tags that should be assigned to resources"
  type        = map(string)
}
