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