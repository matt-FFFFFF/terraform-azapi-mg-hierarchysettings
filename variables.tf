variable "tenant_root_group_name" {
  type        = string
  description = "Usually the Azure AD tenant id - also the name of the tenant root management group."
  validation {
    condition     = can(regex("^[a-f\\d]{4}(?:[a-f\\d]{4}-){4}[a-f\\d]{12}$", var.tenant_root_group_name))
    error_message = "The value must be a UUID."
  }
}

variable "update_existing" {
  type        = bool
  default     = false
  description = "Enable this if the hierarchy settings object already exists and you want to manage it with this module without running `terraform import`."
}

variable "default_management_group_name" {
  type        = string
  description = "The name of the default management group. This is where all newly created subscriptions will be placed unless specified otherwise."
  validation {
    condition     = can(regex("^[a-zA-Z0-9_-().]{90}$", var.default_management_group_name))
    error_message = "Name must be a maximum of 90 characters, consistying of: a-z, A-Z, 0-9, _, -, (, )."
  }
}

variable "require_authorization_for_group_creation" {
  type        = bool
  description = "By default, all Azure Active Directory security principals can create new management groups. When this setting is turned on, security principals must have management group write access to create new management groups."
}
