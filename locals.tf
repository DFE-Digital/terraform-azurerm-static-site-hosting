locals {
  environment             = var.environment
  project_name            = var.project_name
  resource_prefix         = "${local.environment}${local.project_name}"
  existing_resource_group = var.existing_resource_group
  # resource_group = local.existing_resource_group == "" ? azurerm_resource_group.default[0] : data.azurerm_resource_group.existing_resource_group[0]
  azure_location = var.azure_location
  tags           = var.tags
}
