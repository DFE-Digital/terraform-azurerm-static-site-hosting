resource "azurerm_static_web_app" "static_site" {
  count = local.deployment_type.is_static_web_app ? 1 : 0

  name                = "${local.resource_prefix}swa"
  resource_group_name = local.resource_group.name
  location            = local.resource_group.location

  sku_tier = "Standard"
  sku_size = "Standard"
}

resource "azurerm_static_web_app_custom_domain" "static_site" {
  count = local.deployment_type.is_static_web_app && local.custom_domain != "" ? 1 : 0

  static_web_app_id = azurerm_static_web_app.static_site[0].id
  domain_name       = local.custom_domain

  validation_type = "cname-delegation"
}
