resource "azurerm_storage_account" "static_site" {
  name                       = "${replace(local.resource_prefix, "-", "")}web"
  resource_group_name        = local.resource_group.name
  location                   = local.resource_group.location
  account_tier               = "Standard"
  account_replication_type   = "GRS"
  min_tls_version            = "TLS1_2"
  https_traffic_only_enabled = true

  tags = local.tags
}

resource "azurerm_storage_account_static_website" "static_site" {
  storage_account_id = azurerm_storage_account.static_site.id
  error_404_document = "404.html"
  index_document     = "index.html"
}

resource "azurerm_storage_blob" "static_site_index_html" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.static_site.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/default-site/index.html"
  content_type           = "text/html"

  lifecycle {
    ignore_changes = [
      content_md5,
    ]
  }
}

resource "azurerm_storage_blob" "static_site_404_html" {
  name                   = "404.html"
  storage_account_name   = azurerm_storage_account.static_site.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/default-site/404.html"
  content_type           = "text/html"

  lifecycle {
    ignore_changes = [
      content_md5,
    ]
  }
}
