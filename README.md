# terraform-azapi-mg-hierarchysettings

Terraform module for creation and management of Azure [management group hierarchy settings][msft_docs_mg_hierarchy_settings].
Uses the new [`Azure/azapi`](https://github.com/Azure/terraform-provider-azapi) provider.


## Usage

```terraform
module "hierarchy_settings" {
  source                                   = "https://github.com/matt-FFFFFF/terraform-azapi-mg-hierarchysettings.git"
  tenant_root_group_name                   = "ca5dcea8-e3e5-4aa2-9daa-629c40251888"
  default_management_group_name            = "Sandboxes"
  require_authorization_for_group_creation = true
}
````

## Variables

```terraform
variable "tenant_root_group_name" {
  type = string
  validation {
    condition     = can(regex("^[a-f\\d]{4}(?:[a-f\\d]{4}-){4}[a-f\\d]{12}$", var.tenant_id))
    error_message = "The value must be a UUID."
    description   = "Usually the Azure AD tenant id - also the name of the tenant root management group"
  }
}

variable "update_existing" {
  type        = bool
  default     = false
  description = "Enable this if the hierarchy settings object already exists and you want to manage it with this module without running `terraform import`."
}

variable "default_management_group_name" {
  type        = string
  condition   = can(regex("^[a-zA-Z0-9_-().]{90}$"))
  description = "The name of the default management group. This is where all newly created subscriptions will be placed unless specified otherwise."
}

variable "require_authorization_for_group_creation" {
  type        = bool
  description = "By default, all Azure Active Directory security principals can create new management groups. When this setting is turned on, security principals must have management group write access to create new management groups."
}
```

[msft_docs_mg_hierarchy_settings]: https://docs.microsoft.com/azure/governance/management-groups/how-to/protect-resource-hierarchy "Microsoft docs - how to protect your resource hierarchy"
