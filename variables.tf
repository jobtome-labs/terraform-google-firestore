variable "project" {
  type        = string
  description = "(Optional) The ID of the Project in which the resource belongs. Defaults to `jobtome-platform`."

  default = "jobtome-platform"
}

variable "name" {
  type        = string
  description = "(Required) The ID to use for the Database, which will become the final component of the Database's Resource Name."

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,61}[a-z0-9]$", var.name))
    error_message = "Validation Error: The Value should be 4-63 characters long. Valid Characters are `/[a-z][0-9]-/`, with First Character a Letter and the Last Character a Letter or Number."
  }
}

variable "location_id" {
  type        = string
  description = "(Required) The Location of the Database."
}

variable "type" {
  type        = string
  description = "(Optional) The Type of the Database. Defaults to `FIRESTORE_NATIVE`."

  validation {
    condition     = contains(["FIRESTORE_NATIVE", "DATASTORE_MODE"], var.type)
    error_message = "Allowed Types: [\"FIRESTORE_NATIVE\", \"DATASTORE_MODE\"]."
  }

  default = "FIRESTORE_NATIVE"
}

variable "concurrency_mode" {
  type        = string
  description = "(Optional) The Concurrency Control Mode to use for this Database."

  validation {
    condition     = contains(["OPTIMISTIC", "PESSIMISTIC", "OPTIMISTIC_WITH_ENTITY_GROUPS"], var.concurrency_mode)
    error_message = "Allowed Concurrency Control Modes: [\"OPTIMISTIC\", \"PESSIMISTIC\", \"OPTIMISTIC_WITH_ENTITY_GROUPS\"]."
  }

  default = null
}

variable "delete_protection_state" {
  type        = string
  description = "(Optional) State of Delete Protection for this Database. Defaults to `DELETE_PROTECTION_ENABLED`."

  validation {
    condition     = contains(["DELETE_PROTECTION_STATE_UNSPECIFIED", "DELETE_PROTECTION_DISABLED", "DELETE_PROTECTION_ENABLED"], var.delete_protection_state)
    error_message = "Allowed Delete Protection States: [\"DELETE_PROTECTION_STATE_UNSPECIFIED\", \"DELETE_PROTECTION_DISABLED\", \"DELETE_PROTECTION_ENABLED\"]."
  }

  default = "DELETE_PROTECTION_ENABLED"
}

variable "deletion_policy" {
  type        = string
  description = "(Optional) Deletion Behavior for this Database. Defaults to `DELETE`."

  validation {
    condition     = contains(["DELETE", "ABANDON"], var.deletion_policy)
    error_message = "Allowed Deletion Behaviors: [\"DELETE\", \"ABANDON\"]."
  }

  default = "DELETE"
}
