
locals {
  default_management_group_resource_id           = "${local.management_group_resource_provider_prefix}${var.default_management_group_name}"
  deploy_azapi_resource                          = !var.update_existing
  deploy_azapi_update_resource                   = var.update_existing
  hierarchy_settings_object_name                 = "default"
  hierarchy_settings_object_type_and_api_version = "Microsoft.Management/managementGroups/settings@2021-04-01"
  management_group_resource_provider_prefix      = "/providers/Microsoft.Management/managementGroups/"
  tenant_root_group_resource_id                  = "${local.management_group_resource_provider_prefix}${var.tenant_root_group_name}"
}
