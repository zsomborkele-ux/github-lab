terraform {
  backend "pg" {
    schema_name = "terraform_state_base"
  }
}

provider "github" {
  owner = "gh-lab-zkele"
  token = var.gh_token
}