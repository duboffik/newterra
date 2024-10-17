# List of App Services
app_services = {
  app1 = {
    name                  = "cmaz-927242a5-mod5-app-01"
    app_service_plan_name = "cmaz-927242a5-mod5-asp-01"
    rg_name               = "cmaz-927242a5-mod5-rg-01"
    kind                  = "Windows"
    tier                  = "Standard"
    size                  = "S1"
    description           = "App Service in East Canada"
  },
  app2 = {
    name                  = "cmaz-927242a5-mod5-app-02"
    app_service_plan_name = "cmaz-927242a5-mod5-asp-02"
    rg_name               = "cmaz-927242a5-mod5-rg-02"
    kind                  = "Windows"
    tier                  = "Standard"
    size                  = "S1"
    description           = "App Service in West US"
  }
}

# List of App Service plans
app_service_plans = {
  app_service_plan1 = {
    name         = "cmaz-927242a5-mod5-asp-01"
    rg_name      = "cmaz-927242a5-mod5-rg-01"
    os_type      = "Windows"
    sku_name     = "P0v3"
    worker_count = 2
    description  = "App Service Plan in East Canada"
  },
  app_service_plan2 = {
    name         = "cmaz-927242a5-mod5-asp-02"
    rg_name      = "cmaz-927242a5-mod5-rg-02"
    os_type      = "Windows"
    sku_name     = "P1v3"
    worker_count = 1
    description  = "App Service Plan in West US"
  }
}

# List of App Service IP restrictions
ip_restrictions = {
  "allow-verification-agent" = {
    action      = "Allow"
    ip_address  = "18.153.146.156/32" # Allowed IP address received from deploy
    priority    = 1100
    description = "Allow agent IP"
  }
}

# List of Resource groups
resource_groups = {
  rg_1 = {
    name        = "cmaz-927242a5-mod5-rg-01"
    location    = "canadaeast"
    description = "Resource Group in East Canada"
  },
  rg_2 = {
    name        = "cmaz-927242a5-mod5-rg-02"
    location    = "westus"
    description = "Resource Group in West US"
  },
  rg_3 = {
    name        = "cmaz-927242a5-mod5-rg-03"
    location    = "centralus"
    description = "Resource Group in Central US"
  }
}

# Tags
tags = {
  Creator = "name_surname@epam.com"
}

# List of App Service TAG restrictions
tag_restrictions = {
  "allow-tm" = {
    action      = "Allow"
    service_tag = "AzureTrafficManager"
    priority    = 1000
    description = "TAG restriction - Allow AzureTrafficManager"
  }
}

# Traffic Manager
traffic_manager = {
  profile_name           = "cmaz-927242a5-mod5-traf"
  rg_name                = "cmaz-927242a5-mod5-rg-03"
  traffic_routing_method = "Performance"
  monitor_port           = 80
  monitor_protocol       = "HTTP"
  monitor_path           = "/"
  dns_ttl                = "120"
  description            = "Configuration for Traffic Manager"

  traffic_manager_endpoints = [
    {
      name        = "webapp1"
      weight      = "100"
      description = "Endpoint of East Canada"
    },
    {
      name        = "webapp2"
      weight      = "100"
      description = "Endpoint of West US"
    },
  ]
}
