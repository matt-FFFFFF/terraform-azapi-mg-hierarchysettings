variable "tenant_root_group_name" {
  type = string
  validation {
    condition     = can(regex("^[a-f\\d]{4}(?:[a-f\\d]{4}-){4}[a-f\\d]{12}$", var.tenant_id))
    error_message = "The value must be a UUID."
    description = "Usually the Azure AD tenant id - also the name of the tenant root management group"
  }
}

variable "update_existing" {
  type = bool
  default = false
  description = "Enable this if the hierarchy settings object already exists and you want to manage it with this module without running `terraform import`."
}

variable "default_management_group_name" {
  type = string
  condition = can(regex("^[a-zA-Z0-9_-().]{90}$"))
  description = "The name of the default management group. This is where all newly created subscriptions will be placed unless specified otherwise."
}

variable "" {
  type = bool
  description = "By default, all Azure Active Directory security principals can create new management groups. When this setting is turned on, security principals must have management group write access to create new management groups."
}
