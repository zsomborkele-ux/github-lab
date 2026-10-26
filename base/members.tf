resource "github_team" "devops_team" {
  name    = "devops-team"
  privacy = "secret"
}

resource "github_team" "nodejs_team" {
  name    = "nodejs-team"
  privacy = "secret"
}

resource "github_membership" "zkele1" {
  username = "zkele1"
  role     = "member"
}

resource "github_team_membership" "zkele1_devops_team" {
  team_id  = github_team.devops_team.id
  username = github_membership.zkele1.username
  role     = "member"
}
