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