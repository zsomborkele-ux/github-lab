variable "gh_token" {
  type = string
}

variable "username" {
  type        = string
  description = "Dummy API username"
  sensitive   = true
}

variable "password" {
  type        = string
  description = "Dummy API password"
  sensitive   = true
}

variable "teams" {
  type = map(object({
    privacy     = string
    description = optional(string)
  }))
  description = "Teams to manage, keyed by team name."
}

variable "devops_team_membership" {
  type = list(string)
}

variable "nodejs_team_membership" {
  type = list(string)
}

variable "security_team_membership" {
  type = list(string)
}