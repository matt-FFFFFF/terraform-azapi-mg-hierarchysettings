resource "azapi_resource" "hierarchy_settings" {
  count     = local.deploy_azapi_resource ? 1 : 0
  type      = local.hierarchy_settings_object_type_and_api_version
  name      = local.hierarchy_settings_object_name
  parent_id = local.tenant_root_group_resource_id
  body = jsonencode({
    properties = {
      defaultManagementGroup               = local.default_management_group_resource_id
      requireAuthorizationForGroupCreation = var.require_authorization_for_group_creation
    }
  })
}

resource "azapi_update_resource" "hierarchy_settings" {
  count     = local.deploy_azapi_update_resource ? 1 : 0
  type      = local.hierarchy_settings_object_type_and_api_version
  name      = local.hierarchy_settings_object_name
  parent_id = local.tenant_root_group_resource_id
  body = jsonencode({
    properties = {
      defaultManagementGroup               = local.default_management_group_resource_id
      requireAuthorizationForGroupCreation = var.require_authorization_for_group_creation
    }
  })
}
