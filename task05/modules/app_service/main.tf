# Create App Service
resource "azurerm_windows_web_app" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.service_plan_id
  tags                = var.tags
  app_settings        = var.app_settings

  site_config {

    ip_restriction_default_action = "Deny"

    # Handle IP restrictions
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name        = ip_restriction.key
        action      = ip_restriction.value.action
        ip_address  = ip_restriction.value.ip_address != "" ? ip_restriction.value.ip_address : "${var.ip}/32"
        description = ip_restriction.value.description
        priority    = ip_restriction.value.priority
      }
    }

    # Handle tag restrictions
    dynamic "ip_restriction" {
      for_each = var.tag_restrictions
      content {
        name        = ip_restriction.key
        action      = ip_restriction.value.action
        service_tag = ip_restriction.value.service_tag
        priority    = ip_restriction.value.priority
        description = ip_restriction.value.description
      }
    }
  }
}
