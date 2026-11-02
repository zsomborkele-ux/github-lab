variable "gh_token" {
  type = string
}

variable "base_pg_conn_str" {
  type        = string
  description = "Connection string for the base Terraform state database."
  sensitive   = true
}