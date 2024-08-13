variable "resource_groups" {
  type        = map(any)
  description = "Resource_groups"
}

variable "app_service_plans" {
  type        = map(any)
  description = "App service plans"
}

variable "app_services" {
  type        = map(any)
  description = "App services"
}

variable "traffic_manager" {
  type        = map(any)
  description = "Traffic manager"
}

variable "ip_restrictions" {
  type        = map(any)
  description = "IP restrictions"
}

variable "tag_restrictions" {
  type        = map(any)
  description = "Tag restrictions"
}
