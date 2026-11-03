data "github_organization" "org" {
  name         = "gh-lab-zkele"
  summary_only = true
}

data "github_organization_teams" "all" {}