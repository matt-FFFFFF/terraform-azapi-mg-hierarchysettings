# terraform-azapi-mg-hierarchysettings

Terraform module for creation and management of Azure [management group hierarchy settings][msft_docs_mg_hierarchy_settings].
Uses the new [`Azure/azapi`](https://github.com/Azure/terraform-provider-azapi) provider.

See documentation on the [Terraform module registry][tf_module_registry].

## Usage

Example usage alongside Hashicorp's [AzureRM](https://github.com/hashicorp/terraform-provider-azurerm) Terraform provider:

```terraform

data "azurerm_client_config" "current" {}

module "hierarchy_settings" {
  source                                   = "matt-FFFFFF/mg-hierarchysettings/azapi"
  tenant_root_group_name                   = data.azurerm_client_config.current.tenant_id
  default_management_group_name            = "Sandboxes"
  require_authorization_for_group_creation = true
}
````

[msft_docs_mg_hierarchy_settings]: https://docs.microsoft.com/azure/governance/management-groups/how-to/protect-resource-hierarchy "Microsoft docs - how to protect your resource hierarchy"
[tf_module_registry]: https://registry.terraform.io/modules/matt-FFFFFF/mg-hierarchysettings/azapi/latest
