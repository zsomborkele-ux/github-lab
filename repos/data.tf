data "terraform_remote_state" "base" {
  backend = "pg"

  config = {
    conn_str    = var.base_pg_conn_str
    schema_name = "terraform_state_base"
  }
}