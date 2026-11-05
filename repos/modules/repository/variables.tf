variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "homepage" {
  type    = string
  default = ""
}

variable "private" {
  type    = bool
  default = false
}

variable "has_issues" {
  type    = bool
  default = false
}

variable "has_projects" {
  type    = bool
  default = false
}

variable "has_wiki" {
  type    = bool
  default = false
}

variable "default_branch" {
  type    = string
  default = "main"
}

variable "allow_squash_merge" {
  type    = bool
  default = true
}

variable "allow_merge_commit" {
  type    = bool
  default = true
}

variable "allow_rebase_merge" {
  type    = bool
  default = true
}

variable "delete_branch_on_merge" {
  type    = bool
  default = true
}

variable "vulnerability_alerts" {
  type    = bool
  default = null
}

variable "auto_init" {
  type    = bool
  default = null
}

variable "branches" {
  type = list(object({
    name                         = string
    requiresApprovingReviews     = optional(bool, true)
    requiredApprovingReviewCount = optional(number, 1)
    dismissesStaleReviews        = optional(bool, false)
    requiresCodeOwnerReviews     = optional(bool, false)
    requiresStatusChecks         = optional(bool, false)
    requiredStatusCheckContexts  = optional(set(string), [])
    requiresStrictStatusChecks   = optional(bool, false)
    requiresCommitSignatures     = optional(bool, false)
    restrictsPushes              = optional(bool, false)
    pushActorIds                 = optional(set(string), [])
    isAdminEnforced              = optional(bool, false)
  }))
  default = []
}

variable "teams" {
  type = list(object({
    name        = string
    permissions = string
  }))
  default = []
}

variable "organization_secrets" {
  type    = list(string)
  default = []
}

variable "repository_secrets" {
  type      = map(string)
  sensitive = true
  default   = {}
}
