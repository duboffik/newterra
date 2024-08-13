output "app_service_plan_id" {
  value       = azurerm_service_plan.main.id
  description = "ID of the app service plan."
}
