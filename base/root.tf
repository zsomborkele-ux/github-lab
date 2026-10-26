terraform {}

provider "github" {
  owner = "gh-lab-zkele"
  token = var.gh_token
}