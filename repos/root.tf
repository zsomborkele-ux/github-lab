terraform {
  backend "pg" {
    schema_name = "terraform_state_repos"
  }
}

provider "github" {
  owner = "gh-lab-zkele"
  token = var.gh_token
}