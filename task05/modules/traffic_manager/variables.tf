variable "rg_name" {
  description = "The name of the resource group in which to create the Traffic Manager profile."
  type        = string
}

variable "profile_name" {
  description = "The name of the Traffic Manager profile."
  type        = string
}

variable "traffic_routing_method" {
  description = " Specifies the algorithm used to route traffic."
  type        = string
}

variable "dns_ttl" {
  description = "The TTL value of the Profile used by Local DNS resolvers and clients."
  type        = number
  default     = 60
}

variable "max_return" {
  description = "The amount of endpoints to return for DNS queries to this Profile."
  type        = number
  default     = 3
}
variable "monitor_protocol" {
  description = "The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP."
  type        = string
}

variable "monitor_port" {
  description = "The port number used by the monitoring checks."
  type        = number
}

variable "monitor_path" {
  description = "The path used by the monitoring checks."
  type        = string
}

variable "target_resource_ids" {
  description = "The ID of the Azure Resource which should be used as a target."
  type        = list(any)
}
variable "traffic_manager_endpoints" {
  description = "The endpoint of the thaffic manager."
  type        = list(any)
}
variable "tags" {
  description = "A mapping of tags that should be assigned to resources"
  type        = map(string)
  default     = {}
}
