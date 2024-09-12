# List of Resource groups
resource_groups = {
  rg_1 = {
    name        = "cmaz-12345678-mod5-location1-rg"
    location    = "canadaeast"
    description = "Resource group in location1 Description"
  },
  rg_2 = {
    name        = "cmaz-12345678-mod5-location2-rg"
    location    = "westus"
    description = "Resource group in location2 Description"
  },
  rg_3 = {
    name        = "cmaz-12345678-mod5-location3-rg"
    location    = "centralus"
    description = "Resource group in location3 Description"
  }
}

# List of App Service plans
app_service_plans = {
  app_service_plan1 = {
    name         = "cmaz-12345678-mod5-location1-asp"
    rg_name      = "cmaz-12345678-mod5-location1-rg"
    os_type      = "Windows"
    sku_name     = "S1"
    worker_count = 2
    description  = "App Service Plan in location1 Description"
  },
  app_service_plan2 = {
    name         = "cmaz-12345678-mod5-location2-asp"
    rg_name      = "cmaz-12345678-mod5-location2-rg"
    os_type      = "Windows"
    sku_name     = "S1"
    worker_count = 1
    description  = "App Service Plan in location2 Description"
  }
}

# List of App Services
app_services = {
  app1 = {
    name                  = "cmaz-12345678-mod5-location1-app"
    app_service_plan_name = "cmaz-12345678-mod5-location1-asp"
    rg_name               = "cmaz-12345678-mod5-location1-rg"
    kind                  = "Windows"
    tier                  = "Standard"
    size                  = "S1"
    description           = "App Service in location1 Description"
  },
  app2 = {
    name                  = "cmaz-12345678-mod5-location2-app"
    app_service_plan_name = "cmaz-12345678-mod5-location2-asp"
    rg_name               = "cmaz-12345678-mod5-location2-rg"
    kind                  = "Windows"
    tier                  = "Standard"
    size                  = "S1"
    description           = "App Service in location2 Description"
  }
}

# List of App Service IP restrictions
ip_restrictions = {
  "deny-all" = {
    action      = "Deny"
    ip_address  = "0.0.0.0/0"
    priority    = 65000
    description = "Deny all IP addresses Description"
  },
  "allow-student-ip" = {
    action      = "Allow"
    ip_address  = ""
    priority    = 1100
    description = "Allow student IP Description"
  }
}

# List of App Service TAG restrictions
tag_restrictions = {
  "allow-tmp" = {
    action      = "Allow"
    service_tag = "AzureTrafficManager"
    priority    = 1000
    description = "TAG restriction - Allow AzureTrafficManager Description"
  }
}

# Tags
tags = {
  Creator = "name_surname@epam.com"
}

# Traffic Manager
traffic_manager = {
  profile_name           = "cmaz-12345678-mod5-location3-traf"
  rg_name                = "cmaz-12345678-mod5-location3-rg"
  traffic_routing_method = "Performance"
  monitor_port           = 80
  monitor_protocol       = "HTTP"
  monitor_path           = "/"
  dns_ttl                = "120"
  description            = "Traffic Manager Description"

  traffic_manager_endpoints = [
    {
      name        = "tmendpointlocation1"
      weight      = "100"
      description = "Eastern US Endpoint Description"
    },
    {
      name        = "tmendpointlocation2"
      weight      = "100"
      description = "Western US Endpoint Description"
    },
  ]
}

