variable "name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Resource Group should exist."
  type        = string
}

variable "tags" {
  description = "A mapping of tags that should be assigned to resources"
  type        = map(string)
}
