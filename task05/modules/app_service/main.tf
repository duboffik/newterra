# Create App Service
resource "azurerm_windows_web_app" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.service_plan_id
  tags                = var.tags
  app_settings        = var.app_settings

  site_config {

    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name       = ip_restriction.key
        action     = ip_restriction.value["action"]
        ip_address = ip_restriction.value["ip_address"]
        priority   = ip_restriction.value["priority"]
      }
    }

    dynamic "ip_restriction" {
      for_each = var.tag_restrictions
      content {
        name        = ip_restriction.key
        action      = ip_restriction.value["action"]
        service_tag = ip_restriction.value["service_tag"]
        priority    = ip_restriction.value["priority"]
      }
    }

  }
}
