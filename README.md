# terraform-azapi-mg-hierarchysettings

Terraform module for creation and management of Azure [management group hierarchy settings][msft_docs_mg_hierarchy_settings].
Uses the new [`Azure/azapi`](https://github.com/Azure/terraform-provider-azapi) provider.

See documentation on the [Terraform module registry][tf_module_registry].

## Usage

```terraform
module "hierarchy_settings" {
  source                                   = "https://github.com/matt-FFFFFF/terraform-azapi-mg-hierarchysettings.git"
  tenant_root_group_name                   = "ca5dcea8-e3e5-4aa2-9daa-629c40251888"
  default_management_group_name            = "Sandboxes"
  require_authorization_for_group_creation = true
}
````

[msft_docs_mg_hierarchy_settings]: https://docs.microsoft.com/azure/governance/management-groups/how-to/protect-resource-hierarchy "Microsoft docs - how to protect your resource hierarchy"
[tf_module_registry]: https://registry.terraform.io/modules/matt-FFFFFF/mg-hierarchysettings/azapi/latest
