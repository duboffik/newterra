variable "app_service_plans" {
  type = map(object({
    name         = string
    rg_name      = string
    os_type      = string
    sku_name     = string
    worker_count = number
    description  = string
  }))
  description = "A map of Azure App Service Plan configurations"
}

variable "app_services" {
  type = map(object({
    name                  = string
    app_service_plan_name = string
    rg_name               = string
    kind                  = string
    tier                  = string
    size                  = string
    description           = string
  }))
  description = "A map of Azure App Service configurations"
}

variable "ip" {
  description = "Student IP address"
  type        = string
}

variable "ip_restrictions" {
  type = map(object({
    action      = string
    ip_address  = string
    priority    = number
    description = string
  }))
  description = "A map of IP restrictions configurations"
}

variable "resource_groups" {
  type = map(object({
    name        = string
    location    = string
    description = string
  }))
  description = "A map of resource group objects"
}

variable "tag_restrictions" {
  type = map(object({
    action      = string
    service_tag = string
    priority    = number
    description = string
  }))
  description = "A map of TAG-based restrictions configurations"
}

variable "tags" {
  description = "A mapping of tags that should be assigned to resources"
  type        = map(string)
}

variable "traffic_manager" {
  type = object({
    profile_name           = string
    rg_name                = string
    traffic_routing_method = string
    monitor_port           = number
    monitor_protocol       = string
    monitor_path           = string
    dns_ttl                = string
    description            = string

    traffic_manager_endpoints = list(object({
      name        = string
      weight      = number
      description = string
    }))
  })
  description = "Configuration object for the Azure Traffic Manager including endpoints"
}
