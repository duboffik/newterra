# List of Resource groups
resource_groups = {
  rg_1 = {
    name        = "cmaz-12345678-mod5-eaus-rg"
    location    = "eastus"
    description = "Resource group in East US Description"
  },
  rg_2 = {
    name        = "cmaz-12345678-mod5-weus-rg"
    location    = "westus"
    description = "Resource group in West US Description"
  },
  rg_3 = {
    name        = "cmaz-12345678-mod5-ceus-rg"
    location    = "centralus"
    description = "Resource group in Central US Description"
  }
}

# List of App Service plans
app_service_plans = {
  "app_service_plan1" : {
    "name" : "cmaz-12345678-mod5-eaus-asp",
    "rg_name" : "cmaz-12345678-mod5-eaus-rg",
    "os_type" : "Windows",
    "sku_name" : "S1",
    "worker_count" : 2,
    "description" : "App Service Plan in East US Description"
  },
  "app_service_plan2" : {
    "name" : "cmaz-12345678-mod5-weus-asp",
    "rg_name" : "cmaz-12345678-mod5-weus-rg",
    "os_type" : "Windows",
    "sku_name" : "S1",
    "worker_count" : 1,
    "description" : "App Service Plan in West US Description"
  }
}

# List of App Services
app_services = {
  app1 = {
    name                  = "cmaz-12345678-mod5-eaus-app"
    app_service_plan_name = "cmaz-12345678-mod5-eaus-asp"
    rg_name               = "cmaz-12345678-mod5-eaus-rg"
    kind                  = "Windows"
    tier                  = "Standard"
    size                  = "S1"
    description           = "App Service in East US Description"
  },
  app2 = {
    name                  = "cmaz-12345678-mod5-weus-app"
    app_service_plan_name = "cmaz-12345678-mod5-weus-asp"
    rg_name               = "cmaz-12345678-mod5-weus-rg"
    kind                  = "Windows"
    tier                  = "Standard"
    size                  = "S1"
    description           = "App Service in West US Description"
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
    ip_address  = "195.56.119.209/32"
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

# Traffic Manager
traffic_manager = {
  profile_name           = "cmaz-12345678-mod5-ceus-traf"
  rg_name                = "cmaz-12345678-mod5-ceus-rg"
  traffic_routing_method = "Performance"
  monitor_port           = 80
  monitor_protocol       = "HTTP"
  monitor_path           = "/"
  dns_ttl                = "120"
  description            = "Traffic Manager Description"

  traffic_manager_endpoints = [
    {
      name        = "tmendpointeaus"
      weight      = "100"
      description = "Eastern US Endpoint Description"
    },
    {
      name        = "tmendpointweus"
      weight      = "100"
      description = "Western US Endpoint Description"
    },
  ]
}
