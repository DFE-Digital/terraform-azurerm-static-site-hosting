variable "environment" {
  description = "Environment name. Will be used along with `project_name` as a prefix for all resources."
  type        = string
}

variable "project_name" {
  description = "Project name. Will be used along with `environment` as a prefix for all resources."
  type        = string
}

variable "azure_location" {
  description = "Azure location in which to launch resources."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {}
}

variable "existing_resource_group" {
  description = "Conditionally launch resources into an existing resource group. Specifying this will NOT create a resource group."
  type        = string
  default     = ""
}

variable "deployment_type" {
  description = "Use either 'StaticWebApp' (for advanced options using staticwebapp.config.json and custom domain) or 'Storage'"
  type        = string
  default     = "Storage"
}

variable "custom_domain" {
  description = "Custom domain for Static Web App"
  type        = string
  default     = ""
}
